import QtQuick 2.15
import QtQuick.Controls

Rectangle {
    width: parent.width
    height: parent.height


    Rectangle {
        id: appIconPlaceholder
        width: parent.width*.35
        height: parent.width*.35
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: appIconPlaceholder.height*2
        radius: 100


        Image {
            anchors.fill: parent
            source: "qrc:/images/Resources/answer.svg"
        }
    }

    Rectangle {
        width: parent.width
        height: parent.height*.1
        anchors.bottom: parent.bottom

        Button {
            id: signUpButton
            text: "Sign Up"
            anchors.right: parent.horizontalCenter
            width: parent.width*.45
            height: parent.height*.9
            spacing: 10
            background: Rectangle {
                radius: 0
                border.color: "black"
            }
            onClicked: {
                authLayout.currentIndex = 1
            }
        }

        Button {
            text: "Login"
            anchors.left: signUpButton.right
            anchors.leftMargin: 10
            width: parent.width*.45
            height: parent.height*.9
            spacing: 10
            background: Rectangle {
                radius: 0
                border.color: "black"
            }
            onClicked: {
                authLayout.currentIndex = 2
            }
        }
    }




}
