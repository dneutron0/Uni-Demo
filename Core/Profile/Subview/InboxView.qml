import QtQuick 2.15
import QtQuick.Controls

Item {
    id: inboxView
    width: profileStackView.width
    height: profileStackView.height

    Rectangle {
        id: categoryContentViewToolbar
        width: parent.width
        height: parent.height * .077
        anchors.top: parent.top
        color: "transparent"

        RoundButton {
            id: backButton
            width: parent.height * .9
            height: parent.height * .9
            icon.source: "qrc:/images/Resources/back-icon.svg"
            icon.width: parent.width * .4
            icon.height: parent.height * .4
            radius: width * .5
            anchors.left: parent.left
            anchors.margins: 5
            background: null
            onClicked: profileStackView.pop()
        }

        TextField {
            id: conversationSearchField
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: backButton.right
            anchors.right: parent.right
            anchors.margins: 10
            leftPadding: 38
            placeholderText: "Search conversations"
            background: Rectangle {
                anchors.fill: parent
                border.color: "black"
                border.width: .5
                radius: 25
            }

            Image {
                source: "qrc:/images/Resources/search-icon.svg"
                width: parent.height * .5
                height: width
                anchors.left: parent.left
                anchors.leftMargin: 12
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }

    ListModel {
        id: conversationModel

        ListElement {
            recipientUsername: "Maya Chen"
            lastMessagePreview: "I sent over the biomedical notes."
            timestamp: "12m"
            avatarColor: "#6d5dfc"
        }

        ListElement {
            recipientUsername: "Jordan Lee"
            lastMessagePreview: "The robotics showcase clip is ready."
            timestamp: "1h"
            avatarColor: "#2979ff"
        }

        ListElement {
            recipientUsername: "Sam Rivera"
            lastMessagePreview: "Still reviewing CS 240 tonight?"
            timestamp: "2h"
            avatarColor: "#00a884"
        }
    }

    ListView {
        id: inboxListView
        width: parent.width
        height: parent.height - categoryContentViewToolbar.height
        anchors.top: categoryContentViewToolbar.bottom
        clip: true
        model: conversationModel
        delegate: inboxListViewDelegate
    }

    Component {
        id: inboxListViewDelegate

        Button {
            property bool matchesSearch: conversationSearchField.text.length === 0
                                         || model.recipientUsername.toLowerCase().indexOf(conversationSearchField.text.toLowerCase()) !== -1
                                         || model.lastMessagePreview.toLowerCase().indexOf(conversationSearchField.text.toLowerCase()) !== -1

            width: inboxListView.width
            height: matchesSearch ? inboxListView.height * .15 : 0
            visible: matchesSearch
            onClicked: {
                activeConversationName = model.recipientUsername
                chatViewVisible = true
            }

            background: Rectangle {
                anchors.fill: parent
                color: parent.down ? "#edf0f5" : "white"
            }

            Rectangle {
                id: participantPicture
                width: parent.height * .7
                height: width
                radius: width * .5
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 10
                color: model.avatarColor
            }

            Column {
                anchors.verticalCenter: participantPicture.verticalCenter
                anchors.left: participantPicture.right
                anchors.leftMargin: 10
                spacing: 4

                Label {
                    font.pixelSize: 18
                    text: model.recipientUsername
                    font.weight: Font.DemiBold
                }

                Label {
                    width: inboxListView.width * .68
                    font.pixelSize: 16
                    text: model.lastMessagePreview
                    color: "#59636e"
                    elide: Text.ElideRight
                }
            }

            Label {
                anchors.right: parent.right
                anchors.rightMargin: 12
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 15
                text: model.timestamp
                color: "#59636e"
            }
        }
    }
}
