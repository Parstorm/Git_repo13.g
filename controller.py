"""Qt controller for the live camera, photo capture, and ML inference."""

from __future__ import annotations

import os
from datetime import datetime
from pathlib import Path

from PyQt6.QtCore import QObject, QThread, pyqtSignal, pyqtSlot
from PyQt6.QtMultimedia import QCamera, QImageCapture, QMediaCaptureSession, QMediaDevices

from main import DEFAULT_CLASS_NAMES, DEFAULT_MODEL_PATH, classify_image


class InferenceWorker(QObject):
    """Run PyTorch inference off the GUI thread."""

    finished = pyqtSignal(object)
    failed = pyqtSignal(str)

    def __init__(self, image_path: str, model_path: str | None, parent: QObject | None = None):
        super().__init__(parent)
        self.image_path = image_path
        self.model_path = model_path

    @pyqtSlot()
    def run(self) -> None:
        try:
            result = classify_image(
                self.image_path,
                model_path=self.model_path,
                class_names=DEFAULT_CLASS_NAMES,
            )
            self.finished.emit(result)
        except Exception as exc:  # keep the UI alive on ML/configuration errors
            self.failed.emit(str(exc))


class Controller(QObject):
    """Single QML-facing hub for camera + capture + classification."""

    scanCompleted = pyqtSignal(str)
    scanResultReady = pyqtSignal(str, float, str)
    statusChanged = pyqtSignal(str)
    errorOccurred = pyqtSignal(str)
    busyChanged = pyqtSignal(bool)

    def __init__(self, parent: QObject | None = None):
        super().__init__(parent)

        self.camera = QCamera(self)
        self.captureSession = QMediaCaptureSession(self)
        self.imageCapture = QImageCapture(self)
        self.captureSession.setCamera(self.camera)
        self.captureSession.setImageCapture(self.imageCapture)

        self.capture_dir = Path(
            os.environ.get("TRASH_CAPTURE_DIR", str(Path(__file__).resolve().parent / "captures"))
        ).expanduser().resolve()
        self.model_path = os.environ.get("TRASH_MODEL_PATH", str(DEFAULT_MODEL_PATH))

        self.last_image_path = ""
        self.last_result_label = ""
        self.last_confidence = 0.0
        self.last_status = "Camera initialising…"
        self._capture_id_to_path: dict[int, str] = {}
        self._busy = False
        self._inference_thread: QThread | None = None
        self._inference_worker: InferenceWorker | None = None

        self.imageCapture.imageSaved.connect(self._on_image_saved)
        self.imageCapture.errorOccurred.connect(self._on_capture_error)
        self.camera.errorOccurred.connect(self._on_camera_error)
        self.camera.activeChanged.connect(self._on_camera_active_changed)

        self._select_default_camera()

    # --- QML-visible read-only-ish properties ---
    def _select_default_camera(self) -> None:
        cameras = QMediaDevices.videoInputs()
        if not cameras:
            self._set_status("No camera detected")
            self.errorOccurred.emit(
                "Qt cannot see a camera. Check the camera connection and OS camera permissions."
            )
            return
        self.camera.setCameraDevice(cameras[0])
        self._set_status(f"Camera ready: {cameras[0].description()}")

    def _set_status(self, message: str) -> None:
        self.last_status = message
        self.statusChanged.emit(message)
        print(f"[camera] {message}")

    def _set_busy(self, value: bool) -> None:
        if self._busy == value:
            return
        self._busy = value
        self.busyChanged.emit(value)

    @pyqtSlot(QObject)
    def attachVideoOutput(self, output: QObject) -> None:
        """Attach QML VideoOutput to the same capture session."""
        self.captureSession.setVideoOutput(output)

    @pyqtSlot()
    def startCamera(self) -> None:
        if not self.camera.cameraDevice().isNull():
            self.camera.start()
            self._set_status("Camera starting…")
        else:
            self._set_status("No camera available")

    @pyqtSlot()
    def stopCamera(self) -> None:
        if self.camera.isActive():
            self.camera.stop()
            self._set_status("Camera stopped")

    @pyqtSlot(result=bool)
    def cameraAvailable(self) -> bool:
        return not self.camera.cameraDevice().isNull()

    @pyqtSlot(result=bool)
    def captureReady(self) -> bool:
        return self.imageCapture.isAvailable() and self.imageCapture.isReadyForCapture() and self.camera.isActive()

    @pyqtSlot()
    def capturePhoto(self) -> None:
        if self._busy:
            self._set_status("Already processing a photo…")
            return

        if not self.cameraAvailable():
            self.errorOccurred.emit("No camera is selected or available.")
            return
        if not self.camera.isActive():
            self.errorOccurred.emit("The camera is not running yet.")
            return
        if not self.imageCapture.isAvailable() or not self.imageCapture.isReadyForCapture():
            self.errorOccurred.emit("Camera is not ready to capture a photo yet. Try again in a moment.")
            return

        self.capture_dir.mkdir(parents=True, exist_ok=True)
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S_%f")
        path = self.capture_dir / f"scan_{timestamp}.jpg"
        capture_id = self.imageCapture.captureToFile(str(path))
        self._capture_id_to_path[capture_id] = str(path)
        self._set_busy(True)
        self._set_status("Photo captured; running classification…")

    # Keep the existing QML API from the starter project.
    @pyqtSlot()
    def simulateScan(self) -> None:
        self.capturePhoto()

    @pyqtSlot()
    def backarrowhomescreen(self) -> None:
        self.statusChanged.emit("Back")

    def _on_image_saved(self, capture_id: int, file_name: str) -> None:
        path = self._capture_id_to_path.pop(capture_id, file_name)
        self.last_image_path = path
        self._start_inference(path)

    def _start_inference(self, image_path: str) -> None:
        self._stop_inference_thread()
        thread = QThread(self)
        worker = InferenceWorker(image_path, self.model_path)
        worker.moveToThread(thread)
        thread.started.connect(worker.run)
        worker.finished.connect(self._on_inference_finished)
        worker.failed.connect(self._on_inference_failed)
        worker.finished.connect(thread.quit)
        worker.failed.connect(thread.quit)
        thread.finished.connect(worker.deleteLater)
        thread.finished.connect(thread.deleteLater)
        thread.finished.connect(self._clear_inference_refs)
        self._inference_thread = thread
        self._inference_worker = worker
        thread.start()

    @pyqtSlot(object)
    def _on_inference_finished(self, result: dict) -> None:
        self.last_result_label = str(result["class_name"])
        self.last_confidence = float(result["confidence"])
        self._set_status(
            f"Detected {self.last_result_label} ({self.last_confidence:.1f}%)"
        )
        self._set_busy(False)
        self.scanCompleted.emit(self.last_result_label)
        self.scanResultReady.emit(
            self.last_result_label,
            self.last_confidence,
            self.last_image_path,
        )

    @pyqtSlot(str)
    def _on_inference_failed(self, message: str) -> None:
        self._set_busy(False)
        self._set_status("Classification failed")
        self.errorOccurred.emit(message)

    @pyqtSlot()
    def _clear_inference_refs(self) -> None:
        self._inference_thread = None
        self._inference_worker = None

    def _stop_inference_thread(self) -> None:
        if self._inference_thread and self._inference_thread.isRunning():
            self._inference_thread.quit()
            self._inference_thread.wait(2000)
        self._inference_thread = None
        self._inference_worker = None

    @pyqtSlot()
    def _on_camera_active_changed(self) -> None:
        if self.camera.isActive():
            self._set_status("Camera live")

    @pyqtSlot(QCamera.Error, str)
    def _on_camera_error(self, error: object, error_string: str) -> None:
        self._set_status("Camera error")
        self.errorOccurred.emit(error_string or "The camera reported an error.")

    @pyqtSlot(int, QImageCapture.Error, str)
    def _on_capture_error(self, capture_id: int, error: object, error_string: str) -> None:
        self._capture_id_to_path.pop(capture_id, None)
        self._set_busy(False)
        self._set_status("Photo capture failed")
        self.errorOccurred.emit(error_string or "The photo could not be saved.")

    def close(self) -> None:
        self.stopCamera()
        self._stop_inference_thread()
