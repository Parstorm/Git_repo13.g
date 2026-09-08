import os
import re
import sys
from pathlib import Path

# Disable disk cache before Qt initializes
os.environ["QML_DISABLE_DISK_CACHE"] = "1"

from PyQt6.QtWidgets import QApplication, QMainWindow
from PyQt6.QtQuickWidgets import QQuickWidget
from PyQt6.QtCore import QUrl, QFileSystemWatcher, QTimer


QML_FILE_PATTERN = re.compile(r"\b([A-Za-z_][A-Za-z0-9_]*)\.qml\b")
ASSET_PATH_PATTERN = re.compile(r"(?:Qt\.resolvedUrl\s*\(\s*)?[\"'](assets/[^\"']+)[\"']")

class QMLWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Main Side QML View")
        self.resize(440, 956)

        self.quick_widget = QQuickWidget(self)
        self.quick_widget.setResizeMode(QQuickWidget.ResizeMode.SizeRootObjectToView)

        self.current_dir = os.path.dirname(os.path.abspath(__file__))
        self.qml_path = os.path.join(self.current_dir, "Main_med_detection.qml")
        self.qml_dependencies = set()
        self.asset_dependencies = set()
        self.qml_last_mtime = None
        self.qml_last_size = None
        self.file_watcher = QFileSystemWatcher(self)
        self.file_watcher.fileChanged.connect(self.reload_qml)

        self.reload_timer = QTimer(self)
        self.reload_timer.setInterval(500)
        self.reload_timer.timeout.connect(self.poll_qml_file)
        self.reload_timer.start()

        self.load_qml()
        self.setCentralWidget(self.quick_widget)

    def load_qml(self):
        self.qml_dependencies, self.asset_dependencies = self.find_dependencies()
        watched_files = sorted(self.qml_dependencies | self.asset_dependencies)
        self.file_watcher.removePaths(self.file_watcher.files())
        if watched_files:
            self.file_watcher.addPaths(watched_files)

        print("--------------------------------------------------")
        print("LOADING FILE FROM:", self.qml_path)
        if os.path.exists(self.qml_path):
            print("MODIFIED TIME:", os.path.getmtime(self.qml_path))
            print("FILE SIZE:", os.path.getsize(self.qml_path))
        else:
            print("ERROR: File does not exist at this path!")
        print("--------------------------------------------------")

        self.quick_widget.setSource(QUrl())

        if not os.path.exists(self.qml_path):
            print("Main_side.qml is missing; showing blank screen.")
            self.qml_last_mtime = None
            self.qml_last_size = None
            return

        try:
            with open(self.qml_path, "r", encoding="utf-8") as f:
                content = f.read()
        except Exception as e:
            print("Could not read Main_side.qml:", e)
            return

        if not content.strip():
            print("Main_side.qml is empty; showing blank screen.")
            self.qml_last_mtime = os.path.getmtime(self.qml_path)
            self.qml_last_size = os.path.getsize(self.qml_path)
            return

        if self.quick_widget.engine() is not None:
            self.quick_widget.engine().addImportPath(self.current_dir)
            self.quick_widget.engine().clearComponentCache()

        self.quick_widget.setSource(QUrl.fromLocalFile(self.qml_path))
        self.qml_last_mtime = os.path.getmtime(self.qml_path)
        self.qml_last_size = os.path.getsize(self.qml_path)

    def reload_qml(self, path):
        if path and path in self.qml_dependencies | self.asset_dependencies:
            self.load_qml()

    def find_dependencies(self):
        """Find local QML components and assets used by the entry file."""
        qml_files = set()
        asset_files = set()
        pending = [Path(self.qml_path)]

        while pending:
            qml_file = pending.pop()
            qml_file = qml_file.resolve()
            if qml_file in qml_files or not qml_file.is_file():
                continue

            qml_files.add(qml_file)
            try:
                content = qml_file.read_text(encoding="utf-8")
            except OSError as error:
                print(f"Could not read QML dependency {qml_file}: {error}")
                continue

            for asset_name in ASSET_PATH_PATTERN.findall(content):
                asset_path = (Path(self.current_dir) / asset_name).resolve()
                asset_files.add(asset_path)
                if not asset_path.is_file():
                    print("MISSING ASSET:", asset_path)

            for qml_name in QML_FILE_PATTERN.findall(content):
                dependency = qml_file.parent / f"{qml_name}.qml"
                if dependency.is_file():
                    pending.append(dependency)

            # QML custom types are referenced without the .qml suffix.
            for candidate in Path(self.current_dir).glob("*.qml"):
                if re.search(rf"\b{re.escape(candidate.stem)}\s*\{{", content):
                    pending.append(candidate)

        return {str(path) for path in qml_files}, {str(path) for path in asset_files}

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