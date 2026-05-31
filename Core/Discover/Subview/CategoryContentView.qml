import QtQuick 2.15
import QtQuick.Controls

Item {
    width: discoverStackView.width
    height: discoverStackView.height

    Rectangle {
        id: categoryContentViewToolbar
        width: parent.width
        height: parent.height/16
        color: "gray"

        Button {
            text: "Back"
            width: parent.height/1.5
            height: parent.height/1.5
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.verticalCenter: parent.verticalCenter
            onClicked: discoverStackView.pop();
            background: Image {
                source: "qrc:/images/Resources/back-icon.svg"
            }
        }
    }
}
