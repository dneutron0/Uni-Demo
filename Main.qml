import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Window
import QtQuick.Controls.Fusion
import QtQuick.Controls.Material
import "Auth"
import "Core"
import "Core/Media"
import "Core/Discover"
import "Core/Profile"
import "Core/Profile/Subview"
import "Core/Learn"
import "Core/Compose"
import "Shared"

// MAIN WINDOW

ApplicationWindow {
    visible: true
    id: mainWindow
    bottomPadding: 0
    topPadding: 0

    property bool isLoggedIn: UserManager.currentUser !== null
    property bool loginChecked: UserManager.loginCheckComplete
    property bool chatViewVisible: false
    property bool composeViewVisible: false
    property bool creatorDashboardViewVisible: false

    property int selectedCoreTab: 0
    property int previousCoreTab: 0


    // SPLASH SCREEN (shown first)
    Rectangle {
        id: splashScreen
        anchors.fill: parent
        color: "black"
        z: 9999  // ensures it’s above everything

        visible: !loginChecked  // <--- THIS decides how long it shows

        Text {
            text: "UNI"
            anchors.centerIn: parent
            font.pixelSize: 40
            color: "white"
        }
    }

    // AUTH LAYOUT
    StackLayout {
        id: authLayout
        anchors {
            fill: parent

        }

        visible: loginChecked && !isLoggedIn

        LandingView {}

        RegisterView {}

        LoginView {}
    }

    // CONTENT LAYOUT
    Item {
        id: contentWindow
        anchors.fill: parent

        visible: loginChecked && isLoggedIn
        StackLayout {
            id: mainLayout
            currentIndex: selectedCoreTab
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
                bottom: coreTabbar.top
            }



            MediaStackView {}

            LearnStackView {}

            DiscoverStackView {}

            ProfileStackView {}

        }

        //TAB BAR

        TabBar {
            id: coreTabbar
            width: parent.width
            height: parent.height*.075
            Material.theme: Material.System
            anchors.bottom: parent.bottom

            TabButton {
                width: coreTabbar.width*.198
                height: coreTabbar.height
                id: mediaTab
                icon.source: "qrc:/images/Resources/media-icon.svg"
                icon.width: coreTabbar.height*.50
                icon.height: coreTabbar.height*.50
                anchors.verticalCenter: parent.verticalCenter
                background: null
                onClicked: selectedCoreTab = 0


            }

            TabButton {
                width: coreTabbar.width*.198
                height: coreTabbar.height
                id: learnTab
                icon.source: "qrc:/images/Resources/education-icon.svg"
                icon.width: coreTabbar.height*.50
                icon.height: coreTabbar.height*.50
                anchors.verticalCenter: parent.verticalCenter
                background: null
                onClicked: selectedCoreTab = 1

            }

            TabButton {
                width: coreTabbar.width*.198
                height: coreTabbar.height
                id: composeTab
                icon.source: "qrc:/images/Resources/compose-icon.svg"
                icon.width: coreTabbar.height*.50
                icon.height: coreTabbar.height*.50
                anchors.verticalCenter: parent.verticalCenter
                background: null
                onClicked: {
                    previousCoreTab = selectedCoreTab
                    composeViewVisible = true
                }
            }

            TabButton {
                width: coreTabbar.width*.198
                height: coreTabbar.height
                id: discoverTab
                icon.source: "qrc:/images/Resources/explore-icon.svg"
                icon.width: coreTabbar.height*.50
                icon.height: coreTabbar.height*.50
                anchors.verticalCenter: parent.verticalCenter
                background: null
                onClicked: selectedCoreTab = 2

            }

            TabButton {
                width: coreTabbar.width*.198
                height: coreTabbar.height
                id: profileTab
                icon.source: "qrc:/images/Resources/profile-icon.svg"
                icon.width: coreTabbar.height*.50
                icon.height: coreTabbar.height*.50
                anchors.verticalCenter: parent.verticalCenter
                background: null
                onClicked: selectedCoreTab = 3


            }
        }
    }

    Rectangle  {
        anchors.fill: parent
        color: "white"
        visible: chatViewVisible
        z: 1

        ChatView  {
            anchors.fill: parent
        }

    }

    Rectangle  {
        id: composeRoot
        anchors.fill: parent
        color: "white"
        visible: composeViewVisible
        z: 1

        RoundButton {
            radius: 100
            width: parent.width*.155
            topPadding: 5
            height: width
            icon.width: width
            icon.height: height
            z: 1
            icon.source: "qrc:/images/Resources/cancel-icon.svg"
            background: null
            onClicked: {
                selectedCoreTab = previousCoreTab
                composeViewVisible = false
                coreTabbar.setCurrentIndex(selectedCoreTab >= 2 ? selectedCoreTab + 1 : selectedCoreTab)
            }
        }

        ComposeStackView  {
            anchors.fill: parent
            composeActive: composeViewVisible
        }

    }


    Rectangle  {
        anchors.fill: parent
        color: "white"
        visible: creatorDashboardViewVisible
        z: 1

        CreatorDashboardStackView  {
            anchors.fill: parent
        }

    }

}
