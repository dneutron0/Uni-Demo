import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root
    property int selectedTab: 0
    property bool composeOpen: false

    onSelectedTabChanged: tabBar.currentIndex = selectedTab < 2 ? selectedTab : selectedTab + 1

    StackLayout {
        id: contentStack
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            bottom: tabBar.top
        }
        currentIndex: root.selectedTab

        FeedView {}
        LearnView {}
        DiscoverView {}
        ProfileView {}
    }

    Rectangle {
        anchors.fill: parent
        color: "white"
        visible: root.composeOpen
        z: 2

        ComposeView {
            anchors.fill: parent
            onCloseRequested: root.composeOpen = false
        }
    }

    TabBar {
        id: tabBar
        width: parent.width
        height: 68
        anchors.bottom: parent.bottom
        currentIndex: 0

        TabButton {
            text: "Media"
            icon.source: "qrc:/assets/media-icon.svg"
            onClicked: root.selectedTab = 0
        }

        TabButton {
            text: "Learn"
            icon.source: "qrc:/assets/education-icon.svg"
            onClicked: root.selectedTab = 1
        }

        TabButton {
            text: ""
            icon.source: "qrc:/assets/compose-icon.svg"
            onClicked: {
                root.composeOpen = true
                tabBar.currentIndex = root.selectedTab < 2 ? root.selectedTab : root.selectedTab + 1
            }
        }

        TabButton {
            text: "Discover"
            icon.source: "qrc:/assets/explore-icon.svg"
            onClicked: root.selectedTab = 2
        }

        TabButton {
            text: "Profile"
            icon.source: "qrc:/assets/profile-icon.svg"
            onClicked: root.selectedTab = 3
        }
    }
}
