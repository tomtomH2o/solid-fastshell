
import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Services.Mpris
import Qt5Compat.GraphicalEffects


Scope {
    id:root
    Variants {
        model: Quickshell.screens

        PanelWindow {
            color: Solid.color.colorBG
            id: topBar
            required property var modelData
            screen: modelData

            anchors {
              top: true
              left: true
              right: true
            }

            implicitHeight: 30

                Row {
                    id:leftBlock

                    anchors.left: parent.left
                    anchors.leftMargin: Solid.spacing.paddingMonitorEdge
                    y:parent.height/5

                    spacing:15


                    WorkSpacesViz {}
                    Text {
                        color:Solid.color.colorA
                        text:Hyprland.activeToplevel ? Hyprland.activeToplevel.title : "what, notings open :(" 
                    }

                }
                ClockWidget {
                    anchors.centerIn:parent

                    timeFormat: mouseHere.containsMouse ? "~ d MMMM yyyy hh:mm:ss AP t ~" : "~ hh:mm:ss AP ~" 
                    MouseArea {
                        id: mouseHere
                        anchors.fill: parent
                        anchors.margins: -15

                        hoverEnabled: true
                    }
                }

                Row{
                    id:rightBlock

                    anchors.right: parent.right
                    anchors.rightMargin: Solid.spacing.paddingMonitorEdge

                    spacing:15

                    MprisThingy {id: smile}
                }


        }//panel
    }//variants
}//scope
