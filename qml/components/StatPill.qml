import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    property string label: ""
    property int value: 0

    implicitHeight: 70
    radius: 8
    color: "#f3f4f6"

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 2

        Label {
            Layout.alignment: Qt.AlignHCenter
            text: value
            color: "#111827"
            font.pixelSize: 21
            font.weight: Font.DemiBold
        }

        Label {
            Layout.alignment: Qt.AlignHCenter
            text: label
            color: "#6b7280"
            font.pixelSize: 12
        }
    }
}
