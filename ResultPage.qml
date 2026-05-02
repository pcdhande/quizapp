import QtQuick 2.12
import QtQuick.Controls 2.12

Page {
    property var stackView
    property int score
    property int total
    property string name

    Rectangle {
        anchors.fill: parent

        // Gradient Background
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#993c11" }
            GradientStop { position: 1.0; color: "#efcd38" }
        }

        Column {
            anchors.centerIn: parent
            spacing: 20
            width: parent.width * 0.85

            // Title
            Text {
                text: "Quiz Completed"
                font.pixelSize: 28
                font.bold: true
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                width: parent.width
            }

            // Result Card
            Rectangle {
                width: parent.width
                height: 180
                radius: 15
                color: "white"

                Column {
                    anchors.centerIn: parent
                    spacing: 10

                    Text {
                        text: "Name: " + name
                        font.pixelSize: 18
                        color: "#333"
                    }

                    Text {
                        text: "Score"
                        font.pixelSize: 16
                        color: "#777"
                    }

                    Text {
                        text: score + " / " + total
                        font.pixelSize: 32
                        font.bold: true
                        color: "#11998e"
                    }
                }
            }

            // Performance Message
            Text {
                text: score === total ? "Excellent " :
                      score > total/2 ? "Good Job " :
                      "Keep Practicing"
                color: "white"
                font.pixelSize: 18
                horizontalAlignment: Text.AlignHCenter
                width: parent.width
            }

            // View Results Button
            Button {
                text: "View All Results"
                width: parent.width

                background: Rectangle {
                    radius: 10
                    color: "#ff7a18"
                }

                contentItem: Text {
                    text: parent.text
                    color: "white"
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                onClicked: {
                    stackView.push(Qt.resolvedUrl("StudentListPage.qml"), {
                        stackView: stackView
                    })
                }
            }

            // Go Home Button
            Button {
                text: "Go Home"
                width: parent.width

                background: Rectangle {
                    radius: 10
                    color: "#555"
                }

                contentItem: Text {
                    text: parent.text
                    color: "white"
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                onClicked: stackView.pop()
            }
        }
    }
}
