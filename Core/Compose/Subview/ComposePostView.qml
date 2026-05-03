import QtQuick
import QtQuick.Controls
import Uni 1.0

Flickable {
    id: composePostView
    width: composeStackView.width
    height: composeStackView.height
    contentHeight: childrenRect.height
    property Upload upload: null

    Rectangle {
        id: postViewToolBar
        width: parent.width
        height: composeStackView.height*.075
        color: "transparent"
        anchors.top: parent.top

        Button {
            text: "Publish"
            anchors.right: parent.right
            anchors.margins: 5
            width: implicitWidth
            anchors.verticalCenter: parent.verticalCenter
            height: parent.height*.8
            onClicked: {
                if (postTextArea.text.trim().length === 0) {
                    console.log("Cannot upload empty text")
                    return
                }

                // 1. Create the upload object
                upload = UploadManager.createUpload()

                // 2. Fill it
                upload.title = uploadTitleField.text.trim()
                upload.content = postTextArea.text.trim()
                upload.authorId = UserManager.currentUser.uid
                upload.username = UserManager.currentUser.username

                // 3. Upload it
                UploadManager.uploadTextPost(upload)
            }
        }

        Connections {
            target: UploadManager
            function onUploadSuccess() {
                console.log("Post uploaded!")
                postTextArea.text = ""
                uploadTitleField.text = ""
            }

            function onUploadFailed(err) {
                console.log("Upload failed:", err)
            }
        }
    }

    TextEdit {
        id: uploadTitleField
        width: parent.width
        height: implicitHeight + 12
        font.pixelSize: 28
        font.weight: 480
        inputMethodHints: Qt.ImhNoPredictiveText

        anchors.top: postViewToolBar.bottom
        anchors.topMargin: 25

        Text {
                text: "Title (optional)"
                visible: uploadTitleField.text.length === 0
                color: "#9a9a9a"
                font.pixelSize: 28
                font.weight: 480
            }
    }

    TextEdit {
        id: postTextArea
        anchors.top: uploadTitleField.bottom
        anchors.topMargin: 30
        width: parent.width
        font.pixelSize: 18
        text: "What's on your mind?"

        onTextChanged: {
            if (text.length > 0 && text !== "What's on your mind?") {
                text = ""
            } else {
                text = "What's on your mind?"
            }
        }
    }

    Connections {
        target: Qt.inputMethod
        function onVisibleChanged() {
            if (!Qt.inputMethod.visible) {
                Qt.callLater(() => Qt.inputMethod.update())
            }
        }
    }


    onVisibleChanged: {
        if (visible) {
            Qt.callLater(() => {

                             uploadTitleField.forceActiveFocus()
                             Qt.inputMethod.show()
                         })
        } else {
            Qt.inputMethod.hide()
        }
    }

}
