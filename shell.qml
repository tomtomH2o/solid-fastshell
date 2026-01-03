
import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Shapes
import Quickshell.Widgets

Scope {
    Bar {}
    FloatingWindow {
        id:dasWindow
        color: '#00000000'
        function checktouching(rectA,rectB) {


        
        }




        Rectangle {
            id:p
            
            width:height; height:20
            color:Solid.color.primary




            NumberAnimation {
                id:moveRight
                target: p
                property: "x"
                to: 100
                running:true
                duration: 1123
                easing.type: Easing.InOutQuad
                onFinished: moveLeft.running=true
            }
            NumberAnimation {
                id:moveLeft
                target: p
                property: "x"
                to: 0
                duration: 1000
                easing.type: Easing.InOutQuad
                onFinished: moveRight.running=true
            }


        }
        Rectangle {
            id:b
            
            width:height; height:20
            y:height/2
            color:Solid.color.primary

            NumberAnimation {
                id:moveRightb
                target: b
                property: "x"
                to: 100
                running:true
                duration: 1500
                easing.type: Easing.InOutQuad
                onFinished: moveLeftb.running=true
            }
            NumberAnimation {
                id:moveLeftb
                target: b
                property: "x"
                to: 0
                duration: 1500
                easing.type: Easing.InOutQuad
                onFinished: moveRightb.running=true
            }


        }
        FrameAnimation{
            running:true
            onTriggered:dasWindow.checktouching(p,b)
        }


    }
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
