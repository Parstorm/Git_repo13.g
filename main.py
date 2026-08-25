import torch
import torch.nn as nn
import torch.optim as optim
from torchvision import datasets, transforms, models
from torch.utils.data import DataLoader
from PIL import Image
from pathlib import Path

print("WE BEGIN")
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
print("Using device:", device)

def main():
    if torch.cuda.is_available(): print("GPU:", torch.cuda.get_device_name(0))
    print("CUDA version:", torch.version.cuda)


    # --- 1. DATA PREPARATION ---
    transform = transforms.Compose([
        transforms.Resize((224, 224)),
        transforms.ToTensor(),
        transforms.Normalize(mean=[0.485, 0.456, 0.406], std=[0.229, 0.224, 0.225])
    ])

    dataset = datasets.ImageFolder(root='C:/ML skrald/trash_dataset', transform=transform)
    train_loader = DataLoader(dataset, batch_size=32, shuffle=True)

    # --- 2. MODEL BUILDING ---
    model = models.resnet18(weights=models.ResNet18_Weights.DEFAULT)

    # Freeze all layers
    for param in model.parameters():
        param.requires_grad = False

    model.fc = nn.Linear(in_features=model.fc.in_features, out_features=len(dataset.classes))

    # --- 3. LOSS & OPTIMIZER ---
    criterion = nn.CrossEntropyLoss()
    optimizer = optim.Adam(model.fc.parameters(), lr=0.001)

    # --- 4. TRAINING LOOP ---
    epochs = 15
    for epoch in range(epochs):
        running_loss = 0.0
        for images, labels in train_loader:
            optimizer.zero_grad()
            outputs = model(images)
            loss = criterion(outputs, labels)
            loss.backward()
            optimizer.step()

            running_loss += loss.item()

        print(f"Epoch {epoch + 1}/{epochs} - Loss: {running_loss / len(train_loader):.4f}")

    image_folder = Path("C:/ML skrald/Billederne")

    extensions = {".jpg", ".jpeg", ".png", ".webp", ".bmp"}

    imagelist = [
        path for path in image_folder.iterdir()
        if path.suffix.lower() in extensions
    ]
    # 5. Make predictions
    model.eval()

    class_names = dataset.classes

    for image_path in imagelist:
        image = Image.open(image_path).convert("RGB")
        image_tensor = transform(image).unsqueeze(0).to(device)

        with torch.no_grad():
            output = model(image_tensor)

            # Convert raw model outputs into probabilities
            probabilities = torch.softmax(output, dim=1)

            # Get the predicted class
            predicted_class = torch.argmax(probabilities, dim=1).item()

            # Get confidence of the predicted class
            confidence = probabilities[0, predicted_class].item() * 100



        print(f"\nProcessed: {image_path.name}")


        print(
            f"This item belongs in: "
            f"{class_names[predicted_class]} "
            f"({confidence:.2f}% confidence)"
        )

        # Print probability for EVERY class
        for i, class_name in enumerate(class_names):
            percentage = probabilities[0, i].item() * 100
            print(f"  {class_name}: {percentage:.2f}%")


    # Save the trained weights to file
    #torch.save(model.state_dict(), 'trash_classifier.pth')
    #print("Model trained and saved!")

if __name__ == "__main__": main()