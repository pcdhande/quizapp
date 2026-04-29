import QtQuick 2.12
import QtQuick.Controls 2.12

Page {
    property var stackView
    property int score
    property int total
    property string name

    Column {
        anchors.centerIn: parent
        spacing: 20

        Text { text: "Quiz Completed" }
        Text { text: "Name: " + name }
        Text { text: "Score: " + score + "/" + total }

        Button {
            text: "Go Home"
            onClicked: stackView.pop()
        }
    }
}
