# Camera + ML prototype

The runtime path is now:

`QMediaDevices → QCamera → QMediaCaptureSession → QML VideoOutput`

and on shutter:

`QImageCapture → captures/scan_*.jpg → main.py::classify_image() → QML result page`

## Run the app

From the project folder:

```powershell
python qt_files.py
```

`qt_files.py` defaults to `App.qml`, which opens the existing homescreen. The
`QML_FILE` environment variable still overrides the starting QML file.

## Camera diagnostics

Module 2:

```powershell
python camera_diagnostic.py
```

Module 3:

```powershell
python camera_preview.py
```

These isolate camera discovery and the camera stack before the QML UI is involved.

## ML model configuration

The repository does not contain the `.pth` model that the original project
referenced. The controller therefore expects the trained model at
`trash_classifier3008.pth` beside `main.py`, or at the path in
`TRASH_MODEL_PATH`.

The original dataset paths are still the defaults for training compatibility:

```powershell
$env:TRASH_DATASET_PATH='C:\ML skrald\trash_dataset'
$env:TRASH_MODEL_PATH='C:\path\to\trash_classifier3008.pth'
$env:TRASH_CAPTURE_DIR='C:\path\to\captures'
```

To train and save the model:

```powershell
python main.py --train --dataset 'C:\ML skrald\trash_dataset' --model '.\trash_classifier3008.pth'
```

To test one image without Qt:

```powershell
python main.py --image '.\captures\scan_....jpg' --model '.\trash_classifier3008.pth'
```

`main.py` uses the same ResNet18 architecture and image normalization as the
original code. Inference is performed in a worker `QThread`, so the QML UI is
not blocked while PyTorch runs.

## Camera page

`Main_side.qml` is the existing scan UI. Its static hero/background photo has
been replaced by a live `VideoOutput` while the original overlay controls remain
on top. The bottom-center `Component_29` button is the shutter.

The camera is started when the page is created and stopped when it is destroyed,
so leaving the scan page releases the camera.

After a successful capture + inference, the existing `Main_med_detection.qml`
page is shown and displays the detected class and confidence.
