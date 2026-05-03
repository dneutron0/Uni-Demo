import QtQuick 2.15

Item {
    width: discoverStackView.width
    height: discoverStackView.height

    ListView {
        id: discoverMediaGridView
        width: parent.width
        height: parent.height
        clip: true
        model: ListModel {
            ListElement {

            }

            ListElement {

            }

        }

        delegate:  Item {
            width: discoverMediaGridView.width
            height: discoverMediaGridView.height*.8

            Column {
                id: imageframe1
                width: parent.width*.3333
                height: parent.height*.5
                anchors.left: parent.left
                anchors.top: parent.top

                Rectangle {
                    width: parent.width
                    height: parent.height*.5
                    color: "gray"
                }

                Rectangle {
                    width: parent.width
                    height: parent.height*.5
                    color: "gray"

                }
            }

            Column {
                id: imageframe2
                width: parent.width*.3333
                height: parent.height*.5
                anchors.left: imageframe1.right
                anchors.top: parent.top

                Rectangle {
                    width: parent.width
                    height: parent.height*.5
                    color: "gray"

                }

                Rectangle {
                    width: parent.width
                    height: parent.height*.5
                    color: "gray"

                }
            }

            Rectangle {
                id: vidEoframe1
                width: imageframe2.width
                height: imageframe1.height
                anchors.left: imageframe2.right
                color: "black"

            }

            Rectangle {
                id: vidEoframe2
                width: imageframe2.width
                height: imageframe1.height
                anchors.top: imageframe1.bottom
                anchors.left: parent.left
                color: "black"
            }

            Column {
                id: imageframe3
                width: parent.width*.3333
                height: parent.height*.5
                anchors.left: vidEoframe2.right
                anchors.top: imageframe1.bottom

                Rectangle {
                    width: parent.width
                    height: parent.height*.5
                    color: "gray"

                }

                Rectangle {
                    width: parent.width
                    height: parent.height*.5
                    color: "gray"

                }
            }

            Column {
                id: imageframe4
                width: parent.width*.3333
                height: parent.height*.5
                anchors.left: imageframe3.right
                anchors.top: imageframe1.bottom

                Rectangle {
                    width: parent.width
                    height: parent.height*.5
                    color: "gray"

                }

                Rectangle {
                    width: parent.width
                    height: parent.height*.5
                    color: "gray"

                }
            }
        }
    }
}
