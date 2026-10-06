import QtQuick

Rectangle {
    enum Property_1 { Property_1_Gallery_ik_klikked, Property_1_Gallery_klikked}

    id: component_10

    property int property_2: Component_10.Property_1.Property_1_Gallery_klikked

    height: 47.22
    width: 47.28

    color: "transparent"

    states: [
        State {
            name: "Property 1=Gallery - klikked"
            when: component_10.property_2 === Component_10.Property_1.Property_1_Gallery_klikked
    
            PropertyChanges {
                source: Qt.resolvedUrl("assets/subtract_6.png")
                target: subtract
            }
            PropertyChanges {
                color: "#8ff8ef"
                target: rectangle_111141375
            }
            PropertyChanges {
                color: "#8ff8ef"
                target: rectangle_111141377
            }
            PropertyChanges {
                color: "#8ff8ef"
                target: rectangle_111141376
            }
            PropertyChanges {
                color: "#8ff8ef"
                target: rectangle_111141378
            }
            PropertyChanges {
                source: Qt.resolvedUrl("assets/ellipse_19.png")
                target: ellipse_17
            }
        },
        State {
            name: "Property 1=Gallery - ik klikked"
            when: component_10.property_2 === Component_10.Property_1.Property_1_Gallery_ik_klikked
    
            PropertyChanges {
                source: Qt.resolvedUrl("assets/subtract_7.png")
                target: subtract
            }
            PropertyChanges {
                color: "#757575"
                target: rectangle_111141375
            }
            PropertyChanges {
                color: "#757575"
                target: rectangle_111141377
            }
            PropertyChanges {
                color: "#757575"
                target: rectangle_111141376
            }
            PropertyChanges {
                color: "#757575"
                target: rectangle_111141378
            }
            PropertyChanges {
                source: Qt.resolvedUrl("assets/ellipse_20.png")
                target: ellipse_17
            }
        }
    ]

    Image {
        id: subtract

        source: Qt.resolvedUrl("assets/subtract_6.png")
    }
    Rectangle {
        id: rectangle_111141375

        x: -2.02
        y: 23.22

        height: 2.30
        width: 22.42

        color: "#8ff8ef"
        rotation: -41.18
        topRightRadius: 1
    }
    Rectangle {
        id: rectangle_111141377

        x: 27.92
        y: 28.57

        height: 2.30
        width: 13.16

        color: "#8ff8ef"
        rotation: -41.18
        topRightRadius: 1
    }
    Rectangle {
        id: rectangle_111141376

        x: 10.96
        y: 30.21

        height: 2.30
        width: 35.44

        color: "#8ff8ef"
        rotation: -131.18
    }
    Rectangle {
        id: rectangle_111141378

        x: 36.68
        y: 29.52

        height: 2.30
        width: 11.73

        color: "#8ff8ef"
        rotation: -131.18
    }
    Image {
        id: ellipse_17

        x: 32.25
        y: 9.21

        source: Qt.resolvedUrl("assets/ellipse_19.png")
    }
}