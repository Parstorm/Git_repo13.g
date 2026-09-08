import QtQuick.Templates as T
import QtQuick
import QtQuick.Shapes

T.Button {
    enum Property_1 { Property_1_Group_12, Property_1_Group_13}

    id: buttonRoot

    property int property_2: Component_54.Property_1.Property_1_Group_13

    height: 60
    width: 60

    background: Rectangle {
        id: component_54
    
        color: "transparent"
    }
    contentItem: Item {
        id: buttonRootcontentItem
    
        Image {
            id: ellipse_19
    
            source: Qt.resolvedUrl("assets/ellipse_26.png")
        }
        Shape {
            id: arrow_1
    
            x: 11
            y: 30
    
            height: 0
            width: 38
    
            rotation: 180
    
            ShapePath {
                id: arrow_1_ShapePath0
    
                fillColor: "#00000000"
                strokeColor: "#000000"
                strokeWidth: 2
    
                PathSvg {
                    id: arrow_1_ShapePath0_PathSvg0
    
                    path: "M 0 0 L 38 0"
                }
            }
        }
    }

    states: [
        State {
            name: "Property 1=Group 13"
            when: buttonRoot.property_2 === Component_54.Property_1.Property_1_Group_13
    
            PropertyChanges {
                source: Qt.resolvedUrl("assets/ellipse_26.png")
                target: ellipse_19
            }
        },
        State {
            name: "Property 1=Group 12"
            when: buttonRoot.property_2 === Component_54.Property_1.Property_1_Group_12
    
            PropertyChanges {
                source: Qt.resolvedUrl("assets/ellipse_27.png")
                target: ellipse_19
            }
        }
    ]
}