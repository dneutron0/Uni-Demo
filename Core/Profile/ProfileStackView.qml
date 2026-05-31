import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import QtQml.Models
import "Model"
import "Subview"
import "../../Shared"
import Uni 1.0 as Uni

Item {
    width: parent.width
    height: parent.height

    ProfileEditorView {
        id: profileEditorView
    }

    StackView {
        id: profileStackView
        width: parent.width
        height: parent.height
        initialItem: profileComponent


        Component {
            id: profileComponent

            Flickable {
                id: profileFrame
                width: parent.width
                height: parent.height
                contentWidth: width
                contentHeight:
                    profileHeader.profileTabBar.currentIndex === 0 ? profileView.childrenRect.height + profileHeader.height :

                                                                     profileHeader.profileTabBar.currentIndex === 1 ? profileView2.childrenRect.height + profileHeader.height :

                                                                                                                      profileHeader.profileTabBar.currentIndex === 2 ? profileView3.childrenRect.height + profileHeader.height : null

                ProfileHeaderView {
                    id: profileHeader

                }


                StackLayout {
                    anchors.top: profileHeader.bottom
                    currentIndex: profileHeader.profileTabBar.currentIndex

                    Column {
                        id: profileView
                        width: parent.width

                        ListView {
                            id: activityListView
                            width: parent.width
                            height: contentHeight
                            interactive: false
                            clip: true
                            model: Uni.MediaFeedModel {}

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
                                            profileStackView.push(
                                                        Qt.createComponent("qrc:/qt/qml/Uni/Shared/ProfilePreview.qml"),
                                                        { stackView: profileStackView }
                                                        )
                                        }
                                        onOpenMediaPlayerRequested: {
                                            profileStackView.push(
                                                        Qt.createComponent("qrc:/qt/qml/Uni/Shared/MediaPlayerView.qml"),
                                                        {
                                                            stackView: profileStackView,
                                                            mediaUrl: model.mediaUrl,
                                                            username: model.username,
                                                            displayName: model.displayName,
                                                            caption: model.caption,
                                                            timestamp: model.timestamp,
                                                            likeCount: model.likeCount,
                                                            commentCount: model.commentCount
                                                        }
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
                                    } }
                                DelegateChoice { roleValue: "photo"; PhotoDelegate {
                                        username: model.username
                                        displayName: model.displayName
                                        caption: model.caption
                                        timestamp: model.timestamp
                                        likeCount: model.likeCount
                                        commentCount: model.commentCount
                                        mediaUrl: model.mediaUrl
                                        onOpenThreadRequested: {
                                            profileStackView.push(
                                                        Qt.createComponent("qrc:/qt/qml/Uni/Shared/PhotoThreadView.qml"),
                                                        {
                                                            stackView: profileStackView,
                                                            mediaUrl: model.mediaUrl,
                                                            username: model.username,
                                                            displayName: model.displayName,
                                                            caption: model.caption,
                                                            timestamp: model.timestamp,
                                                            likeCount: model.likeCount,
                                                            commentCount: model.commentCount
                                                        }
                                                        )}
                                        onOpenProfileRequested: {
                                            profileStackView.push(
                                                        Qt.createComponent("qrc:/qt/qml/Uni/Shared/ProfilePreview.qml"),
                                                        { stackView: profileStackView }
                                                        )
                                        }
                                    }
                                }
                            }
                        }
                    }

                    Column {
                        id: profileView2
                        width: parent.width
                        height: childrenRect.height

                        GridView  {
                            id: profileActivityListView2
                            width: profileStackView.width
                            height: contentHeight
                            cellWidth: profileStackView.width*.333
                            cellHeight: profileStackView.height * .28
                            layoutDirection: GridView.LeftToRight
                            anchors.horizontalCenter: parent.horizontalCenter

                            delegate: Rectangle {
                                width: profileActivityListView2.cellWidth * .99
                                height: profileActivityListView2.cellHeight * .99

                                Rectangle {
                                    width: parent.width
                                    height: parent.height
                                    anchors.centerIn: parent
                                    color: "gray"


                                }
                            }
                            Layout.fillHeight: false
                            model: 6
                            interactive: false
                        }


                    }

                    Column {
                        id: profileView3
                        width: parent.width
                        height: childrenRect.height
                        ListView  {
                            id: profileActivityListView3
                            width: profileStackView.width
                            height: contentHeight
                            spacing: 1
                            delegate: PostDelegate {}
                            Layout.fillHeight: false
                            model: 10
                            interactive: false

                        }
                    }
                }
            }
        }


        Component {
            id: inboxView
            InboxView {}
        }

        Component {
            id: activityView
            ActivityView {
                stackView: profileStackView
            }
        }

        Component {
            id: profilePreview
            ProfilePreview {
                stackView: profileStackView }
        }


    }

}
