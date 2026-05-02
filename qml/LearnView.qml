import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root

    Rectangle {
        anchors.fill: parent
        color: "#f7f8fb"
    }

    Flickable {
        anchors.fill: parent
        contentHeight: contentColumn.implicitHeight + 36
        clip: true

        ColumnLayout {
            id: contentColumn
            width: root.width
            anchors.top: parent.top
            anchors.topMargin: 18
            spacing: 14

            SectionHeader {
                Layout.leftMargin: 18
                Layout.rightMargin: 18
                title: "Learn"
                subtitle: "Course paths, subtopics, and study media shown with local demo data."
            }

            Repeater {
                model: [
                    {
                        name: "Computer Science",
                        detail: "Data structures, graph traversal, dynamic programming",
                        progress: "68%",
                        color: "#dbeafe"
                    },
                    {
                        name: "Creator Dashboard",
                        detail: "Draft lessons, learner questions, publishing status",
                        progress: "4 drafts",
                        color: "#dcfce7"
                    },
                    {
                        name: "Career Path",
                        detail: "Skills checklist, saved resources, next course",
                        progress: "Next: interviews",
                        color: "#fef3c7"
                    }
                ]

                Rectangle {
                    Layout.fillWidth: true
                    Layout.leftMargin: 18
                    Layout.rightMargin: 18
                    Layout.preferredHeight: 118
                    radius: 8
                    color: "white"
                    border.color: "#e5e7eb"

                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 14
                        spacing: 12

                        Rectangle {
                            Layout.preferredWidth: 56
                            Layout.preferredHeight: 56
                            radius: 8
                            color: modelData.color

                            Image {
                                anchors.centerIn: parent
                                width: 28
                                height: 28
                                source: "qrc:/assets/education-icon.svg"
                            }
                        }

                        ColumnLayout {
                            Layout.fillWidth: true
                            spacing: 4

                            Label {
                                Layout.fillWidth: true
                                text: modelData.name
                                color: "#111827"
                                font.pixelSize: 17
                                font.weight: Font.DemiBold
                            }

                            Label {
                                Layout.fillWidth: true
                                text: modelData.detail
                                wrapMode: Text.WordWrap
                                color: "#4b5563"
                                font.pixelSize: 13
                            }
                        }

                        Label {
                            text: modelData.progress
                            color: "#2563eb"
                            font.pixelSize: 13
                            font.weight: Font.DemiBold
                        }
                    }
                }
            }
        }
    }
}
