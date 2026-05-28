import QtQuick 2.12
import QtQuick.Controls 2.12
import "Database.js" as DB

ApplicationWindow {
    visible: true
    width: 420
    height: 720
    title: "Quiz App"

    StackView {
        id: stack
        anchors.fill: parent
    }

    Component.onCompleted: {
        DB.initDB()

        //  Open Splash Screen first
        stack.push(Qt.resolvedUrl("SplashScreen.qml"), {
            stackView: stack
        })
    }
}
