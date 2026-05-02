import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root
    property int selectedTab: 0

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
        ComposeView {}
        ProfileView {}
    }

    TabBar {
        id: tabBar
        width: parent.width
        height: 68
        anchors.bottom: parent.bottom
        currentIndex: root.selectedTab
        onCurrentIndexChanged: root.selectedTab = currentIndex

        TabButton {
            text: "Feed"
            icon.source: "qrc:/assets/media-icon.svg"
        }

        TabButton {
            text: "Compose"
            icon.source: "qrc:/assets/compose-icon.svg"
        }

        TabButton {
            text: "Profile"
            icon.source: "qrc:/assets/profile-icon.svg"
        }
    }
}
