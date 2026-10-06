"""Module 2: list cameras visible to Qt."""

from PyQt6.QtCore import QCoreApplication
from PyQt6.QtMultimedia import QMediaDevices


app = QCoreApplication([])
inputs = QMediaDevices.videoInputs()

if not inputs:
    print("No cameras detected by Qt.")
else:
    print(f"Qt sees {len(inputs)} camera(s):")
    for index, device in enumerate(inputs):
        print(f"[{index}] {device.description()}")
        print(f"    id={bytes(device.id()).hex()}")
