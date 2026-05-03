import QtQuick 2.15
import QtQuick.Controls
import Uni 1.0

Item {
    property StackView stackView
    id: mediaLiveCategoryView
    width: mainLayout.width
    height: mainLayout.height

    Rectangle {
        id: mediaLiveCategoryViewToolbar
        width: mediaLiveCategoryView.width
        height: mediaLiveCategoryView.height*.075
        color: "transparent"

        Button {
            icon.source: "qrc:/images/Resources/back-icon.svg"
            icon.width: parent.height*.7
            icon.height: parent.height*.7
            onClicked: stackView.popCurrentItem()
            background: null
            anchors.verticalCenter: parent.verticalCenter
        }
    }

}
