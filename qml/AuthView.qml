import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import UniDemo 1.0

Item {
    id: root

    Rectangle {
        anchors.fill: parent
        color: "#f7f8fb"
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 24
        spacing: 18

        Item {
            Layout.fillWidth: true
            Layout.preferredHeight: 92

            Column {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter
                spacing: 6

                Label {
                    text: "Uni"
                    font.pixelSize: 36
                    font.weight: Font.DemiBold
                    color: "#111827"
                }

                Label {
                    text: "A mock campus media experience built with Qt, QML, and C++."
                    width: parent.width
                    wrapMode: Text.WordWrap
                    color: "#4b5563"
                    font.pixelSize: 15
                }
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 312
            radius: 8
            color: "white"
            border.color: "#e5e7eb"

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 18
                spacing: 12

                Label {
                    text: "Demo sign in"
                    font.pixelSize: 20
                    font.weight: Font.DemiBold
                    color: "#111827"
                }

                TextField {
                    id: emailField
                    Layout.fillWidth: true
                    placeholderText: "Email"
                    text: "demo@uni.app"
                }

                TextField {
                    id: passwordField
                    Layout.fillWidth: true
                    placeholderText: "Password"
                    echoMode: TextInput.Password
                    text: "demo"
                }

                Label {
                    id: errorLabel
                    Layout.fillWidth: true
                    visible: text.length > 0
                    wrapMode: Text.WordWrap
                    color: "#b91c1c"
                    font.pixelSize: 13
                }

                Button {
                    Layout.fillWidth: true
                    text: "Sign in"
                    onClicked: AuthService.signIn(emailField.text, passwordField.text)
                }

                Button {
                    Layout.fillWidth: true
                    text: "Continue as demo user"
                    flat: true
                    onClicked: AuthService.continueAsDemoUser()
                }
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 84
            radius: 8
            color: "#eef2ff"

            Label {
                anchors.fill: parent
                anchors.margins: 14
                text: "Firebase and private backend calls were replaced with local mock services for this portfolio build."
                wrapMode: Text.WordWrap
                verticalAlignment: Text.AlignVCenter
                color: "#3730a3"
                font.pixelSize: 14
            }
        }

        Item {
            Layout.fillHeight: true
        }
    }

    Connections {
        target: AuthService

        function onLoginFailed(message) {
            errorLabel.text = message
        }

        function onLoginSucceeded() {
            errorLabel.text = ""
        }
    }
}
