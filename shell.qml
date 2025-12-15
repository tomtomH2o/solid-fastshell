import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Shapes
import Quickshell.Widgets

Scope {
    Bar {}
    BottomBar {}
    FloatingWindow{
        HyprlandWindow.opacity: 1
        color:"transparent"
        
        
        
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

                property real wavelength: 100
                property real amplitude: 25
                property real phase: 0-100
                property real middleY: 50
                startX:phase ; startY:middleY
            }
        }
        Instantiator {
            active: true
            model:40
            onObjectAdded: (index,object) => squigglePath.pathElements.push(object)


            delegate: PathQuad {
                required property var index
                property var idex: index + 1
                property var p: squigglePath
                property var base: p.phase + Math.floor(index/2) * p.wavelength


                y:p.middleY
                controlY:index % 2 == 0 ? p.middleY-p.amplitude : p.middleY+p.amplitude
                
                x:(index%2==0) ?  base + p.wavelength * 0.5 :  base + p.wavelength * 1
                controlX:(index%2==0) ?  base + p.wavelength * 0.25 :  base + p.wavelength * 0.75

            } 

           
               
        }
        NumberAnimation {
            id:numAnim
            target: squigglePath
            running:true
            property: "phase"
            duration: 2000
            to: 0
            easing.type: Easing.Linear
            onFinished: {squigglePath.phase = 0-100;numAnim.running=true}
        }
        
    } 
    
}