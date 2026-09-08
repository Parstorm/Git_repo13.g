import QtQuick

Image {
    id: galleri_view

    clip: true
    source: Qt.resolvedUrl("assets/galleri_view.png")

    Image {
        id: rectangle_111141357

        x: 11
        y: 796

        source: Qt.resolvedUrl("assets/rectangle_111141360.png")
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

        source: Qt.resolvedUrl("assets/controlsButton_1.png")
    }
    Image {
        id: subtract

        x: 34
        y: 200

        source: Qt.resolvedUrl("assets/subtract_14.png")
    }
    Image {
        id: screenshot_2026_08_31_13_12_18_899_com_snapchat_

        x: 11
        y: 615

        source: Qt.resolvedUrl("assets/screenshot_2026_08_31_13_12_18_899_com_snapchat_.png")
    }
    Rectangle {
        id: rectangle_111141379

        x: 415
        y: 615

        height: 208
        width: 14

        bottomRightRadius: 7
        color: "#b2d9d9d9"
        topRightRadius: 7
    }
    Rectangle {
        id: rectangle_111141380

        x: 415
        y: 631

        height: 37
        width: 14

        bottomRightRadius: 7
        color: "#4b4b4d"
        topRightRadius: 7
    }
    Image {
        id: component_5

        x: 15
        y: 49

        clip: true
        source: Qt.resolvedUrl("assets/component_5.png")

        Component_5 {
            id: property_1_Arrow_ik_klikked

            x: 20
            y: 20

            property_2: Component_5.Property_1.Property_1_Arrow_ik_klikked
        }
        Component_5 {
            id: property_1_Arrow_klikked

            x: 20
            y: 20

            property_2: Component_5.Property_1.Property_1_Arrow_klikked
        }
    }
    Image {
        id: component_6

        x: 302
        y: 817.96

        clip: true
        source: Qt.resolvedUrl("assets/component_6.png")

        Component_6 {
            id: property_1_Info_ik_klikked

            x: 20
            y: 20

            opacity: 0.85
            property_2: Component_6.Property_1.Property_1_Info_ik_klikked
        }
        Component_6 {
            id: property_1_Info_klikked

            x: 20
            y: 20

            opacity: 0.85
            property_2: Component_6.Property_1.Property_1_Info_klikked
        }
    }
    Image {
        id: component_7

        x: 158.16
        y: 814

        clip: true
        source: Qt.resolvedUrl("assets/component_7.png")

        Component_7 {
            id: property_1_Button_klikked

            x: 20
            y: 20

            property_2: Component_7.Property_1.Property_1_Button_klikked
        }
        Component_7 {
            id: property_1_Button_ik_klikked

            x: 20
            y: 20

            property_2: Component_7.Property_1.Property_1_Button_ik_klikked
        }
    }
    Image {
        id: component_50

        x: 48
        y: 829.96

        clip: true
        source: Qt.resolvedUrl("assets/component_50.png")

        Component_50 {
            id: property_1_Galleri_ik_Clicked

            x: 20
            y: 20

            property_2: Component_50.Property_1.Property_1_Galleri_ik_Clicked
        }
        Component_50 {
            id: property_1_Galleri_Clicked

            x: 20
            y: 20

            property_2: Component_50.Property_1.Property_1_Galleri_Clicked
        }
    }
}