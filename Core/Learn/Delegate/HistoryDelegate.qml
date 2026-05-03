import QtQuick 2.15
import QtQuick.Controls
import "../../../Shared"

Rectangle {
  width: learnStackView.width
  height: learnStackView.height * .2

  Label {
    id: titleLabel
    text: "History"
    visible: false
    font.pixelSize: 18
    anchors.top: historyListView.top
    anchors.left: historyListView.left
    anchors.topMargin: 12
    anchors.leftMargin: 10
    color: "white"
    z: 1
    opacity: visible ? 1 : 0
    Behavior on opacity { NumberAnimation { duration: 500 } }

  }

  ListView {
    id: historyListView
    width: parent.width
    height: parent.height
    orientation: ListView.Horizontal
    model: 10
    header: Item { width: 5 }  // left padding
    footer: Item { width: 5 }  // right padding
    onMovementStarted: {
      titleLabel.visible = true
    }

    onMovementEnded: {
      titleLabel.visible = false
    }

    delegate: Rectangle {
      width: historyListView.width*.4
      height: historyListView.height

      MouseArea {
        anchors.fill: parent
        onClicked: {
          learnStackView.push(mediaPlayerView)
        }
      }

      Rectangle {
        id: mediaView
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.horizontalCenter: parent.horizontalCenter
        color: "black"
        width: parent.width*.99
        height: parent.height*.6
        radius: 10

      }

      Label {
        width: parent.width*.99
        anchors.horizontalCenter: parent.horizontalCenter
        height: parent.height - mediaView.height
        wrapMode: Text.WordWrap
        anchors.top: mediaView.bottom
        anchors.bottom: parent.bottom
        anchors.topMargin: 5
        elide: Text.ElideRight
        leftPadding: 5
        rightPadding: 5
        font.pixelSize: 15
        text: "This is the title of the post. This is the title of the post."
      }

    }
    spacing: 3

  }


  Component {
    id: mediaPlayerView
    MediaPlayerView {
      stackView: learnStackView
    }
  }

}

