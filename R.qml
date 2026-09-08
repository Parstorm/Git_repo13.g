import QtQuick.Templates as T
import QtQuick
import QtQuick.Shapes

T.Button {
    enum Property_1 { Property_1_Variant4, Property_1_Variant3}

    id: buttonRoot

    property int property_2: R.Property_1.Property_1_Variant4

    height: 69.27
    width: 49.82

    background: Rectangle {
        id: r
    
        color: "transparent"
        opacity: 0.85
    }
    contentItem: Item {
        id: buttonRootcontentItem
    
        Shape {
            id: ellipse_16
    
            x: 4.04
            y: 11.50
    
            height: 41.46
            width: 41.46
    
            ShapePath {
                id: ellipse_16_ShapePath0
    
                fillColor: "#00000000"
                fillRule: ShapePath.WindingFill
                strokeColor: "#757575"
                strokeWidth: 3
    
                PathSvg {
                    id: ellipse_16_ShapePath0_PathSvg0
    
                    path: "M 41.46428298950195 20.732145309448242 C 41.46428298950195 32.18219339071668 32.18218746922021 41.464290618896484 20.732141494750977 41.464290618896484 C 9.28209552028174 41.464290618896484 5.118756348254863e-7 32.18219339071668 5.118756348254863e-7 20.732145309448242 C 5.118756348254863e-7 9.282097228179806 9.28209552028174 0 20.732141494750977 0 C 32.18218746922021 0 41.46428298950195 9.282097228179806 41.46428298950195 20.732145309448242 Z"
                }
            }
        }
        Image {
            id: design_uden_navn_14_1
    
            source: Qt.resolvedUrl("assets/design_uden_navn_14_9.png")
        }
    }

    states: [
        State {
            name: "Property 1=Variant4"
            when: buttonRoot.property_2 === R.Property_1.Property_1_Variant4
        },
        State {
            name: "Property 1=Variant3"
            when: buttonRoot.property_2 === R.Property_1.Property_1_Variant3
        }
    ]
}