import QtQuick 2.12
import QtQuick.Controls 2.12
import "Database.js" as DB

Page {
    property var stackView
    property var results: []

    Component.onCompleted: {
        results = DB.getAllResults()
    }

    Rectangle {
        anchors.fill: parent
        color: "#f46b45"

        Column {
            anchors.fill: parent
            anchors.margins: 15
            spacing: 15

            // Title
            Text {
                text: "Student Results"
                font.pixelSize: 26
                font.bold: true
                color: "white"
            }

            // List
            ListView {
                id: listView
                width: parent.width
                height: parent.height - 260   // space for buttons
                model: results
                clip: true

                delegate: Rectangle {
                    width: listView.width
                    height: 80
                    radius: 12
                    color: "white"

                    Row {
                        anchors.centerIn: parent
                        spacing: 15

                        Text {
                            text: modelData.name
                            font.bold: true
                            width: 120
                        }

                        Text {
                            text: modelData.subject
                            width: 80
                        }

                        Text {
                            text: "Score: " + modelData.score
                            width: 90
                        }

                        Button {
                            text: "Delete"
                            background: Rectangle {
                                color: "#ff4d4d"
                                radius: 6
                            }

                            onClicked: {
                                DB.deleteResult(modelData.id)
                                results = DB.getAllResults()
                            }
                        }
                    }
                }
            }
        }

        // 📊 View Chart Button (above Go Home)
        Button {
            text: "View Chart"
            width: parent.width * 0.9
            height: 45

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: goHomeButton.top
            anchors.bottomMargin: 10

            background: Rectangle {
                color: "#333"
                radius: 20
            }

            contentItem: Text {
                text: "View Chart"
                color: "white"
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }

            onClicked: {
                stackView.push(Qt.resolvedUrl("ChartPage.qml"), {
                    stackView: stackView
                })
            }
        }

        // 🏠 Go Home Button (BOTTOM like Quiz Page)
        Button {
            id: goHomeButton

            text: "Go Home"
            width: parent.width * 0.9
            height: 45

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20

            background: Rectangle {
                color: "#555"
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
                stackView.pop(null)   //go to StudentPage
            }
        }
    }
}
