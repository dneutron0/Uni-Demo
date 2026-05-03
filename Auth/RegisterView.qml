import QtQuick 2.15
import QtQuick.Controls
import Uni 1.0
// REGISTER VIEW

Rectangle {
    id: registerView
    width: parent.width
    height: parent.height

    Button {
        width: parent.width*.3
        height: parent.height*.08
        font.pointSize: 18
        text: "Login"
        background: Rectangle {

        }

        anchors.left: parent.left
        anchors.top: parent.top
        onClicked: {
            authLayout.currentIndex = 2
        }
    }

    Rectangle {
        id: appIconPlaceholder
        width: parent.width*.3
        height: parent.width*.3
        radius: 100
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: parent.height*.15
        color: "black"
    }

    Rectangle {
        width: parent.width*.85
        height: parent.height*.55
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: appIconPlaceholder.bottom
        anchors.topMargin: parent.height*.1
        border.color: "black"
        radius: 10

        Column {
            id: inputColumn
            spacing: 10
            anchors.top: parent.top
            anchors.topMargin: 10
            width: parent.width

            TextField {
                id: fullNameField
                placeholderText: "Full name..."
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width*.9
                height: registerView.height*.07

            }

            TextField {
                id: usernameField
                placeholderText: "Username..."
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width*.9
                height: registerView.height*.07

            }

            TextField {
                id: emailField
                placeholderText: "Email address..."
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width*.9
                height: registerView.height*.07

            }

            TextField {
                id: passwordField
                placeholderText: "Password..."
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width*.9
                height: registerView.height*.07

            }
        }

        Button {
            width: parent.width*.7
            height: registerView.height*.08
            text: "Create account"
            font.pointSize: 16
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                AuthManager.registerNewUser(emailField.text, passwordField.text, fullNameField.text, usernameField.text)

            }
        }

        Component.onCompleted: {
            AuthManager.registrationSucceeded.connect(() => {
                console.log("Registration successful — logging in")
                isLoggedIn = true
            })

            AuthManager.registrationFailed.connect((reason) => {
                console.log("Registration failed:", reason)
                // Optionally show error to user via dialog/toast/etc.
            })
        }

    }
}
