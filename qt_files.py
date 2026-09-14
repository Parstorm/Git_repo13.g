import os
import sys

# Disable disk cache before Qt initializes
os.environ["QML_DISABLE_DISK_CACHE"] = "1"

from PyQt6.QtWidgets import QApplication, QMainWindow
from PyQt6.QtQuickWidgets import QQuickWidget
from PyQt6.QtCore import QUrl, QFileSystemWatcher, QTimer

class QMLWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Main Side QML View")
        self.resize(440, 956)

        self.quick_widget = QQuickWidget(self)
        self.quick_widget.setResizeMode(QQuickWidget.ResizeMode.SizeRootObjectToView)

        self.current_dir = os.path.dirname(os.path.abspath(__file__))
        requested_qml = os.environ.get("QML_FILE")
        if not requested_qml and len(sys.argv) > 1:
            requested_qml = sys.argv[1]
        self.qml_path = os.path.abspath(os.path.join(
            self.current_dir, requested_qml or "Main_side.qml"
        ))
        self.qml_last_mtime = None
        self.qml_last_size = None

        self.file_watcher = QFileSystemWatcher([self.qml_path])
        self.file_watcher.fileChanged.connect(self.reload_qml)

        self.reload_timer = QTimer(self)
        self.reload_timer.setInterval(500)
        self.reload_timer.timeout.connect(self.poll_qml_file)
        self.reload_timer.start()

        self.load_qml()
        self.setCentralWidget(self.quick_widget)

    def load_qml(self):
        old_widget = self.quick_widget
        self.quick_widget = QQuickWidget(self)
        self.quick_widget.setResizeMode(QQuickWidget.ResizeMode.SizeRootObjectToView)
        self.setCentralWidget(self.quick_widget)
        if old_widget is not None:
            old_widget.deleteLater()

        self.file_watcher.removePaths(self.file_watcher.files())
        if os.path.exists(self.qml_path):
            self.file_watcher.addPath(self.qml_path)

        print("--------------------------------------------------")
        print("LOADING FILE FROM:", self.qml_path)
        if os.path.exists(self.qml_path):
            print("MODIFIED TIME:", os.path.getmtime(self.qml_path))
            print("FILE SIZE:", os.path.getsize(self.qml_path))
        else:
            print("ERROR: File does not exist at this path!")
        print("--------------------------------------------------")

        if not os.path.exists(self.qml_path):
            print("Selected QML file is missing; showing blank screen.")
            self.qml_last_mtime = None
            self.qml_last_size = None
            return

        try:
            with open(self.qml_path, "r", encoding="utf-8") as f:
                content = f.read()
        except Exception as e:
            print("Could not read selected QML file:", e)
            return

        if not content.strip():
            print("Selected QML file is empty; showing blank screen.")
            self.qml_last_mtime = os.path.getmtime(self.qml_path)
            self.qml_last_size = os.path.getsize(self.qml_path)
            return

        self.quick_widget.engine().clearComponentCache()

        self.quick_widget.setSource(QUrl.fromLocalFile(self.qml_path))
        self.qml_last_mtime = os.path.getmtime(self.qml_path)
        self.qml_last_size = os.path.getsize(self.qml_path)

    def reload_qml(self, path):
        if path and os.path.abspath(path) == os.path.abspath(self.qml_path):
            self.load_qml()

    def poll_qml_file(self):
        if not os.path.exists(self.qml_path):
            if self.qml_last_mtime is not None or self.qml_last_size is not None:
                self.load_qml()
            return

        try:
            mtime = os.path.getmtime(self.qml_path)
            size = os.path.getsize(self.qml_path)
        except OSError:
            self.load_qml()
            return

        if self.qml_last_mtime != mtime or self.qml_last_size != size:
            self.load_qml()

if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = QMLWindow()
    window.show()
    sys.exit(app.exec())