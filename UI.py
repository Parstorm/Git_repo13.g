import sys

from PySide6.QtGui import QWindow
from PySide6.QtGui import QIcon
from PySide6.QtWidgets import QApplication, QMainWindow, QLabel, QWidget, QComboBox, QGridLayout
from pathlib import Path

grid= QGridLayout()

app = QApplication(sys.argv)

app.setWindowIcon(QIcon("C:/ML skrald/Billederne/Skærmbillede 2026-01-08 110749.png"))

window = QWidget()

window.setWindowTitle("Skraldsortering")
window.resize(440, 956)
window.QComboBox = QComboBox()
window.setLayout(grid)
window.show()


sys.exit(app.exec_())