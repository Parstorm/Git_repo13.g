import QtQuick.Templates as T
import QtQuick
import QtQuick.Shapes

T.Button {
    enum Property_1 { Property_1_Group_11, Property_1_Group_12}

    id: buttonRoot

    property int property_2: Component_52.Property_1.Property_1_Group_11

    height: 60
    width: 60

    background: Rectangle {
        id: component_52
    
        color: "transparent"
    }
    contentItem: Item {
        id: buttonRootcontentItem
    
        Image {
            id: ellipse_19
    
            source: Qt.resolvedUrl("assets/ellipse_23.png")
            visible: true
        }
        Shape {
            id: arrow_1
    
            x: 11
            y: 30
    
            height: 0
            width: 38
    
            rotation: 180
            visible: true
    
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
            name: "Property 1=Group 11"
            when: buttonRoot.property_2 === Component_52.Property_1.Property_1_Group_11
    
            PropertyChanges {
                target: ellipse_19
                visible: true
            }
            PropertyChanges {
                target: arrow_1
                visible: true
            }
        },
        State {
            name: "Property 1=Group 12"
            when: buttonRoot.property_2 === Component_52.Property_1.Property_1_Group_12
    
            PropertyChanges {
                target: ellipse_19
                visible: false
            }
            PropertyChanges {
                target: arrow_1
                visible: false
            }
        }
    ]
}