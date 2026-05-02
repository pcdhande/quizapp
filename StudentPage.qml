import QtQuick 2.12
import QtQuick.Controls 2.12

Page {
    property var stackView

    // Always clear when page becomes active
    StackView.onActivated: {
        clearForm()
    }

    function clearForm() {
        nameField.text = ""
        rollBox.currentIndex = 0
        divisionBox.currentIndex = 0
        subjectBox.currentIndex = 0
    }

    Rectangle {
        anchors.fill: parent

        //Gradient background
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#6a11cb" }
            GradientStop { position: 1.0; color: "#2575fc" }
        }

        // Center Card
        Rectangle {
            width: parent.width * 0.85
            radius: 15
            color: "white"
            anchors.centerIn: parent

            Column {
                anchors.centerIn: parent
                spacing: 15
                width: parent.width * 0.9

                Text {
                    text: "Student Details"
                    font.pixelSize: 26
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    width: parent.width
                }

                TextField {
                    id: nameField
                    placeholderText: "Student Name"
                    width: parent.width
                }

                ComboBox {
                    id: rollBox
                    model: ["1","2","3","4","5"]
                    width: parent.width
                }

                ComboBox {
                    id: divisionBox
                    model: ["A","B","C"]
                    width: parent.width
                }

                ComboBox {
                    id: subjectBox
                    model: ["Python","C++","Java"]
                    width: parent.width
                }

                Button {
                    text: "Start Quiz"
                    width: parent.width

                    // Styled button
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
                        if (nameField.text === "") {
                            console.log("Enter name first")
                            return
                        }

                        stackView.push(Qt.resolvedUrl("QuizPage.qml"), {
                            stackView: stackView,
                            studentName: nameField.text,
                            subject: subjectBox.currentText
                        })
                    }
                }
            }
        }
    }
}
