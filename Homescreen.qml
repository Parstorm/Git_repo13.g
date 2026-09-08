import QtQuick
import QtQuick.Shapes

Rectangle {
    id: homescreen

    height: 956
    width: 440

    border.color: "#000000"
    border.width: 1
    clip: true
    color: "transparent"

    Rectangle {
        id: rectangle_111141394

        x: 2

        height: 956
        width: 429

        color: "#33332b"
    }
    Image {
        id: ellipse_18

        x: 588
        y: 805

        source: Qt.resolvedUrl("assets/ellipse_28.png")
    }
    Rectangle {
        id: rectangle_111141386

        x: 11
        y: 10

        height: 100
        width: 420

        color: "#989c36"
    }
    Image {
        id: rectangle_111141358

        x: -116
        y: -112

        source: Qt.resolvedUrl("assets/rectangle_111141366.png")
    }
    Image {
        id: rectangle_111141357

        x: 957
        y: 10

        source: Qt.resolvedUrl("assets/rectangle_111141367.png")
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
    Item {
        id: controlsButton

        x: 35
        y: 686

        height: 210
        width: 383

        Shape {
            id: rectangle_111141387

            height: 210
            width: 383

            ShapePath {
                id: rectangle_111141387_ShapePath0

                fillColor: "#c8cf1f"
                fillRule: ShapePath.WindingFill
                joinStyle: ShapePath.MiterJoin
                strokeColor: "#00000000"
                strokeStyle: ShapePath.SolidLine
                strokeWidth: 1

                PathSvg {
                    id: rectangle_111141387_ShapePath0_PathSvg0

                    path: "M 0 0 L 383 0 L 383 210 L 0 210 L 0 0 Z"
                }
            }
        }
    }
    Item {
        id: co2_ik_klikked

        x: 35
        y: 686

        height: 210
        width: 383

        Shape {
            id: rectangle_111141388

            height: 210
            width: 383

            ShapePath {
                id: rectangle_111141388_ShapePath0

                fillColor: "#c8cf1f"
                fillRule: ShapePath.WindingFill
                joinStyle: ShapePath.MiterJoin
                strokeColor: "#00000000"
                strokeStyle: ShapePath.SolidLine
                strokeWidth: 1

                PathSvg {
                    id: rectangle_111141388_ShapePath0_PathSvg0

                    path: "M 0 0 L 383 0 L 383 210 L 0 210 L 0 0 Z"
                }
            }
        }
    }
    Image {
        id: cO2_Lommeregner

        x: 101.55
        y: 751.46

        source: Qt.resolvedUrl("assets/cO2_Lommeregner.png")
    }
    Rectangle {
        id: rectangle_111141398

        x: 284
        y: 855

        height: 41
        width: 81

        color: "#ebebeb"
        topLeftRadius: 15
        topRightRadius: 5
    }
    Shape {
        id: rectangle_111141397

        x: 349
        y: 813

        height: 81
        width: 16

        ShapePath {
            id: rectangle_111141397_ShapePath0

            fillColor: "#ebebeb"
            fillRule: ShapePath.WindingFill
            joinStyle: ShapePath.MiterJoin
            strokeColor: "#00000000"
            strokeStyle: ShapePath.SolidLine
            strokeWidth: 1

            PathSvg {
                id: rectangle_111141397_ShapePath0_PathSvg0

                path: "M 4 0 L 8.5 0 L 16 81 L 0 81 L 4 0 Z"
            }
        }
    }
    Shape {
        id: rectangle_111141399

        x: 331
        y: 813

        height: 83
        width: 16

        ShapePath {
            id: rectangle_111141399_ShapePath0

            fillColor: "#ebebeb"
            fillRule: ShapePath.WindingFill
            joinStyle: ShapePath.MiterJoin
            strokeColor: "#00000000"
            strokeStyle: ShapePath.SolidLine
            strokeWidth: 1

            PathSvg {
                id: rectangle_111141399_ShapePath0_PathSvg0

                path: "M 4 0 L 8.5 0 L 16 83 L 0 83 L 4 0 Z"
            }
        }
    }
    Text {
        id: nem_sortering

        x: 60
        y: 28

        height: 82
        width: 322

        color: "#ffffff"
        font.family: "NATS"
        font.pixelSize: 36
        font.underline: true
        font.weight: Font.Normal
        horizontalAlignment: Text.AlignHCenter
        text: qsTr("Nem sortering")
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
    }
    Image {
        id: r

        x: 336
        y: 10

        clip: true
        source: Qt.resolvedUrl("assets/r.png")

        R {
            id: property_1_Variant4

            x: 20
            y: 20

            opacity: 0.85
            property_2: R.Property_1.Property_1_Variant4
        }
        R {
            id: property_1_Variant3

            x: 20
            y: 20

            opacity: 0.85
            property_2: R.Property_1.Property_1_Variant3
        }
    }
    Image {
        id: component_51

        x: 9
        y: 142

        clip: true
        source: Qt.resolvedUrl("assets/component_51.png")

        Component_51 {
            id: property_1_Billedgenkendelse_trykket

            x: 20
            y: 20

            property_2: Component_51.Property_1.Property_1_Billedgenkendelse_trykket
        }
        Component_51 {
            id: property_1_Billedkengendelse_ik_tryk

            x: 20
            y: 20

            property_2: Component_51.Property_1.Property_1_Billedkengendelse_ik_tryk
        }
    }
    Image {
        id: stregkode_Scanner

        x: 11
        y: 412

        clip: true
        source: Qt.resolvedUrl("assets/stregkode_Scanner.png")

        Stregkode_Scanner {
            id: property_1_Klicked

            x: 20
            y: 20

            property_2: Stregkode_Scanner.Property_1.Property_1_Klicked
        }
        Stregkode_Scanner {
            id: property_1_Ikke_klicked

            x: 20
            y: 20

            property_2: Stregkode_Scanner.Property_1.Property_1_Ikke_klicked
        }
    }
}