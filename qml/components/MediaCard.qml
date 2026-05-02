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
    property string caption: ""
    property string mediaKind: "video"
    property string thumbnailUrl: ""
    property string accentColor: "#eef2ff"
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

            Label {
                Layout.fillWidth: true
                text: caption
                wrapMode: Text.WordWrap
                color: "#374151"
                font.pixelSize: 15
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 220
                radius: 8
                clip: true
                color: accentColor

                Image {
                    anchors.fill: parent
                    source: thumbnailUrl
                    fillMode: Image.PreserveAspectCrop
                    opacity: 0.9
                }

                Rectangle {
                    width: 58
                    height: 58
                    radius: 29
                    anchors.centerIn: parent
                    color: "#cc000000"

                    Image {
                        anchors.centerIn: parent
                        width: 30
                        height: 30
                        source: "qrc:/assets/play-icon.svg"
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
