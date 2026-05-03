import QtQuick 2.15
import QtQuick.Controls
import Uni 1.0
import Qt5Compat.GraphicalEffects

Item {    
    id: profileHeaderItem
    width: profileStackView.width
    height: profileStackView.height * 0.46

    property alias profileTabBar: profileTabBar

    Rectangle {
        id: profileToolbarItem
        width: profileStackView.width
        height: profileStackView.height * 0.14
        color: "darkgray"

        Row {
            width: parent.width * 0.3
            height: parent.height * 0.5
            anchors.right: parent.right
            anchors.top: parent.top
            spacing: 5

            RoundButton {
                width: parent.width * 0.45
                height: parent.width * 0.45
                radius: 100
                icon.source: "qrc:/images/Resources/bell-icon.svg"
                icon.width: parent.width
                icon.height: parent.height
                onClicked: profileStackView.push(activityView)

            }

            RoundButton {
                width: parent.width * 0.45
                height: parent.width * 0.45
                radius: 100
                icon.source: "qrc:/images/Resources/inbox-icon.svg"
                icon.width: parent.width
                icon.height: parent.height

                onClicked: profileStackView.push(inboxView)
            }
            
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
        clip: true


        Image {
            id: profileImage
            anchors.fill: parent
            source: UserManager.currentUser.profilePictureUrl
            visible: false
            fillMode: Image.PreserveAspectCrop

        }

        OpacityMask {
            anchors.fill: profileImage
            source: profileImage

            maskSource: Rectangle {
                width: profileImageItem.width
                height: profileImageItem.height
                radius: profileImageItem.width * .5
                visible: false
            }
        }
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

    Rectangle {
        width: parent.width - profileIDFrame.width
        height: profileIDFrame.height
        anchors.right: parent.right
        anchors.top: profileIDFrame.top

        Button {
            text: "Edit Profile"
            onClicked: profileEditorView.editorPopup.open()


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
        width: profileStackView.width
        height: profileStackView.height * 0.075
        anchors.bottom: profileHeaderItem.bottom

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
