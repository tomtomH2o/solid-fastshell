// is working
import Quickshell
import QtQuick
import Quickshell.Hyprland


Row{
    spacing: Solid.spacing.paddingSubWidgetSpacing
    Repeater{
        model: Hyprland.workspaces
        Text {
            id: textnumber
            required property var modelData
            text: modelData.name
            color:mouseHeres.containsMouse ? Solid.color.colorSelected : modelData.focused ?  Solid.color.colorA : modelData.active ? Solid.color.colorTextInacive : Solid.color.colorTextDimm 
            MouseArea {
                id: mouseHeres
                anchors.fill: parent
                anchors.margins: -2
                hoverEnabled: true
                onClicked: Hyprland.dispatch("workspace "+modelData.id)
            }
        }
    }
}


