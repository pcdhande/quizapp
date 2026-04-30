import QtQuick 2.12
import QtQuick.Controls 2.12
import "Database.js" as DB

Page {
    property var stackView

    Column {
        anchors.centerIn: parent
        spacing: 15
        width: parent.width * 0.85

        Text {
            text: "Student Details"
            font.pixelSize: 22
        }

        TextField {
            id: nameField
            placeholderText: "Student Name"
        }

        ComboBox {
            id: rollBox
            model: ["1","2","3","4","5"]
        }

        ComboBox {
            id: divisionBox
            model: ["A","B","C"]
        }

        ComboBox {
            id: subjectBox
            model: ["Python","C++","Java"]
        }

        Button {
            text: "Start Quiz"

            onClicked: {
                if (nameField.text === "") {
                    console.log("Enter name first")
                    return
                }

                DB.saveStudent({
                    name: nameField.text,
                    roll: rollBox.currentText,
                    division: divisionBox.currentText,
                    subject: subjectBox.currentText
                })

                stackView.push(Qt.resolvedUrl("QuizPage.qml"), {
                    stackView: stackView,
                    studentName: nameField.text,
                    subject: subjectBox.currentText
                })
            }
        }
    }
}
