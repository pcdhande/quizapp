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
        { q: "C++ header for input-output?", o: ["stdio.h","iostream","conio.h","stdlib.h"], a: "iostream" },
        { q: "Which symbol is used to end a statement in C++?", o: [";", ":", ".", ","], a: ";" },
        { q: "Which keyword is used to define a class in C++?", o: ["class", "struct", "object", "define"], a: "class" },
        { q: "Which function is used to display output in C++?", o: ["printf()", "cout", "echo", "print()"], a: "cout" },
        { q: "Which operator is used for input in C++?", o: [">>", "<<", "==", "="], a: ">>" },
        { q: "Which data type is used for decimal numbers in C++?", o: ["int", "float", "char", "bool"], a: "float" },
        { q: "Which loop is used when number of iterations is known?", o: ["for", "while", "do-while", "loop"], a: "for" },
        { q: "Which keyword is used to return a value from a function?", o: ["return", "exit", "break", "yield"], a: "return" },
        { q: "Which header file is required for using cout and cin?", o: ["iostream", "stdio.h", "math.h", "string.h"], a: "iostream" }
    ]

    property var javaQuestions: [
        { q: "Java class keyword?", o: ["class","define","struct","object"], a: "class" },
        { q: "Which keyword is used to define a class in Java?", o: ["class", "struct", "define", "object"], a: "class" },
        { q: "Which method is the entry point of a Java program?", o: ["start()", "main()", "run()", "init()"], a: "main()" },
        { q: "Which keyword is used to inherit a class in Java?", o: ["extends", "implements", "inherits", "super"], a: "extends" },
        { q: "Which package is imported by default in Java?", o: ["java.util", "java.lang", "java.io", "java.net"], a: "java.lang" },
        { q: "Which data type is used to store whole numbers?", o: ["float", "double", "int", "char"], a: "int" },
        { q: "Which symbol is used to end a statement in Java?", o: [";", ":", ".", ","], a: ";" },
        { q: "Which keyword is used to create an object?", o: ["new", "create", "object", "make"], a: "new" },
        { q: "Which loop is guaranteed to execute at least once?", o: ["for", "while", "do-while", "foreach"], a: "do-while" },
        { q: "Which keyword is used to stop a loop?", o: ["stop", "exit", "break", "end"], a: "break" }
    ]

    property var questions: []

    Component.onCompleted: {
        if (subject === "Python")
            questions = pythonQuestions
        else if (subject === "C++")
            questions = cppQuestions
        else
            questions = javaQuestions
    }

    function next(ans) {
        if (ans === questions[currentIndex].a)
            score++

        currentIndex++

        if (currentIndex >= questions.length) {
            DB.saveResult(studentName, subject, score)

            stackView.replace(Qt.resolvedUrl("ResultPage.qml"), {
                stackView: stackView,
                score: score,
                total: questions.length,
                name: studentName
            })
        }
    }

    Rectangle {
        anchors.fill: parent

        // Gradient background
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#ff512f" }
            GradientStop { position: 1.0; color: "#dd2476" }
        }

        Column {
            anchors.centerIn: parent
            spacing: 20
            width: parent.width * 0.9

            // Question Card
            Rectangle {
                width: parent.width
                radius: 15
                color: "white"
                height: 120

                Text {
                    anchors.centerIn: parent
                    text: questions[currentIndex] ? questions[currentIndex].q : ""
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.AlignHCenter
                    width: parent.width * 0.9
                    font.pixelSize: 18
                    color: "#333"
                }
            }

            //  Options
            Repeater {
                model: questions[currentIndex] ? questions[currentIndex].o : []

                Button {
                    width: parent.width
                    height: 45

                    background: Rectangle {
                        radius: 10
                        color: "#ffffff"
                        border.color: "#ccc"
                    }

                    contentItem: Text {
                        text: modelData
                        color: "#333"
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }

                    onClicked: next(modelData)
                }
            }

            // Progress Text
            Text {
                text: "Question " + (currentIndex + 1) + " / " + questions.length
                color: "white"
                font.pixelSize: 16
                horizontalAlignment: Text.AlignHCenter
                width: parent.width
            }
        }
    }
}
