import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Mpris
import Quickshell.Widgets
import QtQuick.Shapes

ClippingRectangle {
    id: root
    implicitHeight: textHere.implicitHeight+squigglePath.confAmplitude*2+10
    implicitWidth: 300
    color: '#00000000'
    property var playing: false
    property var activePlayer: {
        var players = Mpris.players.values
        const desiredPlayers = []


        if (players.length === 0){return null}

        const playing = players.find((play)  => play.playbackState === MprisPlaybackState.Playing)
        if (playing) {
            console.log("yes")
            root.playing=true
        } else {
            console.log("no")
            root.playing=false
        }


        return playing ? playing : players[0];
    }

    Item {
        id:squiggleRoot
        property var barLength: root.implicitWidth-10
        property var barProgressPercent:root.activePlayer.position/root.activePlayer.length
        property var barProgress: Math.floor(barLength*barProgressPercent)
        x:2
        y:textHere.implicitHeight



        Rectangle{
            width:squiggleRoot.barLength-squiggleRoot.barProgress
            height:2.5
            anchors.left:progressBall.horizontalCenter//
            anchors.verticalCenter:progressBall.verticalCenter
            radius:height
            color:'#606b6b6b'
        }

        Rectangle{
            id:progressBall
            width:squigglePath.confAmplitude*1.5
            height:squigglePath.confAmplitude*1.5
            color:SolidTheme.colorA
            radius:width/2
            anchors.horizontalCenter:squiggleClip.right
            anchors.verticalCenter:squiggleClip.verticalCenter

        }
        ClippingRectangle{
            id:squiggleClip
            implicitHeight:squigglePath.middleY+squigglePath.confAmplitude 
            implicitWidth:squiggleRoot.barProgress
            color: "transparent"
            Shape {
                id:squiggleNew
                anchors.fill: parent
                layer.enabled: true
                layer.samples: 4

                ShapePath {
                    id:squigglePath
                    strokeColor:SolidTheme.colorA
                    fillColor:"transparent"
                    strokeWidth:2

                    property real amplitude: 5
                    property real confAmplitude: 5
                    property real wavelength: confAmplitude*4
                    property real phase: 0
                    property real middleY: confAmplitude
                    startX:phase ; startY:middleY
                }
            }
            Instantiator {
                active: true
                model:Math.floor(squiggleRoot.barLength/squigglePath.wavelength*2)+2  // jesus ts ugly
                onObjectAdded: (index,object) => squigglePath.pathElements.push(object)


                delegate: PathQuad {
                    required property var index
                    property var idex: index + 1
                    property var p: squigglePath
                    property var base: p.phase + Math.floor(index/2) * p.wavelength


                    y:p.middleY
                    controlY:index % 2 == 0 ? p.middleY-p.amplitude : p.middleY+p.amplitude
                    //you'd not belive how much of a pain in the ass ts was
                    x:(index%2==0) ?  base + p.wavelength * 0.5 :  base + p.wavelength * 1
                    controlX:(index%2==0) ?  base + p.wavelength * 0.25 :  base + p.wavelength * 0.75

                } 



            }
            NumberAnimation {
                id:squiggleAnim
                target: squigglePath
                running:true
                property: "phase"
                duration: 2500
                to: 0-squigglePath.wavelength
                easing.type: Easing.Linear
                onFinished: {squigglePath.phase = 0;squiggleAnim.running=true}
            }
            
        }
        FrameAnimation {
            running: root.activePlayer.playbackState == MprisPlaybackState.Playing
            onTriggered: root.activePlayer.positionChanged()
            
        }
        NumberAnimation {
            id:pauseAnim
            running: root.playing ? false: squigglePath.amplitude==0 ? false : true
            target: squigglePath
            property: "amplitude"
            duration: 1000
            to:0
            easing.type: Easing.InOutQuad
        }
        NumberAnimation {
            id:playAnim
            running: root.playing ? squigglePath.amplitude==squigglePath.confAmplitude ? false : true : false
            target: squigglePath
            property: "amplitude"
            duration: 1000
            to:squigglePath.confAmplitude
            easing.type: Easing.InOutQuad
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
    
}
