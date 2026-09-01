import os
import sys

# Disable disk cache before Qt initializes
os.environ["QML_DISABLE_DISK_CACHE"] = "1"

from PyQt6.QtWidgets import QApplication, QMainWindow
from PyQt6.QtQuickWidgets import QQuickWidget
from PyQt6.QtCore import QUrl

class QMLWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Main Side QML View")
        self.resize(440, 956)

        self.quick_widget = QQuickWidget(self)
        
        # 1. Get exact directory of this running script
        current_dir = os.path.dirname(os.path.abspath(__file__))
        qml_path = os.path.join(current_dir, "Main_side.qml")
        
        # PRINT DIAGNOSTICS: Check terminal output to verify path & save timestamp
        print("--------------------------------------------------")
        print("LOADING FILE FROM:", qml_path)
        if os.path.exists(qml_path):
            print("LAST MODIFIED SECONDS AGO:", os.path.getmtime(qml_path))
        else:
            print("ERROR: File does not exist at this path!")
        print("--------------------------------------------------")

        # 2. Force Qt engine to wipe all loaded QML components from memory
        self.quick_widget.engine().clearComponentCache()

        self.quick_widget.setSource(QUrl.fromLocalFile(qml_path))
        self.quick_widget.setResizeMode(QQuickWidget.ResizeMode.SizeRootObjectToView)
        
        self.setCentralWidget(self.quick_widget)

if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = QMLWindow()
    window.show()
    sys.exit(app.exec())