import QtQuick 2.15
import QtQuick.Controls

Item {
    id: mediaSearchView
    width: mediaStackView.width
    height: mediaStackView.height

    Rectangle {
        id: mediaGridViewToolbar
        width: mediaSearchView.width
        height: mediaSearchView.height*.075
        color: "transparent"

        Button {
            icon.source: "qrc:/images/Resources/back-icon.svg"
            icon.width: parent.height*.7
            icon.height: parent.height*.7
            onClicked: mediaStackView.popCurrentItem()
            background: null
            anchors.verticalCenter: parent.verticalCenter
        }
    }

}
