import QtQuick 2.12
import QtQuick.Controls 2.12

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
        stack.push(Qt.resolvedUrl("StudentPage.qml"), {
            stackView: stack  
        })
    }
}
