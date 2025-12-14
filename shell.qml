import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Shapes


Scope {
    Bar {}
    BottomBar {}
    FloatingWindow{
        HyprlandWindow.opacity: 1
        
        
        Shape {
            id:squiggleBetr
            anchors.fill:parent
            layer.enabled: true
            layer.samples: 4

            

            ShapePath {
                id:q
                strokeColor:"black"
                property real wavelength: 100
                property real amplitude: 25
                property real phase: 0
                property real middleY: 50
                   
                strokeWidth: 2
                startX:0+phase ;startY:middleY 
                PathQuad { x: q.phase+q.wavelength/2;   y: q.middleY;   controlX: q.phase+q.wavelength/4 ; controlY: q.middleY-q.amplitude }
                PathQuad { x: q.phase+q.wavelength;     y: q.middleY;   controlX: q.phase+q.wavelength/4*3 ; controlY: q.middleY+q.amplitude }
                
                PathQuad { x: q.phase+q.wavelength/2+q.wavelength;   y: q.middleY;   controlX: q.phase+q.wavelength/4+q.wavelength ; controlY: q.middleY-q.amplitude }
                PathQuad { x: q.phase+q.wavelength+q.wavelength;     y: q.middleY;   controlX: q.phase+q.wavelength/4*3+q.wavelength ; controlY: q.middleY+q.amplitude }
                
            }
        }
        Item{
            id:heresStuff
            width:parent.implicitWidth
            height:parent.implicitHeight
        }
        Instantiator {
            active: true

            onObjectAdded: (index,object) => heresStuff.children.push(object)

            delegate: Rectangle {
                color: "red"
                width:10
                height:10
                x: 15
            }

        }
    } 
    
}