import QtQuick 2.15
import QtQuick.Controls
import "../Core/Learn"

StackView {
    id: creatorDashboardStackView
    anchors.fill: parent

    Rectangle {
        anchors.fill: parent
        color: "gray"

        Button {
            onClicked: {
                creatorDashboardViewVisible = false
            }
        }
    }


    Rectangle {
        width: parent.width * .38
        height: parent.height * .08
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        radius: 25
        color: "darkgray"



            Button {
                width: parent.width*.5
                height: parent.height
                anchors.right: parent.verticalCenter
                anchors.verticalCenter: parent.horizontalCenter
                icon.source: "qrc:/images/Resources/creator-icon.svg"
                background: null
            }

            Button {
                width: parent.width*.5
                height: parent.height
                anchors.left: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                icon.source: "qrc:/images/Resources/educator-icon.svg"
                background: null

            }

    }
}
