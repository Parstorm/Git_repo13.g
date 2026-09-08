import QtQuick
import QtQuick.Shapes

Image {
    id: main_side

    clip: true
    source: Qt.resolvedUrl("assets/main_side.png")

    Image {
        id: rectangle_111141357

        x: 11
        y: 811

        source: Qt.resolvedUrl("assets/rectangle_111141357.png")
    }
    Shape {
        id: ellipse_16

        x: 273.77
        y: 725.98

        height: 41.46
        width: 41.46

        ShapePath {
            id: ellipse_16_ShapePath0

            fillColor: "#00000000"
            fillRule: ShapePath.WindingFill
            strokeColor: "#757575"
            strokeWidth: 3

            PathSvg {
                id: ellipse_16_ShapePath0_PathSvg0

                path: "M 41.46428298950195 20.732145309448242 C 41.46428298950195 32.18219339071668 32.18218746922021 41.464290618896484 20.732141494750977 41.464290618896484 C 9.28209552028174 41.464290618896484 5.118756348254863e-7 32.18219339071668 5.118756348254863e-7 20.732145309448242 C 5.118756348254863e-7 9.282097228179806 9.28209552028174 0 20.732141494750977 0 C 32.18218746922021 0 41.46428298950195 9.282097228179806 41.46428298950195 20.732145309448242 Z"
            }
        }
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
        id: subtract

        x: 34
        y: 200

        source: Qt.resolvedUrl("assets/subtract_4.png")
    }
    Image {
        id: controlsButton

        x: 24
        y: 39

        source: Qt.resolvedUrl("assets/controlsButton.png")
    }
    Image {
        id: component_2

        x: 15
        y: 49

        clip: true
        source: Qt.resolvedUrl("assets/component_2.png")

        Component_2 {
            id: property_1_Arrow_Klikket

            x: 20
            y: 20

            property_2: Component_2.Property_1.Property_1_Arrow_Klikket
        }
        Component_2 {
            id: property_1_Arrow_Ik_klikket

            x: 20
            y: 20

            property_2: Component_2.Property_1.Property_1_Arrow_Ik_klikket
        }
    }
    Image {
        id: gallery_klikket

        x: 49
        y: 830

        clip: true
        source: Qt.resolvedUrl("assets/gallery_klikket.png")

        Gallery_klikket {
            id: property_1_Pressed

            x: 20
            y: 20

            property_2: Gallery_klikket.Property_1.Property_1_Pressed
        }
        Gallery_klikket {
            id: property_1_Default

            x: 20
            y: 20

            property_2: Gallery_klikket.Property_1.Property_1_Default
        }
    }
    Image {
        id: component_29

        x: 171
        y: 815

        clip: true
        source: Qt.resolvedUrl("assets/component_29.png")

        Component_29 {
            id: property_1_Variant4

            x: 20
            y: 20

            property_2: Component_29.Property_1.Property_1_Variant4
        }
        Component_29 {
            id: property_1_Variant3

            x: 20
            y: 20

            property_2: Component_29.Property_1.Property_1_Variant3
        }
    }
    Image {
        id: component_49

        x: 306
        y: 825

        clip: true
        source: Qt.resolvedUrl("assets/component_49.png")

        Component_49 {
            id: property_1_Variant4_1

            x: 20
            y: 20

            opacity: 0.85
            property_2: Component_49.Property_1.Property_1_Variant4
        }
        Component_49 {
            id: property_1_Variant3_1

            x: 20
            y: 20

            opacity: 0.85
            property_2: Component_49.Property_1.Property_1_Variant3
        }
    }
}