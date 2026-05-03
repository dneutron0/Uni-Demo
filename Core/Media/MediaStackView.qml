import QtQuick 2.15
import QtQuick.Controls
import QtQml.Models
import "Subview"
import "Subview/Category"
import "../../Shared"
import Uni 1.0 as Uni


StackView {
    property StackView stackView: mediaStackView
    id: mediaStackView
    width: parent.width
    height: parent.height
    initialItem: mediaView

    Drawer {
        id: mediaDrawer
        width: parent.width*.8
        height: parent.height
        edge: Qt.LeftEdge
        interactive: mediaDrawer.opened === true

        ListView {
            id: mediaMenuListView
            width: parent.width
            height: parent.height
            anchors.top: parent.top
            clip: true
            header: Button {
                id: creatorDashboardButton
                width: mediaMenuListView.width * .7
                height: mediaMenuListView.height * .1
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Creator Dashboard"
                onClicked: {
                    creatorDashboardViewVisible = true
                    mediaDrawer.close()
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
                        mediaStackView.push(model.subview, { stackView } )
                        mediaDrawer.close()
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
                    subview: "Subview/Category/TrendingCategoryView.qml"
                }

                ListElement {
                    title: "Music"
                    source: "qrc:/images/Resources/music-icon.svg"
                    subview: "Subview/Category/MusicCategoryView.qml"

                }

                ListElement {
                    title: "Movies/TV"
                    source: "qrc:/images/Resources/tv-icon.svg"
                }

                ListElement {
                    title: "Gaming"
                    source: "qrc:/images/Resources/gaming-icon.svg"
                }

                ListElement {
                    title: "News"
                    source: "qrc:/images/Resources/news-icon.svg"
                }

                ListElement {
                    title: "Sports"
                    source: "qrc:/images/Resources/trophy-icon.svg"
                }

                ListElement {
                    title: "Podcasts"
                    source: "qrc:/images/Resources/podcast-icon.svg"
                }
            }
        }
    }

    Component {
        id: mediaView
        Item {
            width: parent.width
            height: parent.height


            Rectangle {
                id: mediaToolBar
                width: parent.width
                height: parent.height*.077
                anchors.top: parent.top
                color: "transparent"

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
                    onClicked: mediaDrawer.open()
                    background: null

                }

                Button {
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.left: mediaMenuButton.right
                    anchors.right: parent.right
                    anchors.rightMargin: 10
                    anchors.topMargin: 10
                    anchors.bottomMargin: 10
                    onClicked: mediaStackView.push(mediaSearchView)
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
                // TO DO: Setup dynamic cell sizing: cellHeight = title height + upload height = (contentHeight)
                id: mediaListView
                width: parent.width
                height: parent.height - mediaToolBar.height
                clip: true
                anchors.top: mediaToolBar.bottom


                model: Uni.MediaFeedModel {} /*ListModel {


                    ListElement {
                        type: "photo"
                    }

                    ListElement {
                        type: "media"
                    }

                    ListElement {
                        type: "photo"
                    }

                    ListElement {
                        type: "media"
                    }

                    ListElement {
                        type: "post"
                    }

                    ListElement {
                        type: "post"
                    }

                    ListElement {
                        type: "media"
                    }


                }*/

                delegate: chooser

                DelegateChooser {
                    id: chooser
                    role: "type"

                    DelegateChoice {
                        roleValue: "media"
                        VideoDelegate {
                            username: model.username
                            displayName: model.displayName
                            caption: model.caption
                            timestamp: model.timestamp
                            likeCount: model.likeCount
                            commentCount: model.commentCount
                            mediaUrl: model.mediaUrl
                            onOpenProfileRequested: {
                                mediaStackView.push(
                                            Qt.createComponent("qrc:/qt/qml/Uni/Shared/ProfilePreview.qml"),
                                            { stackView: mediaStackView }
                                            )
                            }
                            onOpenMediaPlayerRequested: {
                                mediaStackView.push(
                                            Qt.createComponent("qrc:/qt/qml/Uni/Shared/MediaPlayerView.qml"),
                                            { stackView: mediaStackView }
                                            )
                            }
                        }
                    }
                    DelegateChoice { roleValue: "post"; PostDelegate {
                            username: model.username
                            displayName: model.displayName
                            caption: model.caption
                            content: model.content
                            timestamp: model.timestamp
                            likeCount: model.likeCount
                            commentCount: model.commentCount
                            mediaUrl: model.mediaUrl
                        }
                    }

                    DelegateChoice { roleValue: "photo"; PhotoDelegate {
                            username: model.username
                            displayName: model.displayName
                            caption: model.caption
                            timestamp: model.timestamp
                            likeCount: model.likeCount
                            commentCount: model.commentCount
                            mediaUrl: model.mediaUrl
                            onOpenThreadRequested: {
                                mediaStackView.push(
                                            Qt.createComponent("qrc:/qt/qml/Uni/Shared/PhotoThreadView.qml"),
                                            { stackView: mediaStackView }
                                            )}
                        }
                    }
                }
            }
        }
    }

    Component {
        id: mediaSearchView
        MediaSearchView {}
    }

    Component {
        id: photoThreadView
        PhotoThreadView {}
    }

}





