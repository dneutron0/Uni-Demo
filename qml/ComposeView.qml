import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import UniDemo 1.0

Item {
    id: root
    signal closeRequested()

    Rectangle {
        anchors.fill: parent
        color: "#f7f8fb"
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 18
        spacing: 14

        SectionHeader {
            title: "Compose"
            subtitle: "Create a media, photo, or text upload through the same mock C++ service."
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 382
            radius: 8
            color: "white"
            border.color: "#e5e7eb"

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 16
                spacing: 12

                TextField {
                    id: titleField
                    Layout.fillWidth: true
                    placeholderText: "Optional title"
                }

                TextArea {
                    id: bodyField
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    placeholderText: "What is happening on campus?"
                    wrapMode: TextArea.Wrap
                }

                ProgressBar {
                    Layout.fillWidth: true
                    visible: UploadService.uploading
                    from: 0
                    to: 100
                    value: UploadService.progress
                }

                RowLayout {
                    Layout.fillWidth: true
                    spacing: 10

                    Button {
                        Layout.fillWidth: true
                        text: UploadService.uploading ? "Uploading..." : "Publish mock post"
                        enabled: !UploadService.uploading
                        icon.source: "qrc:/assets/plus-icon.svg"
                        onClicked: UploadService.startMockUpload(titleField.text, bodyField.text)
                    }

                    Button {
                        text: UploadService.uploading ? "Cancel" : "Close"
                        onClicked: {
                            if (UploadService.uploading) {
                                UploadService.cancel()
                            } else {
                                root.closeRequested()
                            }
                        }
                    }
                }
            }
        }

        Label {
            id: statusLabel
            Layout.fillWidth: true
            color: "#047857"
            wrapMode: Text.WordWrap
            font.pixelSize: 14
        }

        Item {
            Layout.fillHeight: true
        }
    }

    Connections {
        target: UploadService

        function onUploadFinished(title, body) {
            MediaFeedModel.addMockPost(title, body)
            titleField.text = ""
            bodyField.text = ""
            statusLabel.text = "Upload complete. The new post was inserted at the top of Media."
        }
    }
}
