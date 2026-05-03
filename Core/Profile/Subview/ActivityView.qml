import QtQuick 2.15
import QtQuick.Controls

Item {
    width: profileStackView.width
    height: profileStackView.height
    property StackView stackView

    Button {
        onClicked: {
            stackView.pop()
        }
    }

}
