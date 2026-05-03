import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import QtQml.Models
import Uni 1.0


Item {
    id: profileHeader
    property alias profileTabBar: profileTabBar
    width: profilePreview.width
    height: profilePreview.height * 0.45

    Rectangle {
        id: profileToolbarItem
        width: profilePreview.width
        height: profilePreview.height * 0.14
        color: "darkgray"


        Button {
            background: null
            icon.source: "qrc:/images/Resources/back-icon.svg"

            onClicked: stackView.pop()
        }
    }

    Rectangle {
        id: profileImageItem
        width: parent.width * 0.26
        height: parent.width * 0.26
        anchors {
            left: profileToolbarItem.left
            top: profileToolbarItem.bottom
            leftMargin: 7
            topMargin: -30
        }
        color: "black"
        radius: 100
        border.color: "white"
        border.width: 2
    }

    Column {
        id: profileIDFrame
        anchors.top: profileToolbarItem.bottom
        anchors.left: profileImageItem.right
        anchors.right: parent.right
        anchors.leftMargin: 10
        spacing: 2
        topPadding: 10

        Label {
            text: UserManager.currentUser !== null ? UserManager.currentUser.fullName : "Unknown"
            font.pixelSize: 20
            font.bold: true
        }

        Row {
            Label { text: "@" ; font.pixelSize: 18 }
            Label {
                text: UserManager.currentUser !== null
                      ? UserManager.currentUser.username
                      : "Unknown"
                font.pixelSize: 18
            }
        }
    }

    Column {
        id: userInfoFrame
        anchors.top: profileImageItem.bottom
        anchors.left: profileImageItem.left
        anchors.bottom: userMetricsFrame.top
        anchors.topMargin: 5
        anchors.leftMargin: 10
        spacing: 2

        Label {
            text: "Bio"
            font.pixelSize: 14
            font.weight: Font.Light
        }

        Label {
            text: "Location"
            font.pixelSize: 14
            font.weight: Font.Light

        }

        Label {
            text: "Date Joined: "
            font.pixelSize: 14
            font.weight: Font.Light

        }
    }

    Row {
        id: userMetricsFrame
        anchors.bottom: profileTabBarFrame.top
        anchors.left: profileImageItem.left
        anchors.leftMargin: 10
        width: parent.width
        height: parent.height*.075
        spacing: 15

        Row {
            anchors.verticalCenter: parent.verticalCenter
            spacing: 5
            Label {
                text: "Following"
                font.pixelSize: 16
                font.weight: Font.Medium
            }

            Label {
                text: "0"
                font.pixelSize: 16
                font.weight: Font.Medium
            }
        }


        Row {
            anchors.verticalCenter: parent.verticalCenter
            spacing: 5

            Label {
                text: "Followers"
                font.pixelSize: 16
                font.weight: Font.Medium
            }

            Label {
                text: "0"
                font.pixelSize: 16
                font.weight: Font.Medium

            }
        }
    }

    Rectangle {
        id: profileTabBarFrame
        width: profilePreview.width
        height: profilePreview.height * 0.075
        anchors.bottom: profileHeader.bottom

        TabBar {
            id: profileTabBar
            anchors.verticalCenter: parent.verticalCenter
            width: parent.width
            height: parent.height

            TabButton {
                text: "Activity"
                width: profileTabBar.width * 0.3
                height: profileTabBar.height
                font.pixelSize: 16

            }
            TabButton {
                text: "Media"
                width: profileTabBar.width * 0.3
                height: profileTabBar.height
                font.pixelSize: 16
            }
            TabButton {
                text: "Posts"
                width: profileTabBar.width * 0.3
                height: profileTabBar.height
                font.pixelSize: 16
            }
        }


    }
}
