import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import UniDemo 1.0

RowLayout {
    property int itemIndex: -1
    property int likeCount: 0
    property int commentCount: 0
    property bool liked: false
    property bool bookmarked: false

    spacing: 4

    Button {
        text: likeCount
        icon.source: "qrc:/assets/heart-icon.svg"
        flat: true
        opacity: liked ? 1 : 0.7
        onClicked: MediaFeedModel.toggleLike(itemIndex)
    }

    Button {
        text: commentCount
        icon.source: "qrc:/assets/comment-icon.svg"
        flat: true
    }

    Button {
        icon.source: "qrc:/assets/share-icon.svg"
        flat: true
    }

    Item {
        Layout.fillWidth: true
    }

    Button {
        icon.source: "qrc:/assets/bookmark-icon.svg"
        flat: true
        opacity: bookmarked ? 1 : 0.55
        onClicked: MediaFeedModel.toggleBookmark(itemIndex)
    }
}
