import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Column {
    id: root

    property int itemIndex: -1
    property string author: ""
    property string handle: ""
    property string avatarColor: "#111827"
    property string title: ""
    property string body: ""
    property string accentColor: "#f3f4f6"
    property int likeCount: 0
    property int commentCount: 0
    property string timeAgo: ""
    property bool liked: false
    property bool bookmarked: false

    height: childrenRect.height + 12

    Rectangle {
        width: root.width - 24
        height: cardContent.implicitHeight + 22
        anchors.horizontalCenter: parent.horizontalCenter
        radius: 8
        color: "white"
        border.color: "#e5e7eb"

        ColumnLayout {
            id: cardContent
            anchors.fill: parent
            anchors.margins: 12
            spacing: 10

            RowLayout {
                Layout.fillWidth: true
                spacing: 10

                Rectangle {
                    Layout.preferredWidth: 38
                    Layout.preferredHeight: 38
                    radius: 19
                    color: avatarColor
                }

                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 1

                    Label {
                        text: author
                        color: "#111827"
                        font.pixelSize: 15
                        font.weight: Font.DemiBold
                    }

                    Label {
                        text: handle + " | " + timeAgo
                        color: "#6b7280"
                        font.pixelSize: 12
                    }
                }
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: Math.max(128, postText.implicitHeight + titleText.implicitHeight + 44)
                radius: 8
                color: accentColor

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 14
                    spacing: 8

                    Label {
                        id: titleText
                        Layout.fillWidth: true
                        visible: root.title.length > 0
                        text: root.title
                        wrapMode: Text.WordWrap
                        color: "#111827"
                        font.pixelSize: 18
                        font.weight: Font.DemiBold
                    }

                    Label {
                        id: postText
                        Layout.fillWidth: true
                        text: root.body
                        wrapMode: Text.WordWrap
                        color: "#374151"
                        font.pixelSize: 16
                    }
                }
            }

            InteractionBar {
                Layout.fillWidth: true
                itemIndex: root.itemIndex
                likeCount: root.likeCount
                commentCount: root.commentCount
                liked: root.liked
                bookmarked: root.bookmarked
            }
        }
    }
}
