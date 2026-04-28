import QtQuick 2.12
import QtQuick.Controls 2.12

ApplicationWindow {
    visible: true
    width: 420
    height: 720
    title: "Quiz App"

    property int currentIndex: 0
    property int score: 0

    property var questions: [
    {
        question: "1. Which keyword is used to define a function in Python?",
        options: ["func", "define", "def", "function"],
        answer: "def"
    },
    {
        question: "2. A Python file that contains functions and variables is called a?",
        options: ["Script", "Module", "Package", "Frame"],
        answer: "Module"
    },
    {
        question: "3. Which language is used for web apps?",
        options: ["Python", "C++", "JavaScript", "Swift"],
        answer: "JavaScript"
    }
]

    function checkAnswer(ans) {
        if (ans === questions[currentIndex].answer) {
            score++
        }

        if (currentIndex < questions.length - 1) {
            currentIndex++
        } else {
            currentIndex = questions.length
        }
    }
