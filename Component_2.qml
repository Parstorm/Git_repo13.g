import QtQuick.Templates as T
import QtQuick
import QtQuick.Shapes

T.Button {
    enum Property_1 { Property_1_Arrow_Klikket, Property_1_Arrow_Ik_klikket}

    id: buttonRoot

    property int property_2: Component_2.Property_1.Property_1_Arrow_Ik_klikket

    height: 38
    width: 38

    background: Rectangle {
        id: component_2
    
        color: "transparent"
    }
    contentItem: Item {
        id: buttonRootcontentItem
    
        Shape {
            id: arrow_Ik_klikket
    
            height: 0
            width: 38
    
            rotation: 180
            visible: true
    
            ShapePath {
                id: arrow_Ik_klikket_ShapePath0
    
                fillColor: "#00000000"
                strokeColor: "#000000"
                strokeWidth: 2
    
                PathSvg {
                    id: arrow_Ik_klikket_ShapePath0_PathSvg0
    
                    path: "M 0 0 L 38 0"
                }
            }
        }
        Shape {
            id: arrow_Klikket
    
            height: 0
            width: 38
    
            rotation: 180
    
            ShapePath {
                id: arrow_Klikket_ShapePath0
    
                fillColor: "#00000000"
                strokeColor: "#000000"
                strokeWidth: 2
    
                PathSvg {
                    id: arrow_Klikket_ShapePath0_PathSvg0
    
                    path: "M 0 0 L 38 0"
                }
            }
        }
    }

    states: [
        State {
            name: "Property 1=Arrow - Ik klikket"
            when: buttonRoot.property_2 === Component_2.Property_1.Property_1_Arrow_Ik_klikket
    
            PropertyChanges {
                target: arrow_Ik_klikket
                visible: true
            }
            PropertyChanges {
                target: arrow_Klikket
                visible: false
            }
        },
        State {
            name: "Property 1=Arrow - Klikket"
            when: buttonRoot.property_2 === Component_2.Property_1.Property_1_Arrow_Klikket
    
            PropertyChanges {
                target: arrow_Ik_klikket
                visible: false
            }
            PropertyChanges {
                target: arrow_Klikket
                visible: true
            }
        }
    ]
}