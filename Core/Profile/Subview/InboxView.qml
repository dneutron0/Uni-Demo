import QtQuick 2.15
import QtQuick.Controls

Item {
    width: profileStackView.width
    height: profileStackView.height

    // Rectangle {
    //     id: inboxTitleFrame
    //     width: parent.width
    //     height: parent.height * .05
    //     anchors.top: parent.top
    //     Label {
    //         text: "Inbox"
    //         anchors.centerIn: parent
    //         font.pixelSize: 18
    //         font.bold: true
    //     }
    // }

    Rectangle {
        id: categoryContentViewToolbar
        width: parent.width
        height: parent.height*.077
        anchors.top: parent.top
        color: "transparent"

        RoundButton {
            id: mediaMenuButton
            width: parent.height*.9
            height: parent.height*.9
            icon.source: "qrc:/images/Resources/back-icon.svg"
            icon.width: parent.width*.4
            icon.height: parent.height*.4
            radius: mediaMenuButton.width*.5
            anchors.left: parent.left
            anchors.margins: 5
            background: null
            onClicked: profileStackView.pop()

        }

        Button {
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: mediaMenuButton.right
            anchors.right: parent.right
            anchors.margins: 10
            onClicked: mediaStackView.push(mediaSearchView)
            background: Rectangle {
                anchors.fill: parent
                border.color: "black"
                border.width: .5
                radius: 25
            }

            Label {
                id: searchLabel
                text: "Search"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter

            }

            Image {
                id: searchIcon
                source: "qrc:/images/Resources/search-icon.svg"
                width: parent.height*.6
                height: parent.height*.6
                anchors.right: searchLabel.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.margins: 5

            }
        }
    }


    ListView {
        id: inboxListView
        width: parent.width
        height: parent.height - categoryContentViewToolbar.height
        anchors.top: categoryContentViewToolbar.bottom
        clip: true
        model: ListModel {
            ListElement {

            }
        }

        delegate: inboxListViewDelegate
    }

    Component {
        id: inboxListViewDelegate

        Button {
            width: inboxListView.width
            height: inboxListView.height*.15
            onClicked: chatViewVisible = true
            background: Rectangle {
                anchors.fill: parent
            }

            Rectangle {
                id: messageParticipantPictureFrame
                width: parent.height*.7
                height: parent.height*.7
                radius: 100
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 10
                color: "black"
            }

            Column {
                anchors.verticalCenter: messageParticipantPictureFrame.verticalCenter
                anchors.left: messageParticipantPictureFrame.right
                anchors.leftMargin: 5
                spacing: 4

                Label {
                    id: messageParticipantUsername
                    anchors.leftMargin: 10
                    font.pixelSize: 18
                    text: "Username"
                    font.weight: Font.DemiBold

                }

                Row {
                    spacing: 5
                    Label {
                        id: messagePreview
                        anchors.leftMargin: 10
                        font.pixelSize: 18
                        text: "This is the message preview"

                    }

                    Label {
                        anchors.leftMargin: 10
                        font.pixelSize: 18
                        text: "•"

                    }

                    Label {
                        id: messageTimestamp
                        anchors.leftMargin: 10
                        font.pixelSize: 16
                        text: "2d"

                    }
                }
            }
        }
    }
}
