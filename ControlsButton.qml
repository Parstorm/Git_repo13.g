import QtQuick
import QtQuick.Shapes

Rectangle {
    id: controlsButton

    height: 78.18
    width: 78.18

    color: "transparent"
    opacity: 0.85

    Shape {
        id: ellipse_16

        x: 18.04
        y: 18.50

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
    Item {
        id: group_10

        x: 25.64
        y: 26.09

        height: 27
        width: 27

        rotation: 45

        Rectangle {
            id: rectangle_111141383

            y: 12

            height: 3
            width: 27

            color: "#3b3e40"
            radius: 29
            rotation: 90
        }
        Rectangle {
            id: rectangle_111141384

            y: 12

            height: 3
            width: 27

            color: "#3b3e40"
            radius: 29
            rotation: -180
        }
    }
}