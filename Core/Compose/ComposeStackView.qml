import QtQuick 2.15
import QtQuick.Controls
import QtMultimedia
import QtCore
import QtQuick.Layouts
import "Subview"

Rectangle {
    id: composeView
    width: Screen.width
    height: Screen.height
    color: "transparent"

    property int selectedTab: 0
    property bool cameraTabActive: selectedTab === 0 || selectedTab === 2
    property bool composeActive: false

    StackLayout {
        id: composeStackView
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: composeTabBarFrame.top
        currentIndex: selectedTab

        ComposeStoryView { }  // index 0
        ComposePostView { }   // index 1
        ComposeLiveView { }   // index 2
        ComposeCourseView { } // index 3
    }

    Rectangle {
        id: composeTabBarFrame
        width: parent.width
        height: Screen.pixelDensity * 10
        color: "black"
        anchors.bottom: parent.bottom

        Flickable {
            id: composeTabListView
            width: parent.width * .8
            height: parent.height
            anchors.horizontalCenter: parent.horizontalCenter
            property real sideMargin: width * .5 - tabRow.tabWidth * .5
            contentWidth: tabRow.width + sideMargin * 2
            clip: false

            function updateSelectedTab() {
                selectedTab = Math.max(0, Math.min(3, Math.round(contentX / tabRow.tabWidth)))
            }

            onContentXChanged: updateSelectedTab()

            Item {
                width: tabRow.width + composeTabListView.sideMargin * 2
                height: parent.height

                Rectangle {
                    id: tabBarFrame
                    width: tabRow.width
                    height: parent.height*.825
                    radius: height * .5
                    color: "gray"
                    x: composeTabListView.sideMargin
                    anchors.verticalCenter: parent.verticalCenter
                    opacity: .5
                }

                Row {
                    id: tabRow
                    x: composeTabListView.sideMargin
                    property real tabWidth: composeTabListView.width * .255
                    height: tabBarFrame.height
                    anchors.verticalCenter: parent.verticalCenter

                    Repeater {
                        model: ["Upload", "Post", "Stream", "Course"]
                        delegate: Item {
                            width: tabRow.tabWidth
                            height: tabRow.height
                            Text {
                                anchors.centerIn: parent
                                text: modelData
                                font.weight: Font.Bold
                                font.pixelSize: 16
                                color: selectedTab === index ? "white" : "lightgray"
                            }
                        }
                    }
                }
            }
        }
    }

    // Shared CameraManager instance
    CameraManager {
        id: cameraManager
    }



    Component.onCompleted: {
        if (!utilityManager.isCameraPermissionGranted()) {
            utilityManager.cameraPermissionGranted.connect(() => {
                                                               console.log("Permission granted");
                                                           });
            utilityManager.requestCameraPermission();
        } else {
            console.log("Permission already granted");
        }
    }

    function updateCameraActive() {
        cameraManager.camera.active = composeActive && cameraTabActive
    }

    onSelectedTabChanged: {
        cameraManager.camera.active = false
        Qt.callLater(updateCameraActive)
    }
    onComposeActiveChanged: updateCameraActive()
    onVisibleChanged: updateCameraActive()
}
