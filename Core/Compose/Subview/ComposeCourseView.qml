import QtQuick 2.15
import QtQuick.Controls


ListView {
    id: composeCourseView
    width: composeRoot.width
    height: composeRoot.height

    header: Rectangle {
        width: composeCourseView.width
        height: composeCourseView.height*.38
        color: "whitesmoke"

        Image {
            anchors.centerIn: parent
            width: parent.width*.3
            height: width
            source: "qrc:/images/Resources/cloud-upload-icon.svg"
        }

        Button {
            width: parent.width * .8
            height: parent.height * .2
            anchors.bottom: parent.bottom
            text: "Upload file(s)"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 5
        }

    }
}

