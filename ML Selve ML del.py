import torch
import torch.nn as nn
from torchvision import transforms, models
from PIL import Image
from pathlib import Path


def main():
    # 1. Sæt device (GPU hvis tilgængelig, ellers CPU)
    device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    print("Using device:", device)

    # 2. Definer klasserne manuelt (skal matche den alfabetiske rækkefølge fra ImageFolder)
    class_names = ['Farligt Affald', "Glas", "Madaffald", "Metal", "Pap", "Papir", "Plastik"]  # Tilpas til dine mapper!

    # 3. Genopbyg modelstrukturen
    model = models.resnet18()
    model.fc = nn.Linear(in_features=model.fc.in_features, out_features=len(class_names))

    # 4. Indlæs de gemte vægte og flyt modellen til din device
    # Brug den præcise placering af filen
    SCRIPT_DIR = Path(__file__).parent
    weights_path = SCRIPT_DIR / "trash_classifier3008.pth"
    model.load_state_dict(torch.load(weights_path, map_location=device))
    model.to(device)

    print("Weights loaded")

    # 5. Sæt modellen i evaluerings-tilstand
    model.eval()

    # 6. Transformering (skal være 100% identisk med trænings-transformeringen)
    transform = transforms.Compose([
        transforms.Resize((224, 224)),
        transforms.ToTensor(),
        transforms.Normalize(mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225])
    ])

    # 7. Hent billeder fra mappen
    image_folder = Path("C:/ML skrald/Billederne")
    extensions = {".jpg", ".jpeg", ".png", ".webp", ".bmp"}
    imagelist = [path for path in image_folder.iterdir() if path.suffix.lower() in extensions]

    # 8. Kør forudsigelser
    for image_path in imagelist:
        image = Image.open(image_path).convert("RGB")
        image_tensor = transform(image).unsqueeze(0).to(device)

        with torch.no_grad():
            output = model(image_tensor)
            probabilities = torch.softmax(output, dim=1)
            predicted_class = torch.argmax(probabilities, dim=1).item()
            confidence = probabilities[0, predicted_class].item() * 100

        print(f"\nProcessed: {image_path.name}")
        print(f"This item belongs in: {class_names[predicted_class]} ({confidence:.2f}% confidence)")

        for i, class_name in enumerate(class_names):
            percentage = probabilities[0, i].item() * 100
            print(f"  {class_name}: {percentage:.2f}%")


if __name__ == "__main__":
    main()