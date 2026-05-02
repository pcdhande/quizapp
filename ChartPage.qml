import QtQuick 2.12
import QtQuick.Controls 2.12
import "Database.js" as DB

Page {
    property var stackView
    property var results: []

    Component.onCompleted: {
        results = DB.getAllResults()
    }

    // Gradient Background
    Rectangle {
        anchors.fill: parent

        gradient: Gradient {
            GradientStop { position: 0.0; color: "#4facfe" }
            GradientStop { position: 1.0; color: "#00f2fe" }
        }

        Column {
            anchors.fill: parent
            anchors.margins: 15
            spacing: 15

            // Title
            Text {
                text: "Performance Chart"
                font.pixelSize: 26
                font.bold: true
                color: "white"
            }

            // Chart List
            ListView {
                id: listView
                width: parent.width
                height: parent.height - 160
                model: results
                clip: true

                delegate: Rectangle {
                    width: listView.width
                    height: 70
                    radius: 12
                    color: "white"
                    border.color: "#ddd"

                    Row {
                        anchors.fill: parent
                        anchors.margins: 10
                        spacing: 10

                        // Student Name
                        Text {
                            text: modelData.name
                            font.bold: true
                            width: 120
                        }

                        // Subject
                        Text {
                            text: modelData.subject
                            width: 70
                        }

                        // Colored Bar based on subject
                        Rectangle {
                            width: modelData.score * 10
                            height: 20
                            radius: 6

                            color: modelData.subject === "Python" ? "#4CAF50"
                                   : modelData.subject === "C++" ? "#2196F3"
                                   : "#FF9800"   // Java
                        }

                        // Score Text
                        Text {
                            text: modelData.score
                            font.bold: true
                        }
                    }
                }
            }
        }

        //Go Home Button
        Button {
            text: "Go Home"
            width: parent.width * 0.9
            height: 45

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20

            background: Rectangle {
                color: "#333"
                radius: 20
            }

            contentItem: Text {
                text: "Go Home"
                color: "white"
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            onClicked: {
                stackView.pop(null)
            }
        }
    }
}
