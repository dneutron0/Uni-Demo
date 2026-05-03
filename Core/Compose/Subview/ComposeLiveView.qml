import QtQuick 2.15
import QtQuick.Controls 2.15
import QtMultimedia
import Qt5Compat.GraphicalEffects
import QtCore
import Uni 1.0

Rectangle {
    id: composeLiveView
    width: composeStackView.width
    height: composeStackView.height
    color: "black"

    property Upload upload: null;

    Rectangle {
        id: previewPopup
        visible: false
        radius: 10
        width: parent.width*.95
        height: parent.height
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 15
        anchors.bottom: parent.bottom
        clip: true
        color: "black"

        Image {
            id: previewImage
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
            smooth: true

        }

        OpacityMask {
        anchors.fill: previewPopup
        }

        Button {
            anchors.right: parent.right
            anchors.top: parent.top
            text: "Publish"

            onClicked: {

                // 1️⃣ Move file into the REAL public Pictures folder
                let externalPath = utilityManager.saveToPublicPictures(upload.mediaUrl)

                if (!externalPath || externalPath === "") {
                    console.log("❌ Failed to save via MediaStore (public folder)")
                    return
                }

                console.log("📁 Saved image to public Pictures:", externalPath)

                // 2️⃣ Give UploadManager the FINAL content:// URL
                upload.mediaUrl = externalPath   // <-- Do NOT prepend "file://"

                // 3️⃣ Hand the selected file to the mock upload service
                UploadManager.upload(upload)

                // 4️⃣ Reset UI
                previewPopup.visible = false
                previewImage.source = ""
                upload = null
            }
        }

    }

    Rectangle {
        id: outputFrame
        width: parent.width*.95
        height: parent.height
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 15
        anchors.bottom: parent.bottom
        clip: true
        visible: !previewPopup.visible
        color: "black"

        VideoOutput {
            id: preview
            anchors.fill: outputFrame
            fillMode: VideoOutput.PreserveAspectCrop
            visible: true
        }

        OpacityMask {
            visible: false
            anchors.fill: preview
            source: preview
            maskSource:
                Rectangle {
                width: outputFrame.width
                height: outputFrame.height
                radius: 10
                visible: false
            }

        }

        Button {
            id: shutterButton
            width: parent.width*.3
            height: parent.width*.3
            icon.source: "qrc:/images/Resources/shutter-icon.svg"
            icon.width: shutterButton.width*.7
            icon.height: shutterButton.height*.7
            icon.color: "white"
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            background: null
            onClicked: {
                cameraManager.imageCapture.captureToFile()

            }
        }

        Column {
            anchors.verticalCenter: shutterButton.verticalCenter
            anchors.right: parent.right
            spacing: 5
            width: flipCameraButton.width

            Button {
                id: flipCameraButton
                width:  outputFrame.width * .18
                height: outputFrame.width * .18
                icon.source: "qrc:/images/Resources/rotate-camera-icon.svg"
                icon.width: outputFrame.width
                icon.height: outputFrame.height
                icon.color: "white"

                background: null

                onClicked: {
                    cameraManager.flipCamera()
                }
            }

            Button {
                id: galleryButton
                width:  outputFrame.width * .18
                height: outputFrame.width * .18
                icon.source: "qrc:/images/Resources/photo-gallery-icon.svg"
                icon.width: outputFrame.width
                icon.height: outputFrame.height
                icon.color: "white"

                background: null

                onClicked: {
                    GalleryManager.openCameraRoll()
                }
            }
        }
    }

    Connections {
        target: GalleryManager

        onMediaPicked: function(filePath) {
            console.log("Picked media:", filePath)

            previewPopup.visible = true
            previewImage.source = filePath  // content:// works!

            upload = UploadManager.createUpload()
            upload.authorId = UserManager.currentUser.uid
            upload.username = UserManager.currentUser.username
            upload.mediaUrl = filePath
            upload.mediaType = filePath.includes("video") ? "video" : "image"
            upload.timestamp = Qt.formatDateTime(new Date(), "yyyy-MM-dd hh:mm:ss")
        }

        onMediaPickFailed: function(reason) {
            console.log("Failed to pick media:", reason)
        }
    }




    Component.onCompleted: {
        cameraManager.imageCapture.imageSaved.connect((id, filePath) => {
                                                          previewImage.source = "file://" + filePath
                                                          previewPopup.visible = true

                                                          upload = UploadManager.createUpload()
                                                          upload.authorId = UserManager.currentUser.uid
                                                          upload.username = UserManager.currentUser.username
                                                          upload.mediaUrl = "file://" + filePath
                                                          upload.mediaType = "image"
                                                          upload.timestamp = Qt.formatDateTime(new Date(), "yyyy-MM-dd hh:mm:ss")


                                                      })


    }

    Component.onDestruction: {
        // 👇 ensure camera shuts down when StoryView is unloaded
        cameraManager.camera.active = false
    }

    onVisibleChanged: {
        if (visible) {
            cameraManager.videoOutput = preview
            composeView.updateCameraActive()
        }
    }

}
