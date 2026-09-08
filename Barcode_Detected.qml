import QtQuick
import QtQuick.Shapes

Rectangle {
    id: barcode_Detected

    height: 956
    width: 440

    border.color: "#000000"
    border.width: 1
    clip: true
    color: "transparent"

    Image {
        id: image_10_2

        x: -30
        y: -10

        source: Qt.resolvedUrl("assets/image_10_2.png")
    }
    Image {
        id: exclude

        x: 61
        y: 376

        source: Qt.resolvedUrl("assets/exclude_3.png")
    }
    Image {
        id: rectangle_111141357

        x: 957
        y: 10

        source: Qt.resolvedUrl("assets/rectangle_111141363.png")
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
    Image {
        id: rectangle_111141358

        x: 30
        y: 655

        source: Qt.resolvedUrl("assets/rectangle_111141364.png")
    }
    Image {
        id: image_3

        x: 141
        y: 688

        source: Qt.resolvedUrl("assets/image_3.png")
    }
    Image {
        id: rectangle_111141359

        x: -118
        y: -115

        source: Qt.resolvedUrl("assets/rectangle_111141365.png")
    }
    Image {
        id: component_54

        x: 4
        y: 19

        clip: true
        source: Qt.resolvedUrl("assets/component_54.png")

        Component_54 {
            id: property_1_Group_12

            x: 20
            y: 20

            property_2: Component_54.Property_1.Property_1_Group_12
        }
        Component_54 {
            id: property_1_Group_13

            x: 20
            y: 20

            property_2: Component_54.Property_1.Property_1_Group_13
        }
    }
    Image {
        id: component_55

        x: 323
        y: 649

        clip: true
        source: Qt.resolvedUrl("assets/component_55.png")

        Component_55 {
            id: property_1_Group_9

            x: 20
            y: 20

            opacity: 0.85
            property_2: Component_55.Property_1.Property_1_Group_9
        }
        Component_55 {
            id: property_1_Group_10

            x: 20
            y: 20

            property_2: Component_55.Property_1.Property_1_Group_10
        }
    }
}