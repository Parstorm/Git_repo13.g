"""Module 3: minimal non-QML Qt camera preview."""

import sys

from PyQt6.QtWidgets import QApplication
from PyQt6.QtMultimedia import QCamera, QMediaCaptureSession, QMediaDevices
from PyQt6.QtMultimediaWidgets import QVideoWidget


app = QApplication(sys.argv)
cameras = QMediaDevices.videoInputs()
if not cameras:
    raise SystemExit("No camera detected by Qt.")

camera = QCamera(cameras[0])
session = QMediaCaptureSession()
view = QVideoWidget()
session.setCamera(camera)
session.setVideoOutput(view)

view.setWindowTitle(f"Qt camera preview — {cameras[0].description()}")
view.resize(800, 600)
view.show()
camera.start()

sys.exit(app.exec())
