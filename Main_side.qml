import QtQuick
import QtQuick.Controls

Item {
    id: root
    width: 430
    height: 932

    // 1. Fullscreen Background Image
    Image {
        id: bgImage
        anchors.fill: parent
        source: Qt.resolvedUrl("assets/subtract_1.png")
        fillMode: Image.PreserveAspectCrop
    }

    // 2. Center Reticle Bracket Overlay
    Image {
        id: scanFrame
        anchors.centerIn: parent
        width: parent.width * 0.8
        fillMode: Image.PreserveAspectFit
        source: Qt.resolvedUrl("assets/rectangle_111141358.png") // Ensure clean corner vector asset
    }

    // 3. Bottom Navigation Bar Container
    Rectangle {
        id: bottomBar
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 20
        width: parent.width * 0.9
        height: 90
        radius: 45
        color: "#50FFFFFF" // Translucent glass effect

        Row {
            anchors.centerIn: parent
            spacing: 50

            // Gallery Icon
            Image {
                anchors.verticalCenter: parent.verticalCenter
                source: Qt.resolvedUrl("assets/design_uden_navn_14_1.png")
            }

            // Yellow Shutter Button
            Rectangle {
                width: 66
                height: 66
                radius: 33
                color: "#c8cf1f"
                border.color: "#5c6d47"
                border.width: 3
                anchors.verticalCenter: parent.verticalCenter
            }

            // Help Icon
            Image {
                anchors.verticalCenter: parent.verticalCenter
                source: Qt.resolvedUrl("assets/ellipse_17.png")
            }
        }
    }
}