import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Mpris
import Quickshell.Widgets
import QtQuick.Shapes

ClippingRectangle {
    id: root
    implicitHeight: textHere.implicitHeight
    implicitWidth: 300
    color: '#008b6767'
    property var activePlayer: {
        var players = Mpris.players.values
        const desiredPlayers = []


        if (players.length === 0){return null}

        const playing = players.find((play)  => play.playbackState === MprisPlaybackState.Playing)
        if (playing) {
            console.log("yes")
        } else {
            console.log("no")
        }
        return playing ? playing : players[0];
    }

    Item {
        width:root.implicitWidth
        height:root.implicitHeight
        Shape {
            id:squiggleHere
            anchors.fill:parent
            layer.enabled: true
            layer.samples: 4
            ShapePath {
                strokeColor:SolidTheme.colorTextDimm
                strokeWidth: 2
                fillColor: "transparent"

                startX:-10
                startY:5
                PathQuad { x: 20 / 2 - 10; y: 4; controlX: 20 / 4 - 10; controlY: 4 }
                
            }
        } 
    }
    
    Text {
        id: textHere
        color: SolidTheme.colorA
        text: root.activePlayer.trackTitle
        
        onWidthChanged: {
            //even tho is 0 miliseconds, incase like idk i press skip rly quick, we make it not do shi too much
            widthDelayTimer.stop()
            widthDelayTimer.start()
        }
        Timer {
            id:widthDelayTimer
            interval:0
            running:false
            repeat:false
            onTriggered: {console.log(textHere.width)
                if (textHere.width > root.implicitWidth) {
                    console.log("owo so big *blushes*")
                    bigTextAnim.start()
                } else {
                    bigTextAnim.stop()
                    textHere.x=0
                }
            }
        }
        SequentialAnimation on x{
            id:bigTextAnim
            running:true
            loops:Animation.Infinite
            NumberAnimation {
                target: textHere
                properties: "x"
                duration: Math.floor(textHere.width*10)
                to:-5-(textHere.width-root.implicitWidth)
                easing.type:Easing.InOutQuad
            }
            PauseAnimation {duration:1000}
            NumberAnimation {
                target: textHere
                properties: "x"
                duration: Math.floor(textHere.width*10)
                to:5
                easing.type:Easing.InOutQuad
            }
            PauseAnimation {duration:1000}
        }
    }
    
}//rectangle







//        Component.onCompleted: {
//            var players = Mpris.players.values
//
//            if (players.length === 0){return null}
//
//            for (var i = 0;i < players.length;i++) {
//                console.log(players[i].trackTitle)
//            }
//                
//                
//            
//        }

        
