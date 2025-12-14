import Quickshell
import Quickshell.Io
import QtQuick

Scope {
  // no more time object

  Variants {
    model: Quickshell.screens


    PanelWindow {
        visible:false
        id: bottomBar
        required property var modelData
        screen: modelData
        anchors {
            bottom: true
            left: true
            right: true
        }
        implicitHeight:20


        Text {
            id:child 
            text: "smile"
            color: "red"
            anchors.centerIn: parent

        }

        }
    }
}