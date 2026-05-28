import QtQuick 2.12
import QtQuick.Controls 2.12

Page {
    property var stackView

    Rectangle {
        anchors.fill: parent

        gradient: Gradient {
            GradientStop { position: 0.0; color: "#667eea" }
            GradientStop { position: 1.0; color: "#764ba2" }
        }

        Column {
            anchors.centerIn: parent
            spacing: 20

            Text {
                text: "📘"
                font.pixelSize: 90
                horizontalAlignment: Text.AlignHCenter
                width: parent.width
            }

            Text {
                text: "Quiz App"
                font.pixelSize: 32
                font.bold: true
                color: "white"
            }

            Text {
                text: "Learn • Practice • Score"
                font.pixelSize: 16
                color: "white"
            }
        }

        // Auto Open Student Page
        Timer {
            interval: 2500
            running: true
            repeat: false

            onTriggered: {
                stackView.replace(Qt.resolvedUrl("StudentPage.qml"), {
                    stackView: stackView
                })
            }
        }
    }
}
