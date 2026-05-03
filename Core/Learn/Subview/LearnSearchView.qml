import QtQuick 2.15
import QtQuick.Controls

Item {
    id: learnSearchView
    width: learnStackView.width
    height: learnStackView.height

    Rectangle {
        id: learnGridViewToolbar
        width: learnSearchView.width
        height: learnSearchView.height*.075
        color: "transparent"

        Button {
            icon.source: "qrc:/images/Resources/back-icon.svg"
            icon.width: parent.height*.7
            icon.height: parent.height*.7
            onClicked: learnStackView.popCurrentItem()
            background: null
            anchors.verticalCenter: parent.verticalCenter
        }
    }

}
