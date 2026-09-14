import QtQuick

Rectangle {
    id: barcode_Main

    height: 956
    width: 440

    border.color: "#000000"
    border.width: 1
    clip: true
    color: "transparent"

    Image {
        id: image_10_1

        x: -4
        y: -4

        source: Qt.resolvedUrl("assets/image_10_1.png")
    }
    Image {
        id: rectangle_111141357

        x: 11
        y: 811

        source: Qt.resolvedUrl("assets/rectangle_111141362.png")
    }
    Group_3 {
        id: group_3

        x: 323
        y: 838

        opacity: 0.85
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
    Item {
        id: group_4

        x: 69
        y: 850

        height: 47.22
        width: 47.28

        Image {
            id: subtract

            source: Qt.resolvedUrl("assets/subtract_17.png")
        }
        Rectangle {
            id: rectangle_111141375

            x: -2.02
            y: 23.22

            height: 2.30
            width: 22.42

            color: "#757575"
            rotation: -41.18
            topRightRadius: 1
        }
        Rectangle {
            id: rectangle_111141377

            x: 27.92
            y: 28.57

            height: 2.30
            width: 13.16

            color: "#757575"
            rotation: -41.18
            topRightRadius: 1
        }
        Rectangle {
            id: rectangle_111141376

            x: 10.96
            y: 30.21

            height: 2.30
            width: 35.44

            color: "#757575"
            rotation: -131.18
        }
        Rectangle {
            id: rectangle_111141378

            x: 36.68
            y: 29.52

            height: 2.30
            width: 11.73

            color: "#757575"
            rotation: -131.18
        }
        Image {
            id: ellipse_17

            x: 32.25
            y: 9.21

            source: Qt.resolvedUrl("assets/ellipse_24.png")
        }
    }
    Item {
        id: group_5

        x: 69
        y: 850

        height: 47.22
        width: 47.28

        Image {
            id: subtract_1

            source: Qt.resolvedUrl("assets/subtract_18.png")
        }
        Rectangle {
            id: rectangle_111141379

            x: -2.02
            y: 23.22

            height: 2.30
            width: 22.42

            color: "#757575"
            rotation: -41.18
            topRightRadius: 1
        }
        Rectangle {
            id: rectangle_111141380

            x: 27.92
            y: 28.57

            height: 2.30
            width: 13.16

            color: "#757575"
            rotation: -41.18
            topRightRadius: 1
        }
        Rectangle {
            id: rectangle_111141381

            x: 10.96
            y: 30.21

            height: 2.30
            width: 35.44

            color: "#757575"
            rotation: -131.18
        }
        Rectangle {
            id: rectangle_111141382

            x: 36.68
            y: 29.52

            height: 2.30
            width: 11.73

            color: "#757575"
            rotation: -131.18
        }
        Image {
            id: ellipse_18

            x: 32.25
            y: 9.21

            source: Qt.resolvedUrl("assets/ellipse_25.png")
        }
    }
    Image {
        id: exclude

        x: 61
        y: 376

        source: Qt.resolvedUrl("assets/exclude_2.png")
    }
    Image {
        id: component_52

        x: 4
        y: 19

        clip: true
        source: Qt.resolvedUrl("assets/component_52.png")

        Component_52 {
            id: property_1_Group_11

            x: 20
            y: 20

            property_2: pressed
            ? Component_52.Property_1.Property_1_Group_11
            : Component_52.Property_1.Property_1_Group_12

            onClicked: console.log("Group 11 button clicked")
        }
    }
    Image {
        id: component_53

        x: 159.16
        y: 814.04

        clip: true
        source: Qt.resolvedUrl("assets/component_53.png")

        Component_53 {
            id: property_1_Group_2

            x: 20
            y: 20

            property_2: pressed
            ? Component_53.Property_1.Property_1_Group_2
            : Component_53.Property_1.Property_1_Group_6

            onClicked: console.log("Group 2 button clicked")
        }
    }
}