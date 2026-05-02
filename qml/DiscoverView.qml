import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    id: root

    Rectangle {
        anchors.fill: parent
        color: "#f7f8fb"
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 18
        spacing: 14

        SectionHeader {
            title: "Discover"
            subtitle: "Explore people, media categories, and learning spaces without connecting to private services."
        }

        TextField {
            Layout.fillWidth: true
            placeholderText: "Search Uni"
            leftPadding: 38

            Image {
                width: 18
                height: 18
                anchors.left: parent.left
                anchors.leftMargin: 12
                anchors.verticalCenter: parent.verticalCenter
                source: "qrc:/assets/search-icon.svg"
                opacity: 0.55
            }
        }

        GridLayout {
            Layout.fillWidth: true
            columns: root.width > 520 ? 3 : 2
            columnSpacing: 10
            rowSpacing: 10

            Repeater {
                model: [
                    { label: "Trending", detail: "Media", color: "#e0f2fe" },
                    { label: "Live", detail: "Events", color: "#fee2e2" },
                    { label: "Music", detail: "Clips", color: "#f3e8ff" },
                    { label: "Movies + TV", detail: "Watch", color: "#dcfce7" },
                    { label: "Creators", detail: "Profiles", color: "#fef3c7" },
                    { label: "Courses", detail: "Learn", color: "#ede9fe" }
                ]

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 112
                    radius: 8
                    color: modelData.color

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 12
                        spacing: 4

                        Label {
                            Layout.fillWidth: true
                            text: modelData.label
                            color: "#111827"
                            font.pixelSize: 17
                            font.weight: Font.DemiBold
                        }

                        Label {
                            Layout.fillWidth: true
                            text: modelData.detail
                            color: "#374151"
                            font.pixelSize: 13
                        }

                        Item {
                            Layout.fillHeight: true
                        }
                    }
                }
            }
        }

        Item {
            Layout.fillHeight: true
        }
    }
}
