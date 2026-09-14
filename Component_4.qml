import QtQuick.Templates as T
import QtQuick
import QtQuick.Shapes

T.Button {
    enum Property_1 { Property_1_Arrow_1_klikket, Property_1_Arrow_Ik_klik}

    id: buttonRoot

    property int property_2: Component_4.Property_1.Property_1_Arrow_1_klikket

    height: 40
    width: 38

    background: Rectangle {
        id: component_4
    
        color: "transparent"
    }
    contentItem: Item {
        id: buttonRootcontentItem
    
        Shape {
            id: arrow_1
    
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
        Shape {
            id: arrow_Ik_klik
    
            height: 0
            width: 38
    
            rotation: 180
    
            ShapePath {
                id: arrow_Ik_klik_ShapePath0
    
                fillColor: "#00000000"
                strokeColor: "#000000"
                strokeWidth: 2
    
                PathSvg {
                    id: arrow_Ik_klik_ShapePath0_PathSvg0
    
                    path: "M 0 0 L 38 0"
                }
            }
        }
    }

    states: [
        State {
            name: "Property 1=Arrow 1 - klikket"
            when: buttonRoot.property_2 === Component_4.Property_1.Property_1_Arrow_1_klikket
    
            PropertyChanges {
                target: arrow_1
                visible: true
            }
            PropertyChanges {
                target: arrow_Ik_klik
                visible: false
            }
        },
        State {
            name: "Property 1=Arrow - Ik klik"
            when: buttonRoot.property_2 === Component_4.Property_1.Property_1_Arrow_Ik_klik
    
            PropertyChanges {
                target: arrow_1
                visible: false
            }
            PropertyChanges {
                target: arrow_Ik_klik
                visible: true
            }
        }
    ]
}