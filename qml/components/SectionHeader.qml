import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ColumnLayout {
    property string title: ""
    property string subtitle: ""

    Layout.fillWidth: true
    spacing: 3

    Label {
        Layout.fillWidth: true
        text: title
        color: "#111827"
        font.pixelSize: 25
        font.weight: Font.DemiBold
    }

    Label {
        Layout.fillWidth: true
        text: subtitle
        color: "#6b7280"
        wrapMode: Text.WordWrap
        font.pixelSize: 13
    }
}
