import QtQuick 2.15
import QtQuick.Controls
import QtMultimedia

Rectangle {
    id: videoDelegate
    width: mediaViewColumn.width
    height: mediaViewColumn.height

    property StackView stackView

    property string username: ""
    property string displayName: ""
    property string caption: ""
    property string timestamp: ""
    property int likeCount: 0
    property int commentCount: 0
    property string mediaUrl: ""

    signal openProfileRequested()
    signal openMediaPlayerRequested()

    Column {
        id: mediaViewColumn
        width: mainLayout.width
        height: childrenRect.height

        Rectangle {
            id: userInfoFrame
            width: parent.width
            height: uploadCreatorImage.height + 10
            Image {
                id: moreOptionsButton
                width: uploadUsernameLabel.implicitHeight
                height: width
                source: "qrc:/images/Resources/elipsis-icon.svg"
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.rightMargin: 7

            }

            Rectangle {
                id: uploadCreatorImage
                width: mainLayout.height*.06
                height: width
                radius: 100
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 10
                color: "black"
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        openProfileRequested()
                    }
                }
            }

            Row {
                anchors.left: uploadCreatorImage.right
                anchors.right: moreOptionsButton.left
                anchors.leftMargin: 5
                height: uploadUsernameLabel.implicitHeight

                Label {
                    id: uploadUsernameLabel
                    anchors.left: uploadCreatorImage.right
                    anchors.top: uploadCreatorImage.top
                    anchors.leftMargin: 5
                    text: username
                    font.pixelSize: 18
                    font.weight: 400
                }


                Label {
                    id: uploadDisplayNameLabel
                    anchors.left: uploadUsernameLabel.right
                    anchors.top: uploadUsernameLabel.top
                    anchors.leftMargin: 5
                    text: displayName
                    font.pixelSize: 18
                    font.weight: 400
                }



                Label {
                    id: uploadTimeLabel
                    anchors.left: uploadDisplayNameLabel.right
                    anchors.top: uploadDisplayNameLabel.top
                    anchors.leftMargin: 5
                    text: timestamp
                    font.pixelSize: 18
                    font.weight: 400
                }
            }
        }

        Label {
            id: uploadCaptionLabel
            text: caption
            font.pixelSize: 18
            font.weight: 400
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.leftMargin: 10
            wrapMode: Label.Wrap

        }

        Rectangle {
            width: parent.width
            height: mainLayout.height*.35

            Rectangle {
                id: mediaOutputView
                width: parent.width* .98
                height: parent.height * .9
                radius: 10
                color: "black"
                anchors.centerIn: parent

                MediaPlayer {
                    id: videoPlayer
                    source: mediaUrl
                    videoOutput: videoOutput
                    audioOutput: AudioOutput {}
                    autoPlay: true
                }

                VideoOutput {
                    id: videoOutput
                    anchors.fill: parent
                    fillMode: VideoOutput.PreserveAspectCrop
                }


                MouseArea {
                    width: parent.width
                    height: parent.height

                    onClicked: {
                        openMediaPlayerRequested()
                    }
                }
            }
        }

        Rectangle {
            id: interactionPanel
            width: mainLayout.width
            height: mainLayout.height*.074
            Row {
                width: parent.width*.85
                height: parent.height
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                spacing: 5

                Button {
                    text: likeCount
                    width: parent.width*.2
                    height: parent.height
                    background: null
                    contentItem:  Row {
                        spacing: 5
                        anchors.fill: parent
                        Image {
                            id: likeButtonIcon
                            width: parent.width * .5
                            height: parent.height*.65
                            source:  "qrc:/images/Resources/heart-icon.svg"
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        Text {
                            text: likeCount
                            anchors.verticalCenter: likeButtonIcon.verticalCenter
                            font.pixelSize: 15
                            font.weight: 500
                        }
                    }
                }


                Button {
                    text: "0"
                    width: parent.width*.2
                    height: parent.height
                    background: null
                    contentItem:  Row {
                        spacing: 5
                        anchors.fill: parent
                        Image {
                            id: commentButtonIcon
                            width: parent.width * .5
                            height: parent.height*.6
                            source:  "qrc:/images/Resources/comment-icon.svg"
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        Text {
                            text: "0"
                            anchors.verticalCenter: commentButtonIcon.verticalCenter
                            font.pixelSize: 15
                            font.weight: 500
                        }
                    }
                }


                Button {
                    text: "0"
                    width: parent.width*.2
                    height: parent.height
                    background: null
                    contentItem:  Row {
                        spacing: 5
                        anchors.fill: parent
                        Image {
                            id: repostButtonIcon
                            width: parent.width * .5
                            height: parent.height*.6
                            source:  "qrc:/images/Resources/repost-icon.svg"
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        Text {
                            text: "0"
                            anchors.verticalCenter: repostButtonIcon.verticalCenter
                            font.pixelSize: 15
                            font.weight: 500
                        }
                    }
                }


                Button {
                    text: "0"
                    width: parent.width*.2
                    height: parent.height
                    background: null
                    contentItem:  Row {
                        spacing: 5
                        anchors.fill: parent
                        Image {
                            id: shareButtonIcon
                            width: parent.width * .5
                            height: parent.height*.6
                            source:  "qrc:/images/Resources/share-icon.svg"
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        Text {
                            text: "0"
                            anchors.verticalCenter: shareButtonIcon.verticalCenter
                            font.pixelSize: 15
                            font.weight: 500
                        }
                    }
                }


                Button {
                    text: "0"
                    width: parent.width*.2
                    height: parent.height
                    background: null
                    contentItem:  Row {
                        spacing: 5
                        anchors.fill: parent
                        Image {
                            id: bookmarkButtonIcon
                            width: parent.width * .5
                            height: parent.height*.6
                            source:  "qrc:/images/Resources/bookmark-icon.svg"
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        Text {
                            text: "0"
                            anchors.verticalCenter: bookmarkButtonIcon.verticalCenter
                            font.pixelSize: 15
                            font.weight: 500
                        }
                    }
                }

            }

        }



        Rectangle {
            width: parent.width
            height: 1.5
            color: "slategray"
        }

        Component {
            id: mediaPlayerView

            MediaPlayerView {

            }
        }

    }

}

