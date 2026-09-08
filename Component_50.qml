import QtQuick.Templates as T
import QtQuick

T.Button {
    enum Property_1 { Property_1_Galleri_ik_Clicked, Property_1_Galleri_Clicked}

    id: buttonRoot

    property int property_2: Component_50.Property_1.Property_1_Galleri_ik_Clicked

    height: 47.22
    width: 47.28

    background: Rectangle {
        id: component_50
    
        color: "transparent"
    }
    contentItem: Item {
        id: buttonRootcontentItem
    
        Image {
            id: subtract
    
            source: Qt.resolvedUrl("assets/subtract_10.png")
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
    
            source: Qt.resolvedUrl("assets/ellipse_21.png")
        }
    }

    states: [
        State {
            name: "Property 1=Galleri ik Clicked"
            when: buttonRoot.property_2 === Component_50.Property_1.Property_1_Galleri_ik_Clicked
    
            PropertyChanges {
                source: Qt.resolvedUrl("assets/subtract_10.png")
                target: subtract
            }
            PropertyChanges {
                source: Qt.resolvedUrl("assets/ellipse_21.png")
                target: ellipse_17
            }
        },
        State {
            name: "Property 1=Galleri Clicked"
            when: buttonRoot.property_2 === Component_50.Property_1.Property_1_Galleri_Clicked
    
            PropertyChanges {
                source: Qt.resolvedUrl("assets/subtract_11.png")
                target: subtract
            }
            PropertyChanges {
                source: Qt.resolvedUrl("assets/ellipse_22.png")
                target: ellipse_17
            }
        }
    ]
}