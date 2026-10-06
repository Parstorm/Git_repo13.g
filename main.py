"""Trash-image classifier used by the Qt camera controller.

The original version of this file trained the network and then classified every
image in a hard-coded Windows directory.  The application needs a reusable
inference entry point instead: capture one image, pass its path here, and get a
single prediction back.

Training is still available through ``train_model`` / the CLI ``--train``.
"""

from __future__ import annotations

import argparse
import os
from pathlib import Path
from typing import Iterable, Sequence

import torch
import torch.nn as nn
from PIL import Image
from torchvision import datasets, models, transforms
from torch.utils.data import DataLoader

# Keep QML cache disabled before any Qt imports in the application process.
os.environ.setdefault("QML_DISABLE_DISK_CACHE", "1")

DEFAULT_CLASS_NAMES: tuple[str, ...] = (
    "Farligt Affald",
    "Glas",
    "Madaffald",
    "Metal",
    "Pap",
    "Papir",
    "Plastik",
)

DEFAULT_MODEL_PATH = Path(__file__).resolve().parent / "trash_classifier3008.pth"
DEFAULT_DATASET_PATH = Path(r"C:\ML skrald\trash_dataset")
DEFAULT_REFERENCE_PATH = Path(r"C:\ML skrald\Billederne")

IMAGE_EXTENSIONS = {".jpg", ".jpeg", ".png", ".webp", ".bmp", ".tif", ".tiff"}


def _device() -> torch.device:
    return torch.device("cuda" if torch.cuda.is_available() else "cpu")


def _transform() -> transforms.Compose:
    # Must match the original training pipeline.
    return transforms.Compose(
        [
            transforms.Resize((224, 224)),
            transforms.ToTensor(),
            transforms.Normalize(
                mean=[0.485, 0.456, 0.406],
                std=[0.229, 0.224, 0.225],
            ),
        ]
    )


def _normalise_class_names(class_names: Sequence[str] | None) -> list[str]:
    if class_names:
        return [str(name).strip() for name in class_names if str(name).strip()]
    env_names = os.environ.get("TRASH_CLASSES", "")
    if env_names.strip():
        names = [part.strip() for part in env_names.split(",") if part.strip()]
        if names:
            return names
    return list(DEFAULT_CLASS_NAMES)


def build_model(num_classes: int) -> nn.Module:
    """Recreate the ResNet18 architecture used by the original project."""
    model = models.resnet18(weights=None)
    model.fc = nn.Linear(model.fc.in_features, num_classes)
    return model


def _load_state_dict(path: Path, device: torch.device) -> dict:
    if not path.exists():
        raise FileNotFoundError(
            f"Model weights not found: {path}. Set TRASH_MODEL_PATH to your .pth file "
            "or train one with: python main.py --train --dataset <dataset-folder>."
        )

    checkpoint = torch.load(path, map_location=device, weights_only=False)
    if isinstance(checkpoint, dict) and "state_dict" in checkpoint:
        checkpoint = checkpoint["state_dict"]
    if not isinstance(checkpoint, dict):
        raise ValueError(f"Unsupported model checkpoint format: {path}")

    # Accept checkpoints saved from DataParallel as well.
    return {key.removeprefix("module."): value for key, value in checkpoint.items()}


def load_model(
    model_path: str | os.PathLike[str] | None = None,
    class_names: Sequence[str] | None = None,
) -> tuple[nn.Module, list[str], torch.device]:
    """Load trained weights and return (model, class_names, device)."""
    device = _device()
    path = Path(model_path or os.environ.get("TRASH_MODEL_PATH", DEFAULT_MODEL_PATH))
    names = _normalise_class_names(class_names)
    model = build_model(len(names))
    model.load_state_dict(_load_state_dict(path, device), strict=True)
    model.to(device)
    model.eval()
    return model, names, device


def classify_image(
    image_path: str | os.PathLike[str],
    model_path: str | os.PathLike[str] | None = None,
    class_names: Sequence[str] | None = None,
) -> dict:
    """Classify exactly one captured image.

    Returns a serialisable dictionary so the result can cross the Qt worker
    boundary without passing a PyTorch tensor into QML.
    """
    source = Path(image_path)
    if not source.exists():
        raise FileNotFoundError(f"Captured image does not exist: {source}")
    if source.suffix.lower() not in IMAGE_EXTENSIONS:
        raise ValueError(f"Unsupported image format: {source.suffix or '<none>'}")

    model, names, device = load_model(model_path=model_path, class_names=class_names)
    image = Image.open(source).convert("RGB")
    tensor = _transform()(image).unsqueeze(0).to(device)

    with torch.inference_mode():
        probabilities = torch.softmax(model(tensor), dim=1)[0]

    top_index = int(torch.argmax(probabilities).item())
    confidence = float(probabilities[top_index].item() * 100.0)
    all_probabilities = {
        name: float(probabilities[index].item() * 100.0)
        for index, name in enumerate(names)
    }

    return {
        "image_path": str(source),
        "class_name": names[top_index],
        "confidence": confidence,
        "probabilities": all_probabilities,
        "device": str(device),
    }


def train_model(
    dataset_path: str | os.PathLike[str],
    model_path: str | os.PathLike[str] = DEFAULT_MODEL_PATH,
    epochs: int = 15,
    batch_size: int = 32,
    learning_rate: float = 0.001,
) -> list[str]:
    """Train the original transfer-learning model and save its weights."""
    dataset_root = Path(dataset_path)
    if not dataset_root.exists():
        raise FileNotFoundError(f"Dataset folder not found: {dataset_root}")

    transform = _transform()
    dataset = datasets.ImageFolder(root=str(dataset_root), transform=transform)
    if not dataset.classes:
        raise ValueError(f"No class folders found below: {dataset_root}")

    loader = DataLoader(dataset, batch_size=batch_size, shuffle=True)
    device = _device()

    # Preserve the original project's ResNet18 transfer-learning approach.
    pretrained = True
    try:
        model = models.resnet18(weights=models.ResNet18_Weights.DEFAULT)
    except Exception as exc:
        # The app can still be trained offline when torchvision's pretrained
        # weights are unavailable. In that case the full network is trained
        # instead of freezing a randomly initialised backbone.
        pretrained = False
        print(f"Could not load pretrained ResNet18 weights ({exc}); training from scratch.")
        model = models.resnet18(weights=None)

    if pretrained:
        for parameter in model.parameters():
            parameter.requires_grad = False

    model.fc = nn.Linear(model.fc.in_features, len(dataset.classes))
    model.to(device)

    criterion = nn.CrossEntropyLoss()
    parameters = model.fc.parameters() if pretrained else model.parameters()
    optimizer = torch.optim.Adam(parameters, lr=learning_rate)

    print(f"Using device: {device}")
    print(f"Classes: {dataset.classes}")
    print(f"Images: {len(dataset)}")

    for epoch in range(epochs):
        model.train()
        running_loss = 0.0
        for images, labels in loader:
            images, labels = images.to(device), labels.to(device)
            optimizer.zero_grad(set_to_none=True)
            loss = criterion(model(images), labels)
            loss.backward()
            optimizer.step()
            running_loss += float(loss.item())

        average_loss = running_loss / max(len(loader), 1)
        print(f"Epoch {epoch + 1}/{epochs} - Loss: {average_loss:.4f}")

    output_path = Path(model_path)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    torch.save(model.state_dict(), output_path)
    print(f"Model saved to: {output_path}")
    return list(dataset.classes)


def classify_reference_folder(
    image_folder: str | os.PathLike[str],
    model_path: str | os.PathLike[str] | None = None,
    class_names: Sequence[str] | None = None,
) -> Iterable[dict]:
    """Compatibility helper matching the original script's folder scan."""
    folder = Path(image_folder)
    if not folder.exists():
        raise FileNotFoundError(f"Reference image folder not found: {folder}")

    for path in sorted(folder.iterdir()):
        if path.is_file() and path.suffix.lower() in IMAGE_EXTENSIONS:
            yield classify_image(path, model_path=model_path, class_names=class_names)


def main() -> None:
    parser = argparse.ArgumentParser(description="Train or run the trash classifier")
    parser.add_argument("--image", type=Path, help="Single image to classify")
    parser.add_argument("--train", action="store_true", help="Train the model")
    parser.add_argument(
        "--dataset",
        type=Path,
        default=Path(os.environ.get("TRASH_DATASET_PATH", DEFAULT_DATASET_PATH)),
    )
    parser.add_argument(
        "--model",
        type=Path,
        default=Path(os.environ.get("TRASH_MODEL_PATH", DEFAULT_MODEL_PATH)),
    )
    parser.add_argument("--epochs", type=int, default=15)
    args = parser.parse_args()

    if args.train:
        train_model(args.dataset, args.model, epochs=args.epochs)
        return

    if args.image:
        result = classify_image(args.image, args.model)
        print(f"\nProcessed: {result['image_path']}")
        print(
            f"This item belongs in: {result['class_name']} "
            f"({result['confidence']:.2f}% confidence)"
        )
        for name, percentage in result["probabilities"].items():
            print(f"  {name}: {percentage:.2f}%")
        return

    parser.error("Provide --image for inference or --train to train the model.")


if __name__ == "__main__":
    main()
