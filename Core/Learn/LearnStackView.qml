import QtQuick 2.15
import QtQuick.Controls
import QtQml.Models
import "Subview"
import "Subview/Category"
import "Delegate"
import "../../Shared"


StackView {
    id: learnStackView
    width: parent.width
    height: parent.height
    initialItem: learnView


    Drawer {
        id: educationDrawer
        width: parent.width*.8
        height: parent.height
        edge: Qt.LeftEdge
        interactive: educationDrawer.opened === true

        ListView {
            id: mediaMenuListView
            width: parent.width
            height: parent.height
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            clip: true
            header: Button {
                id: creatorDashboardButton
                width: mediaMenuListView.width * .7
                height: mediaMenuListView.height * .1
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Educator Dashboard"
                onClicked: {
                    creatorDashboardViewVisible = true
                    educationDrawer.close()
                }
            }
            delegate: Item {
                width: mediaMenuListView.width
                height: mediaMenuListView.height*.14

                Button {
                    id: categoryButton
                    width: parent.width
                    height: parent.height
                    text: model.title
                    flat: true
                    icon.source: model.source
                    icon.width: parent.height*.2
                    icon.height: parent.height*.2
                    leftInset: -parent.height*.5
                    rightInset: -parent.height*.5
                    onClicked: {
                        learnStackView.push(model.subview)
                        educationDrawer.close()
                    }
                }
            }

            model: ListModel {

                ListElement {
                    title: "Live"
                    source: "qrc:/images/Resources/live-icon.svg"
                    subview: "Subview/Category/LiveCategoryView.qml"
                }

                ListElement {
                    title: "Trending"
                    source: "qrc:/images/Resources/trending-icon.svg"
                }

                ListElement {
                    title: "Music"
                    source: "qrc:/images/Resources/music-icon.svg"
                }
            }
        }
    }


    Component {
        id: learnView

        Item {
            width: parent.width
            height: parent.height

            Rectangle {
                id: learnToolBar
                width: parent.width
                height: parent.height*.077
                anchors.top: parent.top
                color: "transparent"
                clip: true
                RoundButton {
                    id: mediaMenuButton
                    width: parent.height*.9
                    height: parent.height*.9
                    icon.source: "qrc:/images/Resources/menu-icon.svg"
                    icon.width: parent.width*.4
                    icon.height: parent.height*.4
                    radius: mediaMenuButton.width*.5
                    anchors.left: parent.left
                    anchors.leftMargin: 5
                    onClicked: educationDrawer.open()
                    background: null

                }

                Button {
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.left: mediaMenuButton.right
                    anchors.right: parent.right
                    anchors.topMargin: 10
                    anchors.bottomMargin: 10
                    anchors.rightMargin: 10
                    onClicked: learnStackView.push(learnSearchView)
                    background: Rectangle {
                        anchors.fill: parent
                        border.color: "black"
                        border.width: .5
                        radius: 25
                    }

                    Label {
                        id: searchLabel
                        text: "Search"
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter

                    }

                    Image {
                        id: searchIcon
                        source: "qrc:/images/Resources/search-icon.svg"
                        width: parent.height*.6
                        height: parent.height*.6
                        anchors.right: searchLabel.left
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.margins: 5

                    }
                }
            }


            ListView {
                id: topicListView
                width: parent.width
                height: parent.height - learnToolBar.height
                anchors.top: learnToolBar.bottom
                orientation: ListView.Vertical

                clip: true
                // UNIVERSAL DELEGATE USING A LOADER
                delegate: SubjectDelegate { subjectTitle: model.title }

                header: HistoryDelegate {}
                footer: ForYouDelegate {}

                // COMBINED MODEL
                model: ListModel {
                    ListElement { title: "Math";    thumbnail: "qrc:/images/Resources/image-icon.svg" }
                    ListElement { title: "Science";    thumbnail: "qrc:/images/Resources/image-icon.svg" }
                    ListElement { title: "Language Arts";    thumbnail: "qrc:/images/Resources/image-icon.svg" }
                    ListElement { title: "Social Studies";    thumbnail: "qrc:/images/Resources/image-icon.svg" }
                    ListElement { title: "Religion";    thumbnail: "qrc:/images/Resources/image-icon.svg" }

                }
            }


        }


    }

    Component {
        id: subtopicView
        SubtopicView {}
    }

    Component {
        id: learnSearchView
        LearnSearchView {}
    }

    Component {
        id: careerPathView
        CareerPathView {

        }
    }



    Component {
        id: mediaPlayerView
        MediaPlayerView { }
    }
}



