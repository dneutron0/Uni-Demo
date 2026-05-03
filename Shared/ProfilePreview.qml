import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Layouts
import QtQml.Models
import Uni 1.0


Flickable {
    id: profilePreview
    width: mainLayout.width
    height: mainLayout.height

    property StackView stackView

    contentWidth: width
    contentHeight:
        profileHeader.profileTabBar.currentIndex === 0 ? profileView.childrenRect.height + profileHeader.height :

                                                         profileHeader.profileTabBar.currentIndex === 1 ? profileView2.childrenRect.height + profileHeader.height :

                                                                                                          profileHeader.profileTabBar.currentIndex === 2 ? profileView3.childrenRect.height + profileHeader.height : null

    ProfilePreviewHeader {
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
                model: ListModel {
                    ListElement { type: "media" }
                    ListElement { type: "post" }
                }

                delegate: chooser

                DelegateChooser {
                    id: chooser
                    role: "type"

                    DelegateChoice {
                        roleValue: "media"
                        VideoDelegate {
                            onOpenProfileRequested: {
                                stackView.push(
                                            Qt.createComponent("qrc:/qt/qml/Uni/Shared/ProfilePreview.qml"),
                                            { stackView: stackView }
                                            )
                            }
                        }
                    }
                    DelegateChoice { roleValue: "post"; PostDelegate {} }
                }
            }
        }

        Column {
            id: profileView2
            width: parent.width
            height: childrenRect.height

            GridView  {
                id: profileActivityListView2
                width: profilePreview.width
                height: contentHeight
                cellWidth: profilePreview.width*.333
                cellHeight: profilePreview.height * .28
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
                width: profilePreview.width
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


