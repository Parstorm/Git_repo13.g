import QtQuick

Image {
    id: main_med_detection

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

        x: 11
        y: 10

        height: 930
        width: 418

        border.color: "#5c6d47"
        border.width: 119
        color: "transparent"
        radius: 49
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
    Image {
        id: component_4

        x: 15
        y: 49

        clip: true
        source: Qt.resolvedUrl("assets/component_4.png")

        Component_4 {
            id: property_1_Arrow_1_klikket

            x: 20
            y: 20

            property_2: Component_4.Property_1.Property_1_Arrow_1_klikket
        }
        Component_4 {
            id: property_1_Arrow_Ik_klik

            x: 20
            y: 20

            property_2: Component_4.Property_1.Property_1_Arrow_Ik_klik
        }
    }
}