import QtQuick 2.15
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import QtQuick.Layouts
import QtQuick.Controls.Material
import "../../../Shared"
import "../Delegate"
import Uni 1.0 as Uni

Rectangle {
    id: subtopicView
    width: learnStackView.width
    height: learnStackView.height

    property StackView stackView
    property string thumbnailUrl
    property string title

    Image {
        id: thumbnailImage
        width: parent.width
        height: parent.height* .46
        source: thumbnailUrl

        Rectangle {
            width: parent.width
            height: parent.height*.65
            anchors.bottom: parent.bottom
            gradient: Gradient {
                GradientStop { position: 0.0; color: "transparent" }
                GradientStop { position: 1.0; color: "black" }
            }
        }
    }

    ListView {
        id: subtopicListView
        anchors.fill: parent
        model: 10
        clip: true
        delegate: lessonViewDelegate


        header: Rectangle {
            width: parent.width
            height: thumbnailImage.height
            color: "transparent"


            Button {
                id: backButton
                icon.source: "qrc:/images/Resources/back-icon.svg"
                icon.width: parent.height*.1
                icon.height: parent.height*.1
                onClicked: learnStackView.pop()
                background: null
                anchors.top: parent.top
                anchors.left: parent.left
            }

            Text {
                text: title
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: backButton.verticalCenter
                anchors.topMargin: 15
                font.pixelSize: 22
                font.weight: 550
            }

            Text {
                anchors.top: parent.verticalCenter
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 20
                anchors.rightMargin: 20
                anchors.bottom: parent.bottom
                text: "This is the description of the course. This is the description of the course. This is the description of the course."
                font.pixelSize: 22
                wrapMode: Text.WordWrap
                color: "white"
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

    Component {
        id: lessonViewDelegate
        VideoDelegate {
            stackView: learnStackView

            onOpenMediaPlayerRequested: {
                learnStackView.push(
                            Qt.createComponent("qrc:/qt/qml/Uni/Shared/MediaPlayerView.qml"),
                            { stackView: learnStackView }
                            )
            }
        }
    }
}
