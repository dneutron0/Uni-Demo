import QtQuick 2.15
import QtQuick.Controls
import QtMultimedia

Item {
    id: mediaPlayerView
    property StackView stackView
    property string mediaUrl: ""
    property string username: "@jordan"
    property string displayName: "Jordan Lee"
    property string caption: "Quick clip from the robotics showcase."
    property string timestamp: "18h"
    property int likeCount: 41
    property int commentCount: 9

    width: stackView ? stackView.width : mainLayout.width
    height: mainLayout.height

    ListModel {
        id: commentModel

        ListElement { author: "@maya"; body: "That arm movement is much smoother than the last prototype."; timestamp: "7m" }
        ListElement { author: "@sam"; body: "Can you share the build notes after the showcase?"; timestamp: "21m" }
        ListElement { author: "@noor"; body: "The final demo was worth staying late for."; timestamp: "38m" }
    }

    ListModel {
        id: relatedModel

        ListElement { title: "Inside the robotics lab"; creator: "@jordan"; summary: "A quick walkthrough of the team's workspace."; accent: "#6d5dfc" }
        ListElement { title: "Prototype testing notes"; creator: "@maya"; summary: "Three lessons from this week's iteration."; accent: "#2979ff" }
        ListElement { title: "Showcase recap"; creator: "@sam"; summary: "Highlights from the engineering floor."; accent: "#00a884" }
    }

    Rectangle {
        id: mediaFrame
        width: parent.width
        height: parent.height * .365
        anchors.top: parent.top
        color: "#050607"
        clip: true

        MediaPlayer {
            id: videoPlayer
            source: mediaPlayerView.mediaUrl
            videoOutput: videoOutput
            audioOutput: AudioOutput {}
            autoPlay: videoOutput.visible && mediaPlayerView.mediaUrl.length > 0
        }

        VideoOutput {
            id: videoOutput
            anchors.fill: parent
            fillMode: VideoOutput.PreserveAspectCrop
            visible: mediaPlayerView.mediaUrl.indexOf(".mp4") !== -1
                     || mediaPlayerView.mediaUrl.indexOf(".mov") !== -1
                     || mediaPlayerView.mediaUrl.indexOf("video") !== -1
        }

        Image {
            anchors.fill: parent
            source: videoOutput.visible ? "" : mediaPlayerView.mediaUrl
            fillMode: Image.PreserveAspectCrop
            asynchronous: true
            visible: !videoOutput.visible && mediaPlayerView.mediaUrl.length > 0
        }

        RoundButton {
            width: 44
            height: width
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.margins: 8
            icon.source: "qrc:/images/Resources/back-icon.svg"
            background: Rectangle {
                radius: width * .5
                color: "#d9ffffff"
            }
            onClicked: stackView.pop()
        }

        MouseArea {
            anchors.fill: parent
            z: -1
            property real startX

            onPressed: startX = mouseX
            onReleased: {
                if (mouseX - startX > 100) {
                    stackView.pop()
                }
            }
        }
    }

    Rectangle {
        id: mediaInfoPanel
        width: parent.width
        height: parent.height * .17
        anchors.top: mediaFrame.bottom
        color: "#f5f6f8"

        Column {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.margins: 12
            spacing: 6

            Label {
                text: mediaPlayerView.caption
                width: parent.width
                font.pixelSize: 19
                font.weight: Font.DemiBold
                wrapMode: Text.Wrap
                elide: Text.ElideRight
            }

            Label {
                text: mediaPlayerView.username + "  " + mediaPlayerView.timestamp
                color: "#59636e"
                font.pixelSize: 15
            }

            Label {
                text: mediaPlayerView.likeCount + " likes  |  " + mediaPlayerView.commentCount + " comments"
                color: "#39424e"
                font.pixelSize: 15
            }
        }
    }

    TabBar {
        id: detailTabs
        width: parent.width
        height: parent.height * .065
        anchors.top: mediaInfoPanel.bottom

        TabButton { text: "Comments" }
        TabButton { text: "Related" }
    }

    SwipeView {
        id: detailSwipeView
        width: parent.width
        anchors.top: detailTabs.bottom
        anchors.bottom: parent.bottom
        currentIndex: detailTabs.currentIndex
        clip: true

        onCurrentIndexChanged: detailTabs.currentIndex = currentIndex

        Item {
            ListView {
                anchors.fill: parent
                clip: true
                model: commentModel

                delegate: Rectangle {
                    width: ListView.view.width
                    height: commentBody.implicitHeight + 46
                    color: index % 2 === 0 ? "white" : "#fafbfc"

                    Rectangle {
                        id: commentAvatar
                        width: 34
                        height: width
                        radius: width * .5
                        anchors.left: parent.left
                        anchors.leftMargin: 12
                        anchors.top: parent.top
                        anchors.topMargin: 12
                        color: index % 2 === 0 ? "#6d5dfc" : "#2979ff"
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
                            color: "#39424e"
                            font.weight: Font.DemiBold
                        }

                        Label {
                            id: commentBody
                            width: parent.width
                            text: model.body
                            wrapMode: Text.Wrap
                        }
                    }
                }
            }
        }

        Item {
            ListView {
                anchors.fill: parent
                clip: true
                model: relatedModel

                delegate: Rectangle {
                    width: ListView.view.width
                    height: 104
                    color: index % 2 === 0 ? "white" : "#fafbfc"

                    Rectangle {
                        id: relatedThumbnail
                        width: 112
                        height: 82
                        radius: 8
                        anchors.left: parent.left
                        anchors.leftMargin: 12
                        anchors.verticalCenter: parent.verticalCenter
                        color: model.accent
                    }

                    Column {
                        anchors.left: relatedThumbnail.right
                        anchors.right: parent.right
                        anchors.leftMargin: 12
                        anchors.rightMargin: 12
                        anchors.verticalCenter: parent.verticalCenter
                        spacing: 4

                        Label {
                            text: model.title
                            font.pixelSize: 17
                            font.weight: Font.DemiBold
                        }

                        Label {
                            text: model.creator
                            color: "#59636e"
                        }

                        Label {
                            width: parent.width
                            text: model.summary
                            color: "#39424e"
                            elide: Text.ElideRight
                        }
                    }
                }
            }
        }
    }
}
