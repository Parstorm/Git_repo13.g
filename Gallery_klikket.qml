import QtQuick.Templates as T
import QtQuick

T.Button {
    enum Property_1 { Property_1_Default, Property_1_Pressed}

    id: buttonRoot

    property int property_2: Gallery_klikket.Property_1.Property_1_Pressed

    height: 47.22
    width: 47.28

    background: Rectangle {
        id: gallery_klikket
    
        color: "transparent"
    }
    contentItem: Item {
        id: buttonRootcontentItem
    
        Image {
            id: subtract
    
            source: Qt.resolvedUrl("assets/subtract_2.png")
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
    
            source: Qt.resolvedUrl("assets/ellipse_17.png")
        }
    }

    states: [
        State {
            name: "Property 1=Pressed"
            when: buttonRoot.property_2 === Gallery_klikket.Property_1.Property_1_Pressed
    
            PropertyChanges {
                source: Qt.resolvedUrl("assets/subtract_2.png")
                target: subtract
            }
            PropertyChanges {
                source: Qt.resolvedUrl("assets/ellipse_17.png")
                target: ellipse_17
            }
        },
        State {
            name: "Property 1=Default"
            when: buttonRoot.property_2 === Gallery_klikket.Property_1.Property_1_Default
    
            PropertyChanges {
                source: Qt.resolvedUrl("assets/subtract_3.png")
                target: subtract
            }
            PropertyChanges {
                source: Qt.resolvedUrl("assets/ellipse_18.png")
                target: ellipse_17
            }
        }
    ]
}