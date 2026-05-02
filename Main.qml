import QtQuick
import QtQuick.Controls
import UniDemo 1.0

ApplicationWindow {
    id: root
    width: 412
    height: 844
    visible: true
    title: "Uni Demo"
    color: "#f7f8fb"

    Loader {
        anchors.fill: parent
        sourceComponent: AuthService.loggedIn ? appShellComponent : authComponent
    }

    Component {
        id: authComponent
        AuthView {}
    }

    Component {
        id: appShellComponent
        AppShell {}
    }
}
