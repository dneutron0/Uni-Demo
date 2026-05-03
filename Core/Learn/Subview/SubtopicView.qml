import QtQuick 2.15
import QtQuick.Controls
import Qt5Compat.GraphicalEffects
import QtQuick.Layouts
import QtQuick.Controls.Material
import "../../../Shared"
import "../Delegate"
import Uni 1.0 as Uni

Rectangle {
    id: subtopicView
    width: learnStackView.width
    height: learnStackView.height
    // color: "black"

    property string thumbnailUrl
    property string title

    Image {
        id: thumbnailImage
        width: parent.width
        height: parent.height* .46
        source: thumbnailUrl

        Rectangle {
            width: parent.width
            height: parent.height*.65
            anchors.bottom: parent.bottom
            gradient: Gradient {
                GradientStop { position: 0.0; color: "transparent" }
                GradientStop { position: 1.0; color: "black" }
            }
        }


    }

    ListView {
        id: subtopicListView
        anchors.fill: parent
        delegate: courseViewDelegate
        model: 10
        clip: true
        header: Rectangle {
            width: parent.width
            height: thumbnailImage.height
            color: "transparent"


            Button {
                id: backButton
                icon.source: "qrc:/images/Resources/back-icon.svg"
                icon.width: parent.height*.1
                icon.height: parent.height*.1
                onClicked: learnStackView.pop()
                background: null
                anchors.top: parent.top
                anchors.left: parent.left
            }

            Text {
                text: title
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: backButton.verticalCenter
                anchors.topMargin: 15
                font.pixelSize: 22
                font.weight: 550
            }

            Text {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.leftMargin: 20
                anchors.rightMargin: 20
                anchors.bottom: filterButton.top
                anchors.bottomMargin: 5
                text: "This is the description of the subtopic. This is the description of the subtopic. This is the description of the subtopic."
                font.pixelSize: 22
                wrapMode: Text.WordWrap
                color: "white"
            }

            RoundButton {
                id: filterButton
                radius: 100
                width: subtopicView.width*.15
                height: width
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter

            }
        }

    }

    Component {
      id: courseViewDelegate
      CourseViewDelegate {}
    }

}
