import QtQuick 2.15
import QtQuick.Controls
import Qt5Compat.GraphicalEffects

Item {
  property StackView stackView: null

  id: photoThreadView
  width: mainLayout.width
  height: mainLayout.height

  Rectangle {
    id: photoThreadViewToolbar
    width: parent.width
    height: parent.height * .08

    RoundButton {
      width: parent.height
      height: width
      radius: 100
      onClicked: {
        stackView.pop()
      }
      anchors.left: parent.left
      anchors.top: parent.top
      z: 1
    }

  }

  ListView {
    id: photoThreadListView
    width: parent.width
    anchors.top: photoThreadViewToolbar.bottom
    anchors.bottom: parent.bottom
    focus: true
    clip: true
    spacing: 1
    model: 3
    header: Column {
      width: mainLayout.width


      Rectangle {
        id: uploadImageFrame
        width: parent.width*.95
        height: mainLayout.height * .65
        radius: 10
        anchors.horizontalCenter: parent.horizontalCenter


        Image {
          id: uploadImage
          width: parent.width
          height: parent.height * .95
          source: "qrc:/images/Resources/test-image.jpg"
          visible: false
          anchors.centerIn: parent

        }

        Rectangle {
          id: mask
          anchors.fill: uploadImage
          radius: 10
          visible: false

        }


        OpacityMask {
          anchors.fill: uploadImage
          source: uploadImage
          maskSource: mask

        }


      }

      Rectangle {
        id: userInfoFrame
        width: parent.width
        height: mainLayout.height * .1

        Image {
          width: parent.height*.5
          height: parent.height*.5
          source: "qrc:/images/Resources/ellipsis-icon.svg"
          anchors.top: parent.top
          anchors.right: parent.right
          anchors.rightMargin: 7

        }

        Rectangle {
          id: uploadCreatorImage
          width: parent.height*.9
          height: parent.height*.9
          radius: 100
          anchors.top: parent.top
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

        Column {
          width: parent.width
          anchors.verticalCenter: uploadCreatorImage.verticalCenter
          anchors.left: uploadCreatorImage.right
          anchors.leftMargin: 5
          spacing: 15

          Label {
            id: uploadTitleLabel
            text: "This is the title of the upload"
            font.pixelSize: 18
            font.weight: 500
          }

          Row {
            anchors.leftMargin: 5
            spacing: 5

            Label {
              text: "@Username"
              font.pixelSize: 16

            }

            Label {
              text: "|"
              font.pixelSize: 16

            }


            Label {
              text: "22h"
              font.pixelSize: 16

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
            text: "0"
            width: parent.width*.2
            height: parent.height
            icon.width: width * .1
            icon.height: height * .8
            background: null
            contentItem:  Row {
              spacing: 5
              anchors.fill: parent
              Image {
                id: likeButtonIcon
                width: parent.width * .5
                height: parent.height*.7
                source:  "qrc:/images/Resources/heart-icon.svg"
                anchors.verticalCenter: parent.verticalCenter
              }

              Text {
                text: "0"
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
            icon.width: width * .1
            icon.height: height * .85
            background: null
            contentItem:  Row {
              spacing: 5
              anchors.fill: parent
              Image {
                id: commentButtonIcon
                width: parent.width * .5
                height: parent.height*.7
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
            icon.width: width * .1
            icon.height: height * .85
            background: null
            contentItem:  Row {
              spacing: 5
              anchors.fill: parent
              Image {
                id: repostButtonIcon
                width: parent.width * .5
                height: parent.height*.7
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
            icon.width: width * .1
            icon.height: height * .85
            background: null
            contentItem:  Row {
              spacing: 5
              anchors.fill: parent
              Image {
                id: shareButtonIcon
                width: parent.width * .5
                height: parent.height*.7
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
            icon.width: width * .1
            icon.height: height * .85
            background: null
            contentItem:  Row {
              spacing: 5
              anchors.fill: parent
              Image {
                id: bookmarkButtonIcon
                width: parent.width * .5
                height: parent.height*.7
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

    }
    delegate: Column {
      id: uploadThreadDelegate
      width: photoThreadListView.width
      height: mainLayout.height * .3
      Rectangle {
        color: "dimgray"
        width: photoThreadListView.width
        height: mainLayout.height * .3
      }
    }

  }



}

