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
            width: parent.width * 0.9   // increased for better fit

            // TITLE
            Text {
                text: "Quiz Completed"
                font.pixelSize: 28
                font.bold: true
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                width: parent.width
                wrapMode: Text.WordWrap
                elide: Text.ElideRight
            }

            // RESULT CARD
            Rectangle {
                width: parent.width
                height: 200
                radius: 15
                color: "white"

                Column {
                    anchors.fill: parent
                    anchors.margins: 15
                    spacing: 10

                    Text {
                        text: "Name: " + name
                        font.pixelSize: 18
                        color: "#333"
                        width: parent.width
                        elide: Text.ElideRight
                    }

                    Text {
                        text: "Score"
                        font.pixelSize: 16
                        color: "#777"
                        width: parent.width
                    }

                    Text {
                        text: score + " / " + total
                        font.pixelSize: 34
                        font.bold: true
                        color: "#11998e"
                        width: parent.width
                        horizontalAlignment: Text.AlignHCenter
                    }
                }
            }

            // PERFORMANCE MESSAGE
            Text {
                text: score === total ? "Excellent" :
                      score > total/2 ? "Good Job" :
                      "Keep Practicing"

                color: "white"
                font.pixelSize: 18
                horizontalAlignment: Text.AlignHCenter
                width: parent.width
                wrapMode: Text.WordWrap
            }

            // VIEW RESULTS BUTTON
            Button {
                text: "View All Results"
                width: parent.width
                height: 45

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

            // GO HOME BUTTON
            Button {
                text: "Go Home"
                width: parent.width
                height: 45

                background: Rectangle {
                    radius: 10
                    color: "#444"
                }

                contentItem: Text {
                    text: parent.text
                    color: "white"
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                onClicked: {
                    if (stackView) {
                        stackView.pop()
                    }
                }
            }
        }
    }
}
