import QtQuick.Templates as T
import QtQuick
import QtQuick.Shapes

T.Button {
    enum Property_1 { Property_1_Button_ik_klikked, Property_1_Button_klikked}

    id: buttonRoot

    property int property_2: Component_9.Property_1.Property_1_Button_ik_klikked

    height: 80.63
    width: 80.63

    background: Rectangle {
        id: component_9
    
        color: "transparent"
    }
    contentItem: Item {
        id: buttonRootcontentItem
    
        Image {
            id: subtract
    
            source: Qt.resolvedUrl("assets/subtract_8.png")
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
            name: "Property 1=Button - ik klikked"
            when: buttonRoot.property_2 === Component_9.Property_1.Property_1_Button_ik_klikked
    
            PropertyChanges {
                source: Qt.resolvedUrl("assets/subtract_8.png")
                target: subtract
            }
            PropertyChanges {
                x: 6.84
    
                target: ellipse_15
            }
            PropertyChanges {
                y: 6.96
    
                target: ellipse_15
            }
            PropertyChanges {
                width: 66
    
                target: ellipse_15
            }
            PropertyChanges {
                height: 66
    
                target: ellipse_15
            }
            PropertyChanges {
                path: "M 65.99990348815919 33 C 65.99990348815919 51.225396728515626 51.22530021667481 66 32.999903488159184 66 C 14.774506759643558 66 -0.00009569771937094629 51.225396728515626 -0.00009569771937094629 33 C -0.00009569771937094629 14.774603271484374 14.774506759643558 0 32.999903488159184 0 C 51.22530021667481 0 65.99990348815919 14.774603271484374 65.99990348815919 33 Z"
                target: ellipse_15_ShapePath0_PathSvg0
            }
        },
        State {
            name: "Property 1=Button - klikked"
            when: buttonRoot.property_2 === Component_9.Property_1.Property_1_Button_klikked
    
            PropertyChanges {
                source: Qt.resolvedUrl("assets/subtract_9.png")
                target: subtract
            }
            PropertyChanges {
                x: 10.84
    
                target: ellipse_15
            }
            PropertyChanges {
                y: 10.96
    
                target: ellipse_15
            }
            PropertyChanges {
                width: 58
    
                target: ellipse_15
            }
            PropertyChanges {
                height: 58
    
                target: ellipse_15
            }
            PropertyChanges {
                path: "M 57.99991518656413 29 C 57.99991518656413 45.016257731119794 45.01617291768392 58 28.999915186564127 58 C 12.983657455444334 58 -0.00008409799581083159 45.016257731119794 -0.00008409799581083159 29 C -0.00008409799581083159 12.983742268880206 12.983657455444334 0 28.999915186564127 0 C 45.01617291768392 0 57.99991518656413 12.983742268880206 57.99991518656413 29 Z"
                target: ellipse_15_ShapePath0_PathSvg0
            }
        }
    ]
}