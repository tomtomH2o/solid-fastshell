// is working
import Quickshell
import QtQuick
import Quickshell.Hyprland

Rectangle{
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



    MouseArea {
        id: mouseInRow
        z:2
        anchors.fill: parent
        hoverEnabled: true
    }

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
                text: modelData.name
                //color:mouseHeres.containsMouse ? Solid.color.on_primary_container : modelData.focused ?  Solid.color.on_primary_container : modelData.active ? Solid.color.on_primary : Solid.color.on_primary
                color:mouseInRow.containsMouse ? checktouching(textnumber,rectUnderMouse) ? "green":"red" : "yellow" 
                MouseArea {
                    id: mouseInText
                    anchors.fill: parent
                    anchors.margins: -2
                    hoverEnabled: true
                    onClicked: Hyprland.dispatch("workspace "+modelData.id)
                    onHoveredChanged: {
                        if (containsMouse) {   
                            rectUnderMouse.x = parent.x
                        }
                    }
                }
            }
        }
    }
    Rectangle {
        id: rectUnderMouse
        color:Solid.color.primary_container
        z:1

        width:height; height:workspaceRow.height
        radius:width
        
        Behavior on x {SpringAnimation {spring:4; damping:0.2}}
        
        
    }
}

