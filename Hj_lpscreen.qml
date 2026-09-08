import QtQuick
import QtQuick.Shapes

Rectangle {
    id: hj_lpscreen

    height: 956
    width: 440

    border.color: "#000000"
    border.width: 1
    clip: true
    color: "transparent"

    Rectangle {
        id: rectangle_111141394

        x: 6
        y: 55

        height: 956
        width: 429

        color: "#33332b"
    }
    Image {
        id: ellipse_18

        x: 588
        y: 805

        source: Qt.resolvedUrl("assets/ellipse_29.png")
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

        source: Qt.resolvedUrl("assets/rectangle_111141368.png")
    }
    Image {
        id: rectangle_111141357

        x: 957
        y: 10

        source: Qt.resolvedUrl("assets/rectangle_111141369.png")
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
    Text {
        id: hj_lp

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
        text: qsTr("Hjælp")
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
    }
    Item {
        id: mask_group

        x: 13
        y: 76

        height: 306
        width: 418

        Rectangle {
            id: rectangle_111141387

            x: 14
            y: 96

            height: 210
            width: 383

            color: "#67693a"
            radius: 50
        }
        Text {
            id: efter_du_er_klikket_ind_p_denne_knap_tager_du_et

            x: 37
            y: 107

            height: 174
            width: 332

            color: "#ebebeb"
            font.family: "NATS"
            font.pixelSize: 20
            font.weight: Font.Normal
            horizontalAlignment: Text.AlignHCenter
            lineHeight: 30
            lineHeightMode: Text.FixedHeight
            text: qsTr("Efter du er klikket ind på denne knap tager du et billede af det stykke affald som du er usikker på hvordan sorteres, her vil du efter du har taget billedet få fortalt hvordan du skal sortere.")
            textFormat: Text.PlainText
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
        }
        Text {
            id: billede_genkendelse

            height: 174
            width: 419

            color: "#ebebeb"
            font.family: "NATS"
            font.pixelSize: 24
            font.weight: Font.Normal
            horizontalAlignment: Text.AlignHCenter
            lineHeight: 30
            lineHeightMode: Text.FixedHeight
            text: qsTr("Billede genkendelse")
            textFormat: Text.PlainText
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
        }
    }
    Item {
        id: mask_group_1

        x: 13
        y: 83

        height: 395
        width: 418

        Rectangle {
            id: rectangle_111141388

            x: 14
            y: 89

            height: 210
            width: 383

            color: "#67693a"
            radius: 50
        }
        Rectangle {
            id: rectangle_111141389

            x: 95
            y: 61

            height: 79
            width: 227

            bottomLeftRadius: 50
            bottomRightRadius: 50
            color: "#67693a"
            topLeftRadius: 30
            topRightRadius: 30
        }
        Rectangle {
            id: rectangle_111141390

            x: 96
            y: 316

            height: 79
            width: 227

            bottomLeftRadius: 50
            bottomRightRadius: 50
            color: "#989c36"
            topLeftRadius: 30
            topRightRadius: 30
        }
        Text {
            id: efter_du_er_klikket_ind_p_denne_knap_tager_du_et_1

            x: 37
            y: 100

            height: 174
            width: 332

            color: "#ebebeb"
            font.family: "Inter"
            font.pixelSize: 19
            font.weight: Font.Normal
            horizontalAlignment: Text.AlignHCenter
            lineHeight: 30
            lineHeightMode: Text.FixedHeight
            text: qsTr("Efter du er klikket ind på denne knap tager du et billede af det stykke affald som du er usikker på hvordan sorteres, her vil du efter du har taget billedet få fortalt hvordan du skal sortere.")
            textFormat: Text.PlainText
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
        }
        Text {
            id: billedgenkendelse

            height: 174
            width: 419

            color: "#ebebeb"
            font.family: "Inter"
            font.pixelSize: 24
            font.weight: Font.Bold
            horizontalAlignment: Text.AlignHCenter
            lineHeight: 30
            lineHeightMode: Text.FixedHeight
            text: qsTr("Billedgenkendelse")
            textFormat: Text.PlainText
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
        }
    }
    Rectangle {
        id: rectangle_111141391

        x: 109
        y: 656

        height: 79
        width: 227

        bottomLeftRadius: 50
        bottomRightRadius: 50
        color: "#c8cf1f"
        topLeftRadius: 30
        topRightRadius: 30
    }
    Item {
        id: mask_group_2

        x: 31
        y: 421

        height: 217
        width: 383

        Shape {
            id: rectangle_111141392

            y: 7

            height: 210
            width: 383

            ShapePath {
                id: rectangle_111141392_ShapePath0

                fillColor: "#989c36"
                fillRule: ShapePath.WindingFill
                joinStyle: ShapePath.MiterJoin
                strokeColor: "#00000000"
                strokeStyle: ShapePath.SolidLine
                strokeWidth: 1

                PathSvg {
                    id: rectangle_111141392_ShapePath0_PathSvg0

                    path: "M 0 0 L 383 0 L 383 210 L 0 210 L 0 0 Z"
                }
            }
        }
        Text {
            id: efter_du_er_klikket_ind_p_denne_knap_scanner_du_

            x: 33

            height: 208
            width: 332

            color: "#ebebeb"
            font.family: "Inter"
            font.pixelSize: 19
            font.weight: Font.Normal
            horizontalAlignment: Text.AlignHCenter
            lineHeight: 30
            lineHeightMode: Text.FixedHeight
            text: qsTr("Efter du er klikket ind på denne knap scanner du stregkoden på det stykke affald som du er usikker på hvordan sorteres, her vil du efter du har scannet affaldet få fortalt hvordan du skal sortere.")
            textFormat: Text.PlainText
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
        }
    }
    Text {
        id: stregkode_scanner

        x: 60
        y: 316

        height: 208
        width: 332

        color: "#ebebeb"
        font.family: "Inter"
        font.pixelSize: 22
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignHCenter
        lineHeight: 30
        lineHeightMode: Text.FixedHeight
        text: qsTr("Stregkode scanner")
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
    }
    Item {
        id: mask_group_3

        x: 31
        y: 656

        height: 238
        width: 383

        Shape {
            id: rectangle_111141393

            y: 28

            height: 210
            width: 383

            ShapePath {
                id: rectangle_111141393_ShapePath0

                fillColor: "#c8cf1f"
                fillRule: ShapePath.WindingFill
                joinStyle: ShapePath.MiterJoin
                strokeColor: "#00000000"
                strokeStyle: ShapePath.SolidLine
                strokeWidth: 1

                PathSvg {
                    id: rectangle_111141393_ShapePath0_PathSvg0

                    path: "M 0 0 L 383 0 L 383 210 L 0 210 L 0 0 Z"
                }
            }
        }
        Image {
            id: efter_du_er_klikket_ind_p_denne_knap_indtaster_d

            x: 33

            source: Qt.resolvedUrl("assets/efter_du_er_klikket_ind_p_denne_knap_indtaster_d.png")
        }
    }
    Text {
        id: cO2_Lommeregner

        x: 106
        y: 652

        height: 53
        width: 248

        color: "#ebebeb"
        font.family: "Inter"
        font.pixelSize: 19
        font.weight: Font.Bold
        horizontalAlignment: Text.AlignHCenter
        text: qsTr("CO2 Lommeregner")
        textFormat: Text.PlainText
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.Wrap
    }
    Rectangle {
        id: rectangle_111141400

        x: 294
        y: 853

        height: 41
        width: 81

        color: "#ebebeb"
        topLeftRadius: 15
        topRightRadius: 5
    }
    Shape {
        id: rectangle_111141401

        x: 359
        y: 811

        height: 81
        width: 16

        ShapePath {
            id: rectangle_111141401_ShapePath0

            fillColor: "#ebebeb"
            fillRule: ShapePath.WindingFill
            joinStyle: ShapePath.MiterJoin
            strokeColor: "#00000000"
            strokeStyle: ShapePath.SolidLine
            strokeWidth: 1

            PathSvg {
                id: rectangle_111141401_ShapePath0_PathSvg0

                path: "M 4 0 L 8.5 0 L 16 81 L 0 81 L 4 0 Z"
            }
        }
    }
    Shape {
        id: rectangle_111141402

        x: 341
        y: 811

        height: 83
        width: 16

        ShapePath {
            id: rectangle_111141402_ShapePath0

            fillColor: "#ebebeb"
            fillRule: ShapePath.WindingFill
            joinStyle: ShapePath.MiterJoin
            strokeColor: "#00000000"
            strokeStyle: ShapePath.SolidLine
            strokeWidth: 1

            PathSvg {
                id: rectangle_111141402_ShapePath0_PathSvg0

                path: "M 4 0 L 8.5 0 L 16 83 L 0 83 L 4 0 Z"
            }
        }
    }
    Image {
        id: component_12

        x: 335
        y: 5

        clip: true
        source: Qt.resolvedUrl("assets/component_12.png")

        Component_12 {
            id: property_1_Info_klikked

            x: 20
            y: 20

            opacity: 0.85
            property_2: Component_12.Property_1.Property_1_Info_klikked
        }
    }
    Component_12_Info_ik_klikked {
        id: component_12_Info_ik_klikked

        x: 355
        y: 25

        opacity: 0.85
    }
}