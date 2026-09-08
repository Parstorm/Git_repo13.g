import QtQuick.Templates as T
import QtQuick
import QtQuick.Shapes

T.Button {
    enum Property_1 { Property_1_Arrow_ik_klikked, Property_1_Arrow_klikked}

    id: buttonRoot

    property int property_2: Component_5.Property_1.Property_1_Arrow_ik_klikked

    height: 0
    width: 38

    background: Rectangle {
        id: component_5
    
        color: "transparent"
    }
    contentItem: Item {
        id: buttonRootcontentItem
    
        Shape {
            id: arrow_ik_klikked
    
            height: 0
            width: 38
    
            rotation: 180
            visible: true
    
            ShapePath {
                id: arrow_ik_klikked_ShapePath0
    
                fillColor: "#00000000"
                strokeColor: "#000000"
                strokeWidth: 2
    
                PathSvg {
                    id: arrow_ik_klikked_ShapePath0_PathSvg0
    
                    path: "M 0 0 L 38 0"
                }
            }
        }
        Shape {
            id: arrow_klikked
    
            height: 0
            width: 38
    
            rotation: 180
    
            ShapePath {
                id: arrow_klikked_ShapePath0
    
                fillColor: "#00000000"
                strokeColor: "#000000"
                strokeWidth: 2
    
                PathSvg {
                    id: arrow_klikked_ShapePath0_PathSvg0
    
                    path: "M 0 0 L 38 0"
                }
            }
        }
    }

    states: [
        State {
            name: "Property 1=Arrow -ik klikked"
            when: buttonRoot.property_2 === Component_5.Property_1.Property_1_Arrow_ik_klikked
    
            PropertyChanges {
                target: arrow_ik_klikked
                visible: true
            }
            PropertyChanges {
                target: arrow_klikked
                visible: false
            }
        },
        State {
            name: "Property 1=Arrow - klikked"
            when: buttonRoot.property_2 === Component_5.Property_1.Property_1_Arrow_klikked
    
            PropertyChanges {
                target: arrow_ik_klikked
                visible: false
            }
            PropertyChanges {
                target: arrow_klikked
                visible: true
            }
        }
    ]
}