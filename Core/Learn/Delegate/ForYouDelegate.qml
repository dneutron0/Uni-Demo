import QtQuick 2.15
import QtQuick.Controls

Column {
    width: mainLayout.width
    spacing: 1


    Rectangle {
        id: topicLabelFrame
        height: topicLabel.implicitHeight + 10
        width: parent.width

        Label {
            id: topicLabel
            font.pixelSize: 20
            text: "For You"
            font.weight: 450
            leftPadding: 10
            anchors.verticalCenter: parent.verticalCenter
            width: contentWidth
            height: contentHeight


        }
    }


    Repeater {
        model: 5

        Rectangle {
            width: mainLayout.width
            height: mainLayout.height*.1

            Rectangle {
                color: "slategray"
                width: parent.width
                height: parent.height
            }
        }

    }
}
