import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import UniDemo 1.0

Item {
    id: root

    Rectangle {
        anchors.fill: parent
        color: "#f7f8fb"
    }

    Flickable {
        anchors.fill: parent
        contentHeight: profileColumn.implicitHeight + 36
        clip: true

        ColumnLayout {
            id: profileColumn
            width: root.width
            anchors.top: parent.top
            anchors.topMargin: 18
            spacing: 14

            SectionHeader {
                Layout.leftMargin: 18
                Layout.rightMargin: 18
                title: "Profile"
                subtitle: "Local profile data with no account or backend dependency."
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.leftMargin: 18
                Layout.rightMargin: 18
                Layout.preferredHeight: 232
                radius: 8
                color: "white"
                border.color: "#e5e7eb"

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 18
                    spacing: 16

                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 14

                        Rectangle {
                            Layout.preferredWidth: 72
                            Layout.preferredHeight: 72
                            radius: 36
                            color: "#2563eb"

                            Label {
                                anchors.centerIn: parent
                                text: "A"
                                color: "white"
                                font.pixelSize: 30
                                font.weight: Font.DemiBold
                            }
                        }

                        ColumnLayout {
                            Layout.fillWidth: true
                            spacing: 4

                            Label {
                                text: AuthService.displayName
                                color: "#111827"
                                font.pixelSize: 22
                                font.weight: Font.DemiBold
                            }

                            Label {
                                text: AuthService.handle + " | " + ProfileModel.major
                                color: "#6b7280"
                                font.pixelSize: 14
                            }

                            Label {
                                text: ProfileModel.campus
                                color: "#374151"
                                font.pixelSize: 14
                            }
                        }
                    }

                    RowLayout {
                        Layout.fillWidth: true
                        spacing: 8

                        StatPill {
                            Layout.fillWidth: true
                            label: "Posts"
                            value: ProfileModel.posts
                        }

                        StatPill {
                            Layout.fillWidth: true
                            label: "Followers"
                            value: ProfileModel.followers
                        }

                        StatPill {
                            Layout.fillWidth: true
                            label: "Saved"
                            value: ProfileModel.saved
                        }
                    }
                }
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.leftMargin: 18
                Layout.rightMargin: 18
                Layout.preferredHeight: 148
                radius: 8
                color: "#ecfeff"

                Column {
                    anchors.fill: parent
                    anchors.margins: 16
                    spacing: 8

                    Label {
                        text: "Demo privacy posture"
                        color: "#164e63"
                        font.pixelSize: 17
                        font.weight: Font.DemiBold
                    }

                    Label {
                        width: parent.width
                        text: "This screen intentionally avoids real account data, private messaging, and backend identifiers."
                        wrapMode: Text.WordWrap
                        color: "#155e75"
                        font.pixelSize: 14
                    }
                }
            }

            Button {
                Layout.fillWidth: true
                Layout.leftMargin: 18
                Layout.rightMargin: 18
                text: "Sign out"
                onClicked: AuthService.signOut()
            }
        }
    }
}
