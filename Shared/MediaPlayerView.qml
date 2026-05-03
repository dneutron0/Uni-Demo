import QtQuick 2.15
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

Column {
    property StackView stackView
    width: stackView.width
    height: childrenRect.height

    Rectangle {
        id: mediaPlayerView
        width: mainLayout.width
        height: mainLayout.height*.365
        color: "black"
        z: 1
        clip: true

        MouseArea {
            anchors.fill: parent
            drag.target: null
            property real startX

            onPressed: startX = mouseX

            onReleased: {
                if (mouseX - startX > 100) {
                    stackView.pop()
                }
            }
        }
    }

    ListView {
        id: mediaPlayerList
        width: mainLayout.width
        height: mainLayout.height - mediaPlayerView.height
        contentHeight: childrenRect.height
        model: 20
        spacing: 1
        header: Rectangle {
            width: mainLayout.width
            height: mainLayout.height * .3
            color: "slategray"

            Label {
                id: titleLabel
                anchors.top: parent.top
                anchors.left: parent.left
                anchors.margins: 10
                text: "This is the title of the video"
                font.pixelSize: 20
                font.weight: 650
            }

            Row {
                id: uploadMetricFrame
                anchors.top: titleLabel.bottom
                anchors.left: parent.left
                anchors.topMargin: 5
                anchors.leftMargin: 10
                spacing: 10
                Label {
                    text: "@Username"
                    font.weight: 450
                }

                Label {
                    text: "0 Views"
                    font.weight: 450

                }

                Label {
                    text: "1m ago"
                    font.weight: 450

                }
            }

            Row {
                id: uploadInteractionPanel
                anchors.top: uploadMetricFrame.bottom
                width: parent.width
                height: parent.height * .25
                anchors.left: parent.left
                anchors.topMargin: 7
                anchors.leftMargin: 5

                Rectangle {
                    id: uploadUserImage
                    width: parent.height
                    height: parent.height
                    radius: parent.width * .5
                    color: "black"
                    visible: false

                    Image {
                        anchors.fill: parent
                    }

                }

                OpacityMask {
                    width: uploadUserImage.width
                    height: uploadUserImage.height
                    source: uploadUserImage
                    maskSource: Rectangle {
                        width: uploadUserImage.width
                        height: uploadUserImage.height
                        radius: uploadUserImage.width * .5
                        visible: false
                    }
                }
            }

            Rectangle {
                id: commentPreviewFrame
                width: parent.width*.97
                height: parent.height * .34
                anchors.top: uploadInteractionPanel.bottom
                anchors.topMargin: 5
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
                radius: 5
                color: "dimgray"

                Label {
                    id: commentsTitleLabel
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.margins: 5
                    text: "Comments"
                    font.pixelSize: 16
                    font.weight: 600
                }


                Rectangle {
                    width: (parent.height - commentsTitleLabel.height) * .6
                    height: width
                    radius: width * .5
                    color: "black"
                    anchors.top: commentsTitleLabel.bottom
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    anchors.topMargin: 10
                }
            }
        }

        delegate: Rectangle {
            width: mainLayout.width
            height: mainLayout.height * .46
            color: "gray"

            Rectangle {
                id: uploadThumbnail
                width: parent.width
                height: parent.height * .75
                color: "black"
                anchors.top: parent.top
            }


            Rectangle {
                width: parent.width
                height: parent.height - uploadThumbnail.height
                anchors.top: uploadThumbnail.bottom

                Rectangle {
                    id: uploadPreviewUserImage
                    width: parent.height * .7
                    height: width
                    radius: width * .5
                    color: "black"
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.margins: 5

                    Image {
                        anchors.fill: parent
                    }
                }

                Label {
                    id: uploadPreviewTitleLabel
                    text: "This is the title of the video"
                    font.pixelSize: 20
                    font.weight: 650
                    anchors.top: uploadPreviewUserImage.top
                    anchors.left: uploadPreviewUserImage.right


                }
            }
        }
    }
}
