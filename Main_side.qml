import QtQuick
import QtQuick.Controls
import QtQuick.Shapes
import QtMultimedia

Item {
    id: main_side
    width: 440
    height: 956
    clip: true

    property var navigationStack: StackView.view

    function goBack() {
        if (navigationStack && navigationStack.depth > 1) {
            navigationStack.pop()
        }
    }

    function openGallery() {
        if (navigationStack) {
            navigationStack.push(Qt.resolvedUrl("Galleri_view.qml"))
        }
    }

    function openQuestions() {
        if (navigationStack) {
            navigationStack.push(Qt.resolvedUrl("Sp_rgsm_l_main.qml"))
        }
    }

    function showResult(className, confidence) {
        if (navigationStack) {
            navigationStack.push(Qt.resolvedUrl("Main_med_detection.qml"), {
                detectedClass: className,
                confidence: confidence
            })
        }
    }

    // Live camera replaces the static Figma placeholder image.
    VideoOutput {
        id: videoOutput
        anchors.fill: parent
        fillMode: VideoOutput.PreserveAspectCrop
    }

    // Darken the very top slightly so the existing camera controls remain readable.
    Rectangle {
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: 115
        color: "#000000"
        opacity: 0.08
    }

    // Existing generated UI stays on top of the camera feed.
    Rectangle {
        id: rectangle_111141358
        x: -108
        y: -109
        width: 656
        height: 1168
        border.color: "#5c6d47"
        border.width: 119
        color: "transparent"
        radius: 168
    }

    Image {
        id: rectangle_111141357
        x: 11
        y: 811
        source: Qt.resolvedUrl("assets/rectangle_111141357.png")
    }

    Image {
        id: subtract
        x: 34
        y: 200
        source: Qt.resolvedUrl("assets/subtract_4.png")
    }

    Image {
        id: controlsButton
        x: 24
        y: 39
        source: Qt.resolvedUrl("assets/controlsButton.png")
    }

    Image {
        id: component_2
        x: 15
        y: 49
        clip: true
        source: Qt.resolvedUrl("assets/component_2.png")
    }

    Component_2 {
        id: property_1_Arrow_Klikket
        x: 35
        y: 69
        property_2: Component_2.Property_1.Property_1_Arrow_Klikket
        onClicked: main_side.goBack()
    }
    Component_2 {
        id: property_1_Arrow_Ik_klikket
        x: 35
        y: 69
        property_2: Component_2.Property_1.Property_1_Arrow_Ik_klikket
        onClicked: main_side.goBack()
    }

    // This is the existing centre shutter button from the generated design.
    Component_29 {
        id: component_29
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: rectangle_111141357.verticalCenter
        property_2: Component_29.Property_1.Property_1_Variant4
        onClicked: controller.capturePhoto()
    }

    Image {
        id: component_49
        x: 306
        y: 825
        clip: true
        source: Qt.resolvedUrl("assets/component_49.png")

        R {
            id: property_1_Variant4_1
            x: 20
            y: 20
            opacity: 0.85
            property_2: R.Property_1.Property_1_Variant4
            onClicked: main_side.openQuestions()
        }
        R {
            id: property_1_Variant3_1
            x: 20
            y: 20
            opacity: 0.85
            property_2: R.Property_1.Property_1_Variant3
            onClicked: main_side.openQuestions()
        }
    }

    Image {
        id: gallery_klikket
        x: 49
        y: 830
        clip: true
        source: Qt.resolvedUrl("assets/gallery_klikket.png")

        Gallery_klikket {
            id: property_1_Pressed
            x: 20
            y: 20
            property_2: Gallery_klikket.Property_1.Property_1_Pressed
            onClicked: main_side.openGallery()
        }
        Gallery_klikket {
            id: property_1_Default
            x: 20
            y: 20
            property_2: Gallery_klikket.Property_1.Property_1_Default
            onClicked: main_side.openGallery()
        }
    }

    // Small status strip is deliberately on top of the live video so camera/
    // permission/ML errors do not disappear into the console.
    Rectangle {
        id: statusStrip
        x: 16
        y: 112
        width: 408
        height: 36
        radius: 12
        color: "#55000000"

        Text {
            anchors.fill: parent
            anchors.leftMargin: 12
            anchors.rightMargin: 12
            text: main_side.statusText
            color: "white"
            font.pixelSize: 14
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
        }
    }

    property string statusText: "Camera starting…"

    Connections {
        target: controller

        function onStatusChanged(message) {
            main_side.statusText = message
        }

        function onErrorOccurred(message) {
            main_side.statusText = message
        }

        function onScanResultReady(className, confidence, imagePath) {
            main_side.showResult(className, confidence)
        }
    }

    Component.onCompleted: {
        controller.attachVideoOutput(videoOutput)
        controller.startCamera()
    }

    StackView.onActivated: controller.attachVideoOutput(videoOutput)

    Component.onDestruction: {
        controller.stopCamera()
    }
}
