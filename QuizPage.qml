import QtQuick 2.12
import QtQuick.Controls 2.12
import "Database.js" as DB

Page {
    property var stackView
    property string studentName
    property int currentIndex: 0
    property int score: 0

    property var questions: [
        { q: "Python function keyword?", o: ["func","def","define","fun"], a: "def" },
        { q: "Python file type?", o: ["Script","Module","App","Frame"], a: "Module" },
        { q: "Web language?", o: ["Python","C++","JS","Swift"], a: "JS" },
        { q: "Which symbol is used for comments in Python?", o: ["//", "#", "/* */", "--"], a: "#" },
        { q: "Which data type is used to store text in Python?", o: ["int", "float", "str", "bool"], a: "str" },
        { q: "Which function is used to take input from user?", o: ["input()", "scan()", "read()", "get()"], a: "input()" },
        { q: "Which keyword is used for loop in Python?", o: ["loop", "for", "repeat", "iterate"], a: "for" },
        { q: "What is the output type of len() function?", o: ["float", "string", "integer", "boolean"], a: "integer" },
        { q: "Which of the following is a Python list?", o: ["(1,2,3)", "{1,2,3}", "[1,2,3]", "<1,2,3>"], a: "[1,2,3]" },
        { q: "Which keyword is used to define a class in Python?", o: ["class", "object", "define", "struct"], a: "class" }

    ]

    function next(ans) {
        if (ans === questions[currentIndex].a)
            score++

        currentIndex++

        if (currentIndex >= questions.length) {
            DB.saveResult({ name: studentName, score: score })

            stackView.replace(Qt.resolvedUrl("ResultPage.qml"), {
                stackView: stackView,
                score: score,
                total: questions.length,
                name: studentName
            })
        }
    }

    Column {
        anchors.centerIn: parent
        spacing: 20
        width: parent.width * 0.9

        Text {
            text: questions[currentIndex] ? questions[currentIndex].q : ""
            wrapMode: Text.WordWrap
        }

        Repeater {
            model: questions[currentIndex] ? questions[currentIndex].o : []

            Button {
                text: modelData
                width: parent.width
                onClicked: next(modelData)
            }
        }
    }
}
