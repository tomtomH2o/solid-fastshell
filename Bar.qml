
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
            color: Solid.color.surface
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
                    Rectangle {
                        width:windowviz.width+10
                        height:windowviz.height
                        color:Solid.color.primary
                        radius:windowviz.height
                        Text {
                            id:windowviz
                            x:5
                            color:Solid.color.on_primary
                            text:Hyprland.activeToplevel ? Hyprland.activeToplevel.title : "what, notings open :(" 
                        }
                    }

                }
                Rectangle {
                    anchors.centerIn:parent
                    width:bob.width+10
                    height:bob.height
                    radius:bob.height 

                    color:Solid.color.primary
                    ClockWidget {
                        anchors.centerIn:parent
                        id:bob
                        timeFormat: mouseHere.containsMouse ? "~ d MMMM yyyy hh:mm:ss AP t ~" : "~ hh:mm:ss AP ~" 
                        MouseArea {
                            id: mouseHere
                            anchors.fill: parent
                            anchors.margins: -15

                            hoverEnabled: true
                        }
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
