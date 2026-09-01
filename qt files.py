import sys
from PyQt6.QtWidgets import QApplication, QMainWindow
from PyQt6.QtQuickWidgets import QQuickWidget
from PyQt6.QtCore import QUrl, Qt

class QMLWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Main Side QML View")
        self.resize(440, 956)  # Match your Figma design dimensions

        # Embed the QML file into a widget container
        self.quick_widget = QQuickWidget(self)
        self.quick_widget.setSource(QUrl.fromLocalFile(r"C:\Users\kalle\OneDrive\Documents\Git repos\Git_repo13.g\Main_side.qml"))
        self.quick_widget.setResizeMode(QQuickWidget.ResizeMode.SizeRootObjectToView)
        
        self.setCentralWidget(self.quick_widget)

if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = QMLWindow()
    window.show()
    sys.exit(app.exec())