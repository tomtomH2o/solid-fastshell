// is working
import Quickshell
import QtQuick
import Quickshell.Hyprland

Rectangle{
    id:root
    width:workspaceRow.width+10
    height:workspaceRow.height
    radius:workspaceRow.height
    color:Solid.color.primary
    function checktouching( itemA ,itemB ) {
        const antiMargin = 5 ;

        itemA.x; itemA.y;
        itemB.x; itemB.y;
        var rectA = itemA.mapToItem(null, 0, 0, itemA.width, itemA.height)
        var rectB = itemB.mapToItem(null, 0, 0, itemB.width, itemB.height)
    
        return (
            rectA.x+rectA.width-antiMargin  > rectB.x &&
            rectA.x                         < rectB.x+rectB.width-antiMargin &&
            rectA.y                         < rectB.y+rectB.height-antiMargin &&
            rectA.y+rectA.height-antiMargin > rectB.y
        )
    }
    property bool mouseInRow: countInRow>0
    property var countInRow: false

    property var textUnderMouseX: 0
    property var activeTextX: 25



    

    Row{
        z:2
        x:5
        spacing:5
        id:workspaceRow
        //spacing: Solid.spacing.paddingSubWidgetSpacing
        Repeater{
            
            model: Hyprland.workspaces
            Text {
                
                id: textnumber
                required property var modelData
                property bool imFocused: modelData.focused
                property bool active:modelData.active
                text: modelData.name
                //color:mouseHeres.containsMouse ? Solid.color.on_primary_container : modelData.focused ?  Solid.color.on_primary_container : modelData.active ? Solid.color.on_primary : Solid.color.on_primary
                color:root.mouseInRow ? checktouching(textnumber,rectUnderMouse) ? "green":"red" : "yellow" 
                MouseArea {
                    id: mouseInText
                    anchors.fill: parent
                    anchors.margins:0-(workspaceRow.spacing/2+1)
                    hoverEnabled: true
                    onClicked: parent.modelData.activate()
                    onEntered: {
                        root.textUnderMouseX = parent.x
                        root.countInRow ++
                    }
                    onExited: {
                        root.countInRow --
                    }
                }
                onImFocusedChanged:if (imFocused) {activeTextX=x}
            }
        }
    }
    Rectangle {
        id: rectUnderMouse
        color:Solid.color.primary_container
        z:1

        width:height; height:workspaceRow.height
        radius:width
        x:root.mouseInRow ? root.textUnderMouseX : root.activeTextX
        
        Behavior on x {SpringAnimation {spring:4; damping:0.2}}
        
        
    }
}

