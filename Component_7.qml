import QtQuick.Templates as T
import QtQuick
import QtQuick.Shapes

T.Button {
    enum Property_1 { Property_1_Button_klikked, Property_1_Button_ik_klikked}

    id: buttonRoot

    property int property_2: Component_7.Property_1.Property_1_Button_klikked

    height: 80.63
    width: 80.63

    background: Rectangle {
        id: component_7
    
        color: "transparent"
    }
    contentItem: Item {
        id: buttonRootcontentItem
    
        Image {
            id: subtract
    
            source: Qt.resolvedUrl("assets/subtract_12.png")
        }
        Shape {
            id: ellipse_15
    
            x: 6.84
            y: 6.96
    
            height: 66
            width: 66
    
            ShapePath {
                id: ellipse_15_ShapePath0
    
                fillColor: "#c8cf1f"
                fillRule: ShapePath.WindingFill
                joinStyle: ShapePath.MiterJoin
                strokeColor: "#00000000"
                strokeStyle: ShapePath.SolidLine
                strokeWidth: 1
    
                PathSvg {
                    id: ellipse_15_ShapePath0_PathSvg0
    
                    path: "M 65.99990348815919 33 C 65.99990348815919 51.225396728515626 51.22530021667481 66 32.999903488159184 66 C 14.774506759643558 66 -0.00009569771937094629 51.225396728515626 -0.00009569771937094629 33 C -0.00009569771937094629 14.774603271484374 14.774506759643558 0 32.999903488159184 0 C 51.22530021667481 0 65.99990348815919 14.774603271484374 65.99990348815919 33 Z"
                }
            }
        }
    }

    states: [
        State {
            name: "Property 1=Button - klikked"
            when: buttonRoot.property_2 === Component_7.Property_1.Property_1_Button_klikked
    
            PropertyChanges {
                source: Qt.resolvedUrl("assets/subtract_12.png")
                target: subtract
            }
        },
        State {
            name: "Property 1=Button - ik klikked"
            when: buttonRoot.property_2 === Component_7.Property_1.Property_1_Button_ik_klikked
    
            PropertyChanges {
                source: Qt.resolvedUrl("assets/subtract_13.png")
                target: subtract
            }
        }
    ]
}