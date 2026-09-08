import QtQuick

Text {
    id: element

    height: 99
    width: 115

    color: "#000000"
    font.family: "Inter"
    font.pixelSize: 12
    font.weight: Font.Normal
    horizontalAlignment: Text.AlignLeft
    text: qsTr(" ")
    textFormat: Text.PlainText
    verticalAlignment: Text.AlignTop

    transform: Scale {
        origin.x: element.width / 2
        origin.y: element.height / 2
        yScale: -1
    }
}