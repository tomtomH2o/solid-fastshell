// is working
import Quickshell
import QtQuick
import Quickshell.Hyprland


Row{
    spacing: SolidTheme.paddingSubWidgetSpacing
    Repeater{
        model: Hyprland.workspaces
        Text {
            id: textnumber
            required property var modelData
            text: modelData.name
            color:mouseHeres.containsMouse ? SolidTheme.colorSelected : modelData.focused ?  SolidTheme.colorA : modelData.active ? SolidTheme.colorTextInacive : SolidTheme.colorTextDimm 
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


