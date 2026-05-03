import QtQuick 2.15
import QtQuick.Controls
import "Subview"


StackView {
    id: discoverStackView
    width: parent.width
    height: parent.height
    initialItem: discoverComponent

    Component {
        id: discoverComponent

        Item {
            width: discoverStackView.width
            height: discoverStackView.height
            // May replace with SwipeView to retain state during transition

            Rectangle {
                // TO DO: Set Toolbar visibility: Upward Scrolling Status
                // visible: false
                id: discoverSearchBar
                width: parent.width
                height: parent.height*.077
                anchors.top: parent.top

                TabBar {
                    id: discoverTabBar
                    width: parent.width*.4
                    height: parent.height
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter

                    TabButton {
                        text: "Media"
                        font.pixelSize: 16
                        font.family: "Roboto"
                        background: null
                        anchors.verticalCenter: parent.verticalCenter
                    }

                    TabButton {
                        text: "Learn"
                        font.pixelSize: 16
                        font.family: "Roboto"
                        background: null
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }

                RoundButton {
                    id: searchButton
                    width: parent.height
                    height: parent.height
                    radius: searchButton.width*.5
                    anchors {
                        verticalCenter: parent.verticalCenter
                        right: parent.right
                        rightMargin: 5
                    }

                    Image {
                        anchors.centerIn: parent
                        fillMode: Image.PreserveAspectFit
                        source: "qrc:/images/Resources/search-icon.svg"
                        width: parent.width*.45
                        height: parent.height*.45
                    }
                }
            }

            Loader {
                id: discoverLoader
                width: parent.width
                height: parent.height - discoverSearchBar.height
                anchors.top: discoverSearchBar.bottom
                sourceComponent: discoverTabBar.currentIndex == 0 ? discoverMediaView: discoverLearnView

            }
        }
    }

    Component {
        id: discoverMediaView
        DiscoverMediaView {}
    }

    Component {
        id: discoverLearnView
        DiscoverLearnView {}
    }

    Component {
        id: categoryContentView

        CategoryContentView {

        }
    }
}

