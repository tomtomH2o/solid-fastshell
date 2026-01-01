// is working
import Quickshell
import QtQuick
import Quickshell.Hyprland

Rectangle{
    width:workspaceRow.width+10
    height:workspaceRow.height
    radius:workspaceRow.height
    color:Solid.color.primary

    Row{
        z:2
        x:5
        id:workspaceRow
        //spacing: Solid.spacing.paddingSubWidgetSpacing
        Repeater{
            
            model: Hyprland.workspaces
            Text {
                id: textnumber
                required property var modelData
                text: modelData.name
                //color:mouseHeres.containsMouse ? Solid.color.on_primary_container : modelData.focused ?  Solid.color.on_primary_container : modelData.active ? Solid.color.on_primary : Solid.color.on_primary
                color:x>=rectUnderMouse.x&x<rectUnderMouse.x+rectUnderMouse.width ? "green":"red"
                MouseArea {
                    id: mouseHeres
                    anchors.fill: parent
                    anchors.margins: -2
                    hoverEnabled: true
                    onClicked: Hyprland.dispatch("workspace "+modelData.id)
                    onHoveredChanged: {
                        if (containsMouse) {  
                        rectUnderMouse.x = parent.x
                        rectUnderMouse.height = parent.height
                    }}
                }

            }
        }
    }
    Rectangle {
        id: rectUnderMouse
        color:Solid.color.primary_container
        z:1
        width:height
        radius:width
        
        Behavior on x {SpringAnimation {spring:4; damping:0.2}}
        onXChanged: console.log("e",x)
    }
}

