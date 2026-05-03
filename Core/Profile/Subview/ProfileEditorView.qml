import QtQuick 2.15
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import Uni 1.0

Popup {
    property Popup editorPopup : this
    id: editorPopup
    width: mainWindow.width
    height: mainWindow.height
    dim: true
    modal: true
    padding: 0

    contentItem: Item {
        anchors.fill: parent

        Rectangle {
            id: viewTitleFrame
            width: parent.width
            height: parent.height * .08
            anchors.top: parent.top
            color: "transparent"

            RoundButton {
                id: backButton
                width: parent.height * .9
                height: parent.height * .9
                onClicked: editorPopup.close()
                icon.source:  "qrc:/images/Resources/back-icon.svg"
                icon.width: width
                icon.height: height
                background: null
            }


            Text {
                text: "Edit Profile"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 18
            }

            Button {
                id: doneButton
                anchors.right: parent.right
                text: "Done"
                enabled: false
                background: null
                anchors.verticalCenter: parent.verticalCenter
                onClicked: {
                    if (UserManager.currentUser.profilePictureUrl !== profilePreviewImage.source) {
                        UserManager.updateProfilePicture(profilePreviewImage.source)
                    }

                    if (UserManager.currentUser.profileCoverImageUrl !== bannerPreviewImage.source) {

                    }


                }
            }

        }


        Rectangle {
            id: mediaEditorFrame
            width: parent.width * .95
            color: "darkgray"
            border.width: .01
            anchors.top: viewTitleFrame.bottom
            height: parent.height * .4
            anchors.topMargin: 15
            anchors.horizontalCenter: parent.horizontalCenter
            radius: 10


            Rectangle {
                id: bannerPreview
                width: parent.width
                height: parent.height * .52
                color: "gray"
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter

                Image {
                    id: bannerPreviewImage
                    anchors.fill: parent
                    onSourceChanged: doneButton.enabled = true

                }

                Rectangle {
                    id: profileImageFrame
                    width: parent.height*.65
                    height: parent.height * .65
                    radius: width * .5
                    anchors.centerIn: parent
                    color: "black"

                    Image {
                        id: profilePreviewImage
                        anchors.fill: parent
                        visible: false
                        onSourceChanged: doneButton.enabled = true
                    }

                    OpacityMask {
                        source: profilePreviewImage
                        anchors.fill: profilePreviewImage
                        maskSource: profileImageMask


                    }
                    Rectangle {
                        id: profileImageMask
                        anchors.fill: profilePreviewImage
                        radius: profilePreviewImage.width * .5
                        visible: false
                    }

                }

            }

        //     OpacityMask {
        //         anchors.top: bannerPreview.top
        //         width: bannerPreview.width
        //         height: 20
        //         source: bannerPreview
        //         maskSource: mask

        //     }

        //     Rectangle {
        //     id: mask
        //     width: bannerPreview.width
        //     anchors.top: bannerPreview.top
        //     height: 20
        //     radius: 10
        //     visible: false
        // }


            Rectangle {
                id: profilePictureEditorButton
                width: parent.width
                height: (parent.height - bannerPreview.height) * .5 - .5
                anchors.top: bannerPreview.bottom
                color: "transparent"

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        mediaPickerDialog.targetType = "profilePicture"
                        mediaPickerDialog.open()
                    }
                }


                Label {
                    text: "Profile Picture"
                    font.pixelSize: 17
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.margins: 10
                    font.weight: 500

                }

                Image {
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    width: parent.height * .35
                    height: parent.height * .35
                    anchors.margins: 5
                    source: "qrc:/images/Resources/edit-icon.svg"
                }


            }


            Rectangle {
                width: parent.width
                height: (parent.height - bannerPreview.height) * .5 - .5
                anchors.top: profilePictureEditorButton.bottom
                color: "transparent"

                Label {
                    text: "Profile Cover"
                    font.pixelSize: 17
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.margins: 10
                    font.weight: 500

                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        mediaPickerDialog.targetType = "profileBanner"
                        mediaPickerDialog.open()
                    }
                }

                Image {
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                    width: parent.height * .35
                    height: parent.height * .35
                    anchors.margins: 5
                    source: "qrc:/images/Resources/edit-icon.svg"
                }
            }
        }



        Label {
            id: aboutLabel
            anchors.top: mediaEditorFrame.bottom
            topPadding: 10
            text: "ABOUT"
            font.pixelSize: 15
            font.weight: 600
            anchors.left: infoEditorFrame.left
        }

        Rectangle {
            id: infoEditorFrame
            width: parent.width*.95
            height: parent.height * .4
            anchors.top: aboutLabel.bottom
            anchors.topMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
            visible: false
            color: "darkgray"

            Column {
                width: parent.width
                height: parent.height

                Rectangle {
                    width: parent.width
                    height: parent.height * .25
                    color: "transparent"

                    Label {
                        id: nameLabel
                        text: "Name"
                        font.pixelSize: 17
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.margins: 10
                        font.weight: 500

                    }

                    Label {
                        text: UserManager.currentUser.fullName
                        font.pixelSize: 17
                        anchors.top: nameLabel.bottom
                        anchors.left: nameLabel.left
                        anchors.topMargin: 5

                    }

                    Image {
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        width: parent.height * .35
                        height: parent.height * .35
                        anchors.margins: 5
                        source: "qrc:/images/Resources/open-icon.svg"
                    }

                }

                Rectangle {
                    width: parent.width
                    height: parent.height * .25
                    color: "transparent"

                    Label {
                        id: usernameLabel
                        text: "Username"
                        font.pixelSize: 17
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.margins: 10
                        font.weight: 500

                    }

                    Label {
                        text: UserManager.currentUser.username
                        font.pixelSize: 17
                        anchors.top: usernameLabel.bottom
                        anchors.left: usernameLabel.left
                        anchors.topMargin: 5
                    }

                    Image {
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        width: parent.height * .35
                        height: parent.height * .35
                        anchors.margins: 5
                        source: "qrc:/images/Resources/open-icon.svg"
                    }




                }

                Rectangle {
                    width: parent.width
                    height: parent.height * .25
                    color: "transparent"

                    Label {
                        text: "Bio"
                        font.pixelSize: 17
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.margins: 10
                        font.weight: 500


                    }

                    Image {
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        width: parent.height * .35
                        height: parent.height * .35
                        anchors.margins: 5
                        source: "qrc:/images/Resources/open-icon.svg"
                    }

                }

                Rectangle {
                    width: parent.width
                    height: parent.height * .25
                    color: "transparent"

                    Label {
                        text: "Location"
                        font.pixelSize: 17
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.margins: 10
                        font.weight: 500

                    }

                    Label {

                    }

                    Image {
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        width: parent.height * .35
                        height: parent.height * .35
                        anchors.margins: 5
                        source: "qrc:/images/Resources/open-icon.svg"
                    }

                }
            }
        }

        OpacityMask {
            anchors.fill: infoEditorFrame
            source: infoEditorFrame
            maskSource: Rectangle {
                width: infoEditorFrame.width
                height: infoEditorFrame.height
                radius: 10
                visible: false
            }
        }

        Dialog {
            property string targetType: ""

            id: mediaPickerDialog
            width: parent.width
            height: parent.height * .2
            y: (mainWindow.height - height) + 25
            x: (parent.width - width) * .5

            background: Rectangle {
                width: mediaPickerDialog.width
                height: mediaPickerDialog.height
                color: "gray"
                radius: 10

            }

            Rectangle {
                width: parent.width * .98
                height: parent.height * .75
                anchors.horizontalCenter: parent.horizontalCenter
                color: "dimgray"
                radius: 10

                Label {
                    id: choosePhotoLabel
                    anchors.top: parent.top
                    anchors.bottom: sep.top
                    anchors.left: parent.left
                    anchors.right: parent.right
                    text: "Choose exisiting photo"
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    font.weight: Font.DemiBold
                    leftPadding: 15

                    MouseArea {
                        anchors.fill: parent

                        onClicked: {
                            GalleryManager.openCameraRoll()

                        }
                    }

                }

                Rectangle {
                    id: sep
                    width: parent.width
                    anchors.centerIn: parent
                    color: "black"
                    height: 1
                }

                Label {
                    anchors.top: sep.bottom
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right
                    text: "Take photo"
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    font.weight: Font.DemiBold
                    leftPadding: 15


                }


            }



        }

    }


    Connections {
        target: GalleryManager
        onMediaPicked: function(filePath) {
            console.log("Picked media:", filePath)

            let realPath = GalleryManager.resolveUriToFilePath(filePath)
            console.log(realPath)


            if (mediaPickerDialog.targetType === "profilePicture") {
                profilePreviewImage.source = "file://" + realPath
            } else if (mediaPickerDialog.targetType === "profileBanner") {
                bannerPreviewImage.source = "file://" + realPath
            }

            mediaPickerDialog.close()
        }

        onMediaPickFailed: function(reason) {
            console.log("Pick failed:", reason)
        }
    }

}









