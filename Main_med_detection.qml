import QtQuick
import QtQuick.Controls

Image {
    id: main_med_detection

    property var navigationStack: StackView.view

    function goBack() {
        if (navigationStack && navigationStack.depth > 1) {
            navigationStack.pop()
        }
    }

    property string detectedClass: ""
    property real confidence: 0

    clip: true
    source: Qt.resolvedUrl("assets/main_med_detection.png")

    Image {
        id: rectangle_111141357

        x: 28
        y: 646

        source: Qt.resolvedUrl("assets/rectangle_111141361.png")
    }
    Image {
        id: pLAST_rgb_72dpi_1

        x: 141
        y: 679

        source: Qt.resolvedUrl("assets/pLAST_rgb_72dpi_1.png")
    }
    Rectangle {
        id: rectangle_111141358

        x: 11 - 119
        y: 10 - 119
        width: 418 + 2 * 119
        height: 930 + 2 * 119

        border.color: "#5c6d47"
        border.width: 119
        color: "transparent"
        radius: 49 + 119
    }
    Image {
        id: controlsButton

        x: 24
        y: 39

        source: Qt.resolvedUrl("assets/controlsButton_2.png")
    }
    Image {
        id: subtract

        x: 34
        y: 200

        source: Qt.resolvedUrl("assets/subtract_15.png")
    }
    ControlsButton {
        id: controlsButton_1

        x: 324.96
        y: 650.50

        opacity: 0.85
    }
    Rectangle {
        id: resultCard

        x: 28
        y: 520
        width: 384
        height: 112
        radius: 22
        color: "#E633332B"

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            y: 12
            width: parent.width - 32
            text: main_med_detection.detectedClass || "Resultat"
            color: "#EBEBEB"
            font.family: "Inter"
            font.pixelSize: 28
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            elide: Text.ElideRight
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            y: 57
            text: main_med_detection.detectedClass
                  ? qsTr("Sikkerhed: %1 %").arg(main_med_detection.confidence.toFixed(1))
                  : ""
            color: "#EBEBEB"
            font.pixelSize: 18
            horizontalAlignment: Text.AlignHCenter
        }
    }

    Image {
        id: component_4

        x: 15
        y: 49

        clip: true
        source: Qt.resolvedUrl("assets/component_4.png")
    }

    Component_4 {
        id: property_1_Arrow_1_klikket
        x: 35
        y: 69
        property_2: Component_4.Property_1.Property_1_Arrow_1_klikket
        onClicked: main_med_detection.goBack()
    }
    Component_4 {
        id: property_1_Arrow_Ik_klik
        x: 35
        y: 69
        property_2: Component_4.Property_1.Property_1_Arrow_Ik_klik
        onClicked: main_med_detection.goBack()
    }
}