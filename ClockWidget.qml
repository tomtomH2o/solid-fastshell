// ClockWidget.qml
import Quickshell
import QtQuick

Text {
    id: clockHere
    property string timeFormat: "~ hh:mm:ss AP ~"

    

    color: Solid.color.on_primary
    text: Qt.formatDateTime(clock.date, timeFormat)

    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }
}

// Scope  {
//    id: root
//    property string displayTime: "ballin"
//
//    Text {
//        text: root.displayTime
//        anchors.centerIn: parent
//        color: "black"
//    }
//
//    Process {
//        id: grabTime
//        command: ["date","+~ %r %N~"]
//        running: true
//
//        stdout: StdioCollector {
//            onStreamFinished: root.displayTime = this.text
//        }
//    }
//
//    Timer {
//        interval: 100
//        running: true
//        repeat: true
//        onTriggered: grabTime.running = true
//    }
// }
