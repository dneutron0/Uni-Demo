import QtQuick 6.9
import QtQuick.Controls 6.9
import QtQuick.Window 6.9

Item {
   id: chatView
   anchors.fill: parent

   Rectangle {
      id: categoryContentViewToolbar
      width: parent.width
      height: parent.height*.075
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
         onClicked: chatViewVisible = false
         background: null

      }
   }

   ListView {
      id: chatListView
      width: parent.width
      anchors.top: categoryContentViewToolbar.bottom
      anchors.bottom: parent.bottom
      bottomMargin: textAreaFrame.height + textAreaFrame.anchors.bottomMargin + 8

      spacing: 10
      clip: true
      header: Rectangle {
         width: chatView.width
         height: chatView.height*.25
         color: "gray"
      }

      Component.onCompleted: positionViewAtEnd()


      model:  ListModel {
         ListElement {
            sender: "You"; message: "Hey! How's the chat view shit coming along? Any issues thus far?"
         }

         ListElement {
            sender: "Friend"; message: "Hey, what's up? This is a much longer message that should wrap across multiple lines so we can see the height adjust dynamically."
         }

         ListElement {
            sender: "You"; message: "Hey! How's the chat view shit coming along? Any issues thus far?"
         }

         ListElement {
            sender: "Friend"; message: "Hey, what's up? This is a much longer message that should wrap across multiple lines so we can see the height adjust dynamically."
         }

         ListElement {
            sender: "You"; message: "Hey! How's the chat view shit coming along? Any issues thus far?"
         }

         ListElement {
            sender: "Friend"; message: "Hey, what's up? This is a much longer message that should wrap across multiple lines so we can see the height adjust dynamically."
         }
      }

      delegate: Item {
         width: chatListView.width
         height: bubble.height + 10

         Rectangle {
            id: userIcon
            radius: 100
            width: parent.width * .1
            height: width
            color: "black"
            anchors.left: parent.left
            anchors.leftMargin: 12
            visible: sender === "Friend"
            anchors.bottom: bubble.bottom
         }

         Rectangle {
            id: bubble
            width: Math.min(messageText.implicitWidth + 25, chatListView.width * 0.75)
            height: messageText.paintedHeight + 20
            color: sender === "You" ? "blue" : "gray"
            radius: 20
            anchors.right: sender === "You" ? parent.right : undefined
            anchors.left: sender === "Friend" ? userIcon.right : undefined
            anchors.margins: 5

            Text {
               id: messageText
               text: model.message
               font.pixelSize: 18
               wrapMode: Text.WordWrap
               width: parent.width - 20
               anchors.centerIn: parent
            }
         }
      }

      Rectangle {
         id: textAreaFrame
         width: chatView.width * .965
         height: Math.min(
                    chatView.height * 0.22,
                    Math.max(chatView.height * 0.055 + 10, chatTextArea.contentHeight + 16)
                 )
         radius: 30
         antialiasing: true

         anchors.horizontalCenter: parent.horizontalCenter
         border.color: "black"
         border.width: 1
         anchors.bottom: parent.bottom
         anchors.bottomMargin: Qt.inputMethod.visible
                               ? Math.max(0, Qt.inputMethod.keyboardRectangle.height / Screen.devicePixelRatio - parent.SafeArea.margins.bottom) + 2
                               : 2
         Behavior on anchors.bottomMargin { NumberAnimation { duration: 160 } }

         TextArea {
            id: chatTextArea
            anchors.fill: parent
            anchors.leftMargin: 16
            anchors.right: sendButton.left
            anchors.rightMargin: sendButton.width + 8
            anchors.topMargin: 8
            anchors.bottomMargin: 8

            background: null
            wrapMode: TextArea.WrapAnywhere
            verticalAlignment: TextEdit.AlignVCenter
            topPadding: 0
            bottomPadding: 0

            font.pixelSize: 17
            color: "black"

         }

         RoundButton {
            id: sendButton
            width: chatView.height * .065
            height: width
            radius: 100

            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.margins: 1
            antialiasing: true

            icon.source: "qrc:/images/Resources/paper-plane-icon.svg"
         }



      }


   }

}






