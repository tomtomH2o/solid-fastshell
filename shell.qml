import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Shapes
import Quickshell.Widgets

Scope {
    Bar {}
//    FloatingWindow {
//        id:dasWindow
//        
//        color: '#00000000'
//        function checktouching( itemA ,itemB ) {
//            // Access properties to register them as dependencies for the binding system
//            itemA.x; itemA.y;
//            itemB.x; itemB.y;
//
//            var rectA = itemA.mapToItem(null, 0, 0, itemA.width, itemA.height)
//            var rectB = itemB.mapToItem(null, 0, 0, itemB.width, itemB.height)
//        
//            return (
//                rectA.x+rectA.width > rectB.x &&
//                rectA.x             < rectB.x+rectB.width &&
//                rectA.y             < rectB.y+rectB.height &&
//                rectA.y+rectA.height> rectB.y
//            )
//        }
//
//        property var touching: checktouching(p,b)
//
//
//        Rectangle {
//            id:p
//            
//            width:height; height:20
//            color:dasWindow.touching ? "green" : Solid.color.primary
//
//
//
//
//            NumberAnimation {
//                id:moveRight
//                target: p
//                property: "y"
//                to: 100
//                running:true
//                duration: 4000
//                easing.type: Easing.InOutQuad
//                onFinished: moveLeft.running=true
//            }
//            NumberAnimation {
//                id:moveLeft
//                target: p
//                property: "y"
//                to: 0
//                duration: 5963
//                easing.type: Easing.InOutQuad
//                onFinished: moveRight.running=true
//            }
//
//
//        }
//        Rectangle {
//            id:b
//            
//            width:height; height:20
//            y:height/2
//            color:dasWindow.touching ? "green" : Solid.color.primary
//
//            NumberAnimation {
//                id:moveRightb
//                target: b
//                property: "y"
//                to: 100
//                running:true
//                duration: 1500
//                easing.type: Easing.InOutQuad
//                onFinished: moveLeftb.running=true
//            }
//            NumberAnimation {
//                id:moveLeftb
//                target: b
//                property: "y"
//                to: 0
//                duration: 1500
//                easing.type: Easing.InOutQuad
//                onFinished: moveRightb.running=true
//            }
//
//
//        }
//
//
//    }
//    FloatingWindow{
//        color:"transparent"
//        Component {
//            id: thangsDelegate
//            Item {
//                id:itemWrapper
//                width:view.cellWidth;height:view.cellHeight
//                Image{
//                    id:thumbs;
//                    anchors.centerIn:parent
//                    source: filePath; sourceSize.height: itemWrapper.height
//                    width:itemWrapper.width-5;height:itemWrapper.height-5
//                    fillMode: Image.PreserveAspectFit
//                    }
//
//                Text {color:"white";text: fileName ; anchors.horizontalCenter: thumbs.horizontalCenter ; anchors.bottom:thumbs.bottom}
//                
//            }
//        }
//        Component {
//            id:highlight
//            Rectangle{
//                id:ts
//
//                property bool topOnScreen:  y-view.contentY > 0 
//                property bool bottomOnScreen:  y+height-view.contentY < view.height 
//                
//                width:view.cellWidth; height:view.cellHeight
//                
//                color:"darkblue"; radius:7
//                x: view.currentItem.x
//                y: view.currentItem.y
//                z:2
//                Behavior on x {SpringAnimation {spring:3; damping:0.2}}
//                Behavior on y {SpringAnimation {spring:3; damping:0.2}}
//                
//                Text{text:Math.round(parent.y)+ " "+ view.contentY + " " + view.height ; anchors.centerIn:parent; color:"white"}
//                
//                onTopOnScreenChanged: {
//                    if (!topOnScreen) {
//                        view.contentY = y 
//                }}
//                onBottomOnScreenChanged: console.log("bottom visible " + bottomOnScreen)
//                }
//                
//        }
//
//        GridView{
//            x:10
//            id:view
//            anchors.centerIn:parent
//            width:parent.width - parent.width % cellWidth
//            height:parent.height
//            cellWidth: 300; cellHeight:200
//
//            model: ListOfThangs{}
//            delegate: thangsDelegate
//            highlight: highlight
//            highlightFollowsCurrentItem: false
//            focus:true
//        }    
//    }

    //BottomBar {}
}
