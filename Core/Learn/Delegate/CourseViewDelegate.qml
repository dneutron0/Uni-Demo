import QtQuick 2.15
import QtQuick.Controls
import "../Subview"
import "../../../Shared"

Column {
    id: mediaViewColumn
    width: mainLayout.width
    height: childrenRect.height
    signal openProfileRequested()
    signal openMediaPlayerRequested()

    Rectangle {
        id: mediaOuputFrame
        width: parent.width
        height: learnStackView.height*.37

        Rectangle {
            id: mediaOutputBackground
            radius: 10
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 20
            width: mediaOutputView.width*.9
            height: mediaOutputView.height * .5
            color: "black"
        }

        Rectangle {
            id: mediaOutputView
            width: mediaOuputFrame.width*.98
            height: mediaOuputFrame.height * .8
            anchors.top: mediaOutputBackground.top
            anchors.bottom: parent.bottom
            anchors.topMargin: 15
            anchors.horizontalCenter: parent.horizontalCenter
            radius: 10
            color: "black"
            border.color: "silver"
            border.width: 1

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    learnStackView.push(courseView)
                }
            }

            Rectangle {
                id: interactionPanel
                radius: 50
                width: parent.width*.3
                height: learnStackView.height * .08
                color: "gray"
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                anchors.margins: 10
                opacity: .5


            }

            Button {
                anchors.right: interactionPanel.horizontalCenter
                anchors.verticalCenter: interactionPanel.verticalCenter
                icon.source: "qrc:/images/Resources/play-icon.svg"
                background: null
                icon.color: "white"
            }

            Button {
                anchors.left: interactionPanel.horizontalCenter
                anchors.verticalCenter: interactionPanel.verticalCenter
                icon.source: "qrc:/images/Resources/plus-icon.svg"
                background: null
                icon.color: "white"

            }
        }



    }

    Rectangle {
        width: parent.width
        height: (courseDescriptionText.paintedHeight + courseCreatorUsernameLabel.height) + 30

        Rectangle {
            id: courseCreatorIcon
            width: parent.width*.15
            height: width
            radius: 100
            color: "black"
            anchors.left: parent.left
            anchors.leftMargin: 15
            anchors.top: parent.top
            anchors.topMargin: 15

        }

        Text {
            id: courseDescriptionText
            width: parent.width - courseCreatorIcon.width
            anchors.left: courseCreatorIcon.right
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.leftMargin: 10
            anchors.top: courseCreatorIcon.top
            maximumLineCount: 2
            text: "This is the description of the course this is the description of the course "
            elide: Text.ElideRight
            font.pixelSize: 18
            wrapMode: Text.Wrap
        }

        Text {
            id: courseCreatorUsernameLabel
            text: "@Username"
            anchors.left: courseDescriptionText.left
            anchors.right: parent.right
            anchors.top: courseDescriptionText.bottom
            anchors.topMargin: 10
            anchors.rightMargin: 15
            font.pixelSize: 16
        }
    }


    Rectangle {
        width: parent.width
        height: learnStackView.height * .026

        Rectangle {
            anchors.bottom: parent.bottom
            width: parent.width
            height: 1
            color: "black"
        }
    }

    Component {
        id: courseView
        CourseView { stackView: learnStackView}
    }

}
