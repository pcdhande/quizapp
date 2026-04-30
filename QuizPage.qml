import QtQuick 2.12
import QtQuick.Controls 2.12
import "Database.js" as DB

Page {
    property var stackView
    property string studentName
    property string subject
    property int currentIndex: 0
    property int score: 0

    // Question sets
    property var pythonQuestions: [
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

    property var cppQuestions: [
        { q: "C++ single line comment?", o: ["#", "//", "/* */", "--"], a: "//" },
        { q: "C++ input-output header?", o: ["stdio.h","iostream","conio.h","stdlib.h"], a: "iostream" }
    ]

    property var javaQuestions: [
        { q: "Java class keyword?", o: ["class","define","struct","object"], a: "class" }
    ]

    // final questions
    property var questions: []

    // Load based on subject
    Component.onCompleted: {
        if (subject === "Python") {
            questions = pythonQuestions
        } else if (subject === "C++") {
            questions = cppQuestions
        } else {
            questions = javaQuestions
        }
    }

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
