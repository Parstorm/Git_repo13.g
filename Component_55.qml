import QtQuick.Templates as T
import QtQuick
import QtQuick.Shapes

T.Button {
    enum Property_1 { Property_1_Group_9, Property_1_Group_10}

    id: buttonRoot

    property int property_2: Component_55.Property_1.Property_1_Group_9

    height: 41.46
    width: 41.46

    background: Rectangle {
        id: component_55
    
        color: "transparent"
        opacity: 0.85
    }
    contentItem: Item {
        id: buttonRootcontentItem
    
        Shape {
            id: ellipse_16
    
            height: 41.46
            width: 41.46
    
            visible: true
    
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
        Item {
            id: group_9
    
            x: 7.55
            y: 7.09
    
            height: 27
            width: 27
    
            rotation: 45
            visible: true
    
            Rectangle {
                id: rectangle_111141383
    
                y: 12
    
                height: 3
                width: 27
    
                color: "#3b3e40"
                radius: 29
                rotation: 90
            }
            Rectangle {
                id: rectangle_111141384
    
                y: 12
    
                height: 3
                width: 27
    
                color: "#3b3e40"
                radius: 29
                rotation: -180
            }
        }
    }

    states: [
        State {
            name: "Property 1=Group 9"
            when: buttonRoot.property_2 === Component_55.Property_1.Property_1_Group_9
    
            PropertyChanges {
                opacity: 0.85
                target: component_55
            }
            PropertyChanges {
                target: ellipse_16
                visible: true
            }
            PropertyChanges {
                target: group_9
                visible: true
            }
        },
        State {
            name: "Property 1=Group 10"
            when: buttonRoot.property_2 === Component_55.Property_1.Property_1_Group_10
    
            PropertyChanges {
                opacity: 1
                target: component_55
            }
            PropertyChanges {
                target: ellipse_16
                visible: false
            }
            PropertyChanges {
                target: group_9
                visible: false
            }
        }
    ]
}