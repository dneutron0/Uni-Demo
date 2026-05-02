import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQml.Models
import UniDemo 1.0

Item {
    id: root

    Rectangle {
        anchors.fill: parent
        color: "#f7f8fb"
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 76
            color: "white"

            RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 18
                anchors.rightMargin: 18
                spacing: 12

                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 2

                    Label {
                        text: "Media"
                        color: "#111827"
                        font.pixelSize: 25
                        font.weight: Font.DemiBold
                    }

                    Label {
                        text: "Mock feed data from a C++ QAbstractListModel"
                        color: "#6b7280"
                        font.pixelSize: 13
                    }
                }

                Button {
                    icon.source: "qrc:/assets/search-icon.svg"
                    text: "Refresh"
                    onClicked: MediaFeedModel.refreshDemoData()
                }
            }
        }

        ListView {
            id: feedList
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            spacing: 0
            model: MediaFeedModel

            delegate: DelegateChooser {
                role: "type"

                DelegateChoice {
                    roleValue: "media"
                    MediaCard {
                        width: feedList.width
                        itemIndex: index
                        author: model.author
                        handle: model.handle
                        avatarColor: model.avatarColor
                        title: model.title
                        caption: model.caption
                        mediaKind: model.mediaKind
                        thumbnailUrl: model.thumbnailUrl
                        accentColor: model.accentColor
                        likeCount: model.likeCount
                        commentCount: model.commentCount
                        timeAgo: model.timeAgo
                        liked: model.liked
                        bookmarked: model.bookmarked
                    }
                }

                DelegateChoice {
                    roleValue: "photo"
                    PhotoCard {
                        width: feedList.width
                        itemIndex: index
                        author: model.author
                        handle: model.handle
                        avatarColor: model.avatarColor
                        caption: model.caption
                        thumbnailUrl: model.thumbnailUrl
                        accentColor: model.accentColor
                        likeCount: model.likeCount
                        commentCount: model.commentCount
                        timeAgo: model.timeAgo
                        liked: model.liked
                        bookmarked: model.bookmarked
                    }
                }

                DelegateChoice {
                    roleValue: "post"
                    PostCard {
                        width: feedList.width
                        itemIndex: index
                        author: model.author
                        handle: model.handle
                        avatarColor: model.avatarColor
                        title: model.title
                        body: model.body
                        accentColor: model.accentColor
                        likeCount: model.likeCount
                        commentCount: model.commentCount
                        timeAgo: model.timeAgo
                        liked: model.liked
                        bookmarked: model.bookmarked
                    }
                }
            }
        }
    }
}
