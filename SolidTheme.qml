pragma Singleton

import QtQuick

Item {
    property color colorA: '#f5abff'
    property color colorSelected: '#fce2ff'
    property color colorTextInacive: '#aa7bb1'
    property color colorTextDimm: '#6c4d70'
    property color colorBG: '#1c3a3a3a'

    property int paddingMonitorEdge:10 // padding added to left and right blocks to push away from nonitor
    property int paddingMajorRowSpacing:15 // space between widgets
    property int paddingSubWidgetSpacing:3 // space between repeated entries in a widget like workspace viz

} 