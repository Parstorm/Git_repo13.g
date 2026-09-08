import QtQuick.Templates as T
import QtQuick
import QtQuick.Shapes

T.Button {
    enum Property_1 { Property_1_Close_ik_klikked, Property_1_Close_klikked}

    id: buttonRoot

    property int property_2: Component_8.Property_1.Property_1_Close_ik_klikked

    height: 41.46
    width: 41.46

    background: Rectangle {
        id: component_8
    
        color: "transparent"
        opacity: 0.85
    }
    contentItem: Item {
        id: buttonRootcontentItem
    
        Shape {
            id: ellipse_16
    
            x: 0
            y: 0
    
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
        Item {
            id: group_9
    
            x: 7.55
            y: 7.09
    
            height: 27
            width: 27
    
            rotation: 45
    
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
            name: "Property 1=Close - ik klikked"
            when: buttonRoot.property_2 === Component_8.Property_1.Property_1_Close_ik_klikked
    
            PropertyChanges {
                width: 41.46
    
                target: ellipse_16
            }
            PropertyChanges {
                height: 41.46
    
                target: ellipse_16
            }
            PropertyChanges {
                x: 0
    
                target: ellipse_16
            }
            PropertyChanges {
                y: 0
    
                target: ellipse_16
            }
            PropertyChanges {
                path: "M 41.46428298950195 20.732145309448242 C 41.46428298950195 32.18219339071668 32.18218746922021 41.464290618896484 20.732141494750977 41.464290618896484 C 9.28209552028174 41.464290618896484 5.118756348254863e-7 32.18219339071668 5.118756348254863e-7 20.732145309448242 C 5.118756348254863e-7 9.282097228179806 9.28209552028174 0 20.732141494750977 0 C 32.18218746922021 0 41.46428298950195 9.282097228179806 41.46428298950195 20.732145309448242 Z"
                target: ellipse_16_ShapePath0_PathSvg0
            }
        },
        State {
            name: "Property 1=Close - klikked"
            when: buttonRoot.property_2 === Component_8.Property_1.Property_1_Close_klikked
    
            PropertyChanges {
                width: 34
    
                target: ellipse_16
            }
            PropertyChanges {
                height: 34
    
                target: ellipse_16
            }
            PropertyChanges {
                x: 3.96
    
                target: ellipse_16
            }
            PropertyChanges {
                y: 3.50
    
                target: ellipse_16
            }
            PropertyChanges {
                path: "M 34 17 C 34 26.388841071495644 26.388841071495644 34 17 34 C 7.611158928504356 34 4.197292302985891e-7 26.388841071495644 4.197292302985891e-7 17 C 4.197292302985891e-7 7.611158928504356 7.611158928504356 0 17 0 C 26.388841071495644 0 34 7.611158928504356 34 17 Z"
                target: ellipse_16_ShapePath0_PathSvg0
            }
        }
    ]
}