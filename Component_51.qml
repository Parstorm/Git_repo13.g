import QtQuick.Templates as T
import QtQuick

T.Button {
    enum Property_1 { Property_1_Billedgenkendelse_trykket, Property_1_Billedkengendelse_ik_tryk}

    id: buttonRoot

    property int property_2: Component_51.Property_1.Property_1_Billedkengendelse_ik_tryk

    height: 218
    width: 387

    background: Rectangle {
        id: component_51
    
        color: "transparent"
    }
    contentItem: Item {
        id: buttonRootcontentItem
    
        Item {
            id: controlsButton
    
            x: 2
            y: 4
    
            height: 210
            width: 383
    
            Rectangle {
                id: rectangle_111141387
    
                height: 210
                width: 383
    
                color: "#67693a"
                radius: 50
            }
        }
        Text {
            id: billedgenkendelse
    
            x: 70
            y: 73
    
            height: 53
            width: 248
    
            color: "#ebebeb"
            font.family: "Inter"
            font.pixelSize: 25
            font.weight: Font.Bold
            horizontalAlignment: Text.AlignHCenter
            text: qsTr("Billedgenkendelse")
            textFormat: Text.PlainText
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.Wrap
        }
        Image {
            id: subtract
    
            source: Qt.resolvedUrl("assets/subtract_19.png")
        }
    }

    states: [
        State {
            name: "Property 1=Billedkengendelse - ik tryk"
            when: buttonRoot.property_2 === Component_51.Property_1.Property_1_Billedkengendelse_ik_tryk
    
            PropertyChanges {
                font.family: "Inter"
                target: billedgenkendelse
            }
            PropertyChanges {
                font.pixelSize: 25
                target: billedgenkendelse
            }
            PropertyChanges {
                font.weight: Font.Bold
                target: billedgenkendelse
            }
            PropertyChanges {
                source: Qt.resolvedUrl("assets/subtract_19.png")
                target: subtract
            }
        },
        State {
            name: "Property 1=Billedgenkendelse - trykket"
            when: buttonRoot.property_2 === Component_51.Property_1.Property_1_Billedgenkendelse_trykket
    
            PropertyChanges {
                font.family: "NATS"
                target: billedgenkendelse
            }
            PropertyChanges {
                font.pixelSize: 36
                target: billedgenkendelse
            }
            PropertyChanges {
                font.weight: Font.Normal
                target: billedgenkendelse
            }
            PropertyChanges {
                source: Qt.resolvedUrl("assets/subtract_20.png")
                target: subtract
            }
        }
    ]
}