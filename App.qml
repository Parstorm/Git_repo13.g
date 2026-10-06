import QtQuick
import QtQuick.Controls

Item {
    id: appRoot
    width: 440
    height: 956

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: Component {
            Homescreen {}
        }
    }
}