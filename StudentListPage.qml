import QtQuick 2.12
import QtQuick.Controls 2.12
import "Database.js" as DB

Page {
    property var stackView

    ListModel {
        id: resultModel
    }

    Rectangle {
        anchors.fill: parent

        //Gradient background
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#ff9966" }
            GradientStop { position: 1.0; color: "#ff5e62" }
        }

        Column {
            anchors.fill: parent
            anchors.margins: 15
            spacing: 10

            // Back Button 
            Button {
                text: "Back to Home"
                width: parent.width

                background: Rectangle {
                    radius: 10
                    color: "#333"
                }

                contentItem: Text {
                    text: parent.text
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                onClicked: {
                    stackView.clear()
                    stackView.push(Qt.resolvedUrl("StudentPage.qml"), {
                        stackView: stackView
                    })
                }
            }

            Text {
                text: "Student Results"
                font.pixelSize: 24
                font.bold: true
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                width: parent.width
            }

            //List
            ListView {
                id: listView
                width: parent.width
                height: parent.height - 100
                model: resultModel

                delegate: Rectangle {
                    width: parent.width
                    height: 80
                    radius: 12
                    color: "white"

                    Row {
                        anchors.centerIn: parent
                        spacing: 15

                        Text { text: name; font.bold: true }
                        Text { text: subject }
                        Text { text: "Score: " + score }

                        Button {
                            text: "Delete"

                            background: Rectangle {
                                radius: 8
                                color: "#ff4d4d"
                            }

                            contentItem: Text {
                                text: parent.text
                                color: "white"
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }

                            onClicked: {
                                DB.deleteResult(id)

                                // Refresh list
                                resultModel.clear()
                                var results = DB.getAllResults()

                                for (var i = 0; i < results.length; i++) {
                                    resultModel.append(results[i])
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    // Load data
    Component.onCompleted: {
        resultModel.clear()
        var results = DB.getAllResults()

        for (var i = 0; i < results.length; i++) {
            resultModel.append(results[i])
        }
    }
}
