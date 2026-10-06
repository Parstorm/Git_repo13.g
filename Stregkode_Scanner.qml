import QtQuick.Templates as T
import QtQuick
import QtQuick.Shapes

T.Button {
    enum Property_1 { Property_1_Klicked, Property_1_Ikke_klicked}

    id: buttonRoot

    property int property_2: Stregkode_Scanner.Property_1.Property_1_Klicked

    height: 210
    width: 383

    background: Rectangle {
        id: stregkode_Scanner
    
        color: "transparent"
    }
    contentItem: Item {
        id: buttonRootcontentItem
    
        Shape {
            id: rectangle_111141387
    
            height: 210
            width: 383
    
            visible: true
    
            ShapePath {
                id: rectangle_111141387_ShapePath0
    
                fillColor: "#989c36"
                fillRule: ShapePath.WindingFill
                joinStyle: ShapePath.MiterJoin
                strokeColor: "#00000000"
                strokeStyle: ShapePath.SolidLine
                strokeWidth: 1
    
                PathSvg {
                    id: rectangle_111141387_ShapePath0_PathSvg0
    
                    path: "M 0 0 L 383 0 L 383 210 L 0 210 L 0 0 Z"
                }
            }
        }
        Text {
            id: stregkode_Scanner_1
    
            x: 61
            y: 75
    
            height: 57
            width: 268
    
            color: "#ebebeb"
            font.family: "NATS"
            font.pixelSize: 36
            font.weight: Font.Normal
            horizontalAlignment: Text.AlignHCenter
            text: qsTr("Stregkode Scanner")
            textFormat: Text.PlainText
            verticalAlignment: Text.AlignVCenter
            visible: true
        }
        Rectangle {
            id: rectangle_111141403
    
            x: 40
            y: 73
    
            height: 61
            width: 310
    
            border.color: "#ffffff"
            border.width: 3
            color: "transparent"
            visible: true
        }
    }

    states: [
        State {
            name: "Property 1=Klicked"
            when: buttonRoot.property_2 === Stregkode_Scanner.Property_1.Property_1_Klicked
    
            PropertyChanges {
                target: rectangle_111141387
                visible: true
            }
            PropertyChanges {
                target: stregkode_Scanner_1
                visible: true
            }
            PropertyChanges {
                target: rectangle_111141403
                visible: true
            }
        },
        State {
            name: "Property 1=Ikke klicked"
            when: buttonRoot.property_2 === Stregkode_Scanner.Property_1.Property_1_Ikke_klicked
    
            PropertyChanges {
                target: rectangle_111141387
                visible: false
            }
            PropertyChanges {
                target: stregkode_Scanner_1
                visible: false
            }
            PropertyChanges {
                target: rectangle_111141403
                visible: false
            }
        }
    ]
}