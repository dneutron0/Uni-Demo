import QtQuick 2.15
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

Item {
    id: photoThreadView
    property StackView stackView: null
    property string mediaUrl: "qrc:/images/Resources/test-image.jpg"
    property string username: "@maya"
    property string displayName: "Maya Chen"
    property string caption: "Late night study setup in the library."
    property string timestamp: "22h"
    property int likeCount: 24
    property int commentCount: 6

    signal openProfileRequested()

    width: stackView ? stackView.width : mainLayout.width
    height: mainLayout.height

    ListModel {
        id: actionModel

        ListElement { iconSource: "qrc:/images/Resources/heart-icon.svg"; metric: "24" }
        ListElement { iconSource: "qrc:/images/Resources/comment-icon.svg"; metric: "6" }
        ListElement { iconSource: "qrc:/images/Resources/repost-icon.svg"; metric: "3" }
        ListElement { iconSource: "qrc:/images/Resources/share-icon.svg"; metric: "8" }
        ListElement { iconSource: "qrc:/images/Resources/bookmark-icon.svg"; metric: "12" }
    }

    ListModel {
        id: commentModel

        ListElement { author: "@jordan"; body: "The library lighting makes this look like a study playlist cover."; timestamp: "18m" }
        ListElement { author: "@noor"; body: "Saving this setup idea for finals week."; timestamp: "44m" }
        ListElement { author: "@sam"; body: "The notes in the corner are doing real work."; timestamp: "1h" }
    }

    Rectangle {
        id: toolbar
        width: parent.width
        height: parent.height * .075
        anchors.top: parent.top
        color: "white"
        z: 1

        RoundButton {
            width: parent.height * .9
            height: width
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            icon.source: "qrc:/images/Resources/back-icon.svg"
            background: null
            onClicked: stackView.pop()
        }

        Label {
            anchors.centerIn: parent
            text: "Photo"
            font.pixelSize: 18
            font.weight: Font.DemiBold
        }
    }

    ListView {
        id: threadList
        width: parent.width
        anchors.top: toolbar.bottom
        anchors.bottom: parent.bottom
        clip: true
        model: commentModel
        spacing: 1

        header: Column {
            width: threadList.width

            Rectangle {
                width: parent.width
                height: mainLayout.height * .52
                color: "#101214"

                Image {
                    id: uploadImage
                    anchors.fill: parent
                    source: photoThreadView.mediaUrl
                    fillMode: Image.PreserveAspectCrop
                    asynchronous: true
                }
            }

            Rectangle {
                width: parent.width
                height: mainLayout.height * .105
                color: "white"

                Rectangle {
                    id: creatorAvatar
                    width: parent.height * .68
                    height: width
                    radius: width * .5
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    color: "#6d5dfc"

                    MouseArea {
                        anchors.fill: parent
                        onClicked: photoThreadView.openProfileRequested()
                    }
                }

                Column {
                    anchors.left: creatorAvatar.right
                    anchors.leftMargin: 10
                    anchors.verticalCenter: parent.verticalCenter
                    spacing: 3

                    Label {
                        text: photoThreadView.username + "  " + photoThreadView.timestamp
                        font.pixelSize: 16
                        font.weight: Font.DemiBold
                    }

                    Label {
                        text: photoThreadView.caption
                        width: photoThreadView.width - creatorAvatar.width - 35
                        font.pixelSize: 15
                        wrapMode: Text.Wrap
                        elide: Text.ElideRight
                    }
                }
            }

            Rectangle {
                id: interactionPanel
                width: parent.width
                height: mainLayout.height * .07
                color: "white"

                Row {
                    anchors.fill: parent

                    Repeater {
                        model: actionModel

                        Button {
                            width: interactionPanel.width / actionModel.count
                            height: interactionPanel.height
                            background: null

                            contentItem: Row {
                                anchors.centerIn: parent
                                spacing: 4

                                Image {
                                    width: interactionPanel.height * .38
                                    height: width
                                    source: model.iconSource
                                }

                                Text {
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: index === 0 ? photoThreadView.likeCount
                                                      : index === 1 ? photoThreadView.commentCount
                                                                    : model.metric
                                    font.pixelSize: 14
                                }
                            }
                        }
                    }
                }
            }

            Rectangle {
                width: parent.width
                height: 42
                color: "#f5f6f8"

                Label {
                    anchors.left: parent.left
                    anchors.leftMargin: 12
                    anchors.verticalCenter: parent.verticalCenter
                    text: "Comments"
                    font.pixelSize: 17
                    font.weight: Font.DemiBold
                }
            }
        }

        delegate: Rectangle {
            width: threadList.width
            height: commentBody.implicitHeight + 42
            color: index % 2 === 0 ? "white" : "#fafbfc"

            Rectangle {
                id: commentAvatar
                width: 32
                height: width
                radius: width * .5
                anchors.left: parent.left
                anchors.leftMargin: 12
                anchors.top: parent.top
                anchors.topMargin: 10
                color: index % 2 === 0 ? "#2979ff" : "#00a884"
            }

            Column {
                anchors.left: commentAvatar.right
                anchors.right: parent.right
                anchors.leftMargin: 10
                anchors.rightMargin: 12
                anchors.top: commentAvatar.top
                spacing: 3

                Label {
                    text: model.author + "  " + model.timestamp
                    font.weight: Font.DemiBold
                    color: "#39424e"
                }

                Label {
                    id: commentBody
                    width: parent.width
                    text: model.body
                    wrapMode: Text.Wrap
                    color: "#20242a"
                }
            }
        }
    }
}
