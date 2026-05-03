import QtQuick 2.15
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import "../../../Shared"
Column {
    width: learnStackView.width
    height: childrenRect.height
    spacing: 5

    property string subjectTitle

    Rectangle {
        id: topicLabelFrame
        height: topicLabel.implicitHeight + 10
        width: parent.width
        Label {
            id: topicLabel
            font.pixelSize: 20
            text: subjectTitle
            font.weight: 450
            leftPadding: 10
            anchors.verticalCenter: parent.verticalCenter

        }
    }

    ListView {
        id: subtopicListView
        width: learnStackView.width - 14
        height: learnStackView.height * 0.25
        spacing: 5
        anchors.horizontalCenter: parent.horizontalCenter
        orientation: ListView.Horizontal
        layoutDirection: Qt.LeftToRight
        clip: true

        model: ListModel {
            ListElement {
                title: "Geometry"
                thumbnailUrl: "qrc:/images/Resources/thumbnail.jpg"
            }

            ListElement {
                title: "Physics"
                thumbnailUrl: "qrc:/images/Resources/physics-thumbnail.jpg"
            }


        }


        delegate: Rectangle {

            width: subtopicListView.width * 0.62
            height: subtopicListView.height


            MouseArea {
                anchors.fill: parent
                onClicked: {

                    learnStackView.push(subtopicView, {
                                            "title": model.title,
                                            "thumbnailUrl": model.thumbnailUrl
                                        }
                                        )
                }
            }


            Image {
                id: subtopicThumbnail
                width: parent.width
                height: parent.height
                source: model.thumbnailUrl
                sourceSize: Qt.size(parent.width, parent.height)
                smooth: true
                visible: false

                Rectangle {
                    width: parent.width
                    height: parent.height*.3
                    anchors.bottom: parent.bottom
                    gradient: Gradient {
                        GradientStop { position: 0.0; color: "transparent" }
                        GradientStop { position: 1.0; color: "black" }
                    }
                }
            }

            // visible masked image
            OpacityMask {
                anchors.fill: subtopicThumbnail
                source: subtopicThumbnail
                maskSource: Rectangle {
                    width: subtopicThumbnail.width
                    height: subtopicThumbnail.height
                    radius: 10
                    visible: false
                }
            }

            Label {
                anchors.bottom: parent.bottom
                text: model.title
                color: "white"
                font.pixelSize: 16
                anchors.left: parent.left
                anchors.margins: 5

            }
        }

        Component.onCompleted: Qt.callLater(function() {
            subtopicListView.currentIndex = 0
            subtopicListView.positionViewAtIndex(0, ListView.Beginning)
        })
    }

    ListView {
        id: featuredListView
        width: learnStackView.width - 14
        height: learnStackView.height*.2
        spacing: 5
        model: 3
        orientation: ListView.Horizontal
        layoutDirection: Qt.LeftToRight
        clip: true
        anchors.horizontalCenter: parent.horizontalCenter
        Component.onCompleted: Qt.callLater(function() {
            featuredListView.currentIndex = 0
            featuredListView.positionViewAtIndex(0, ListView.Beginning)
        })
        delegate: Rectangle {
            width: featuredListView.width * .95
            height: featuredListView.height
            color: "gray"
            radius: 5
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    learnStackView.push(mediaPlayerView)
                }
            }

            Rectangle {
                id: featuredUploadCreatorImage
                width: parent.height * .40
                height: parent.height * .4
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.margins: 5
                radius: width * .5
                color: "white"
            }

            Column {
                anchors.left: featuredUploadCreatorImage.right
                anchors.verticalCenter: featuredUploadCreatorImage.verticalCenter
                spacing: 5
                anchors.leftMargin: 5
                Label {
                    text: "Username"
                    color: "white"
                }

                Label {
                    text: "This is the title of the upload"
                    color: "white"
                }
            }
        }
    }

    GridView {
        id: careerPathGrid
        width: parent.width - 10
        height: learnStackView.height*.2
        cellWidth: careerPathGrid.width*.41
        cellHeight: careerPathGrid.height*.5
        flow: GridView.TopToBottom
        model: 8
        anchors.horizontalCenter: parent.horizontalCenter

        delegate: Rectangle {
            radius: 10
            width: careerPathGrid.cellWidth*.97
            height: careerPathGrid.cellHeight*.95
            color: "gray"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    learnStackView.push(careerPathView)
                }
            }

            Column {
                width: parent.width
                height: careerPathLabel.height + salaryRangeLabel.height
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.left: parent.left
                spacing: 5

                Text {
                    id: careerPathLabel
                    text: "Career Path"
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    color: "white"
                }

                Text {
                    id: salaryRangeLabel
                    text: "Salary Range:"
                    font.italic: true
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    color: "white"

                }
            }
        }
    }

    Component {
        id: mediaPlayerView
        MediaPlayerView {
            stackView: learnStackView
        }
    }
}
