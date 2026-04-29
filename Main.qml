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
    },
{
    question: "4. Which symbol is used for comments in Python?",
    options: ["//", "#", "/* */", "--"],
    answer: "#"
},
{
    question: "5. Which data type is used to store text in Python?",
    options: ["int", "float", "str", "bool"],
    answer: "str"
},
{
    question: "6. Which function is used to get input from user in Python?",
    options: ["input()", "scan()", "read()", "get()"],
    answer: "input()"
},
{
    question: "7. Which keyword is used to create a loop in Python?",
    options: ["for", "loop", "iterate", "repeat"],
    answer: "for"
},
{
    question: "8. What is the output type of len() function?",
    options: ["float", "string", "integer", "boolean"],
    answer: "integer"
},
{
    question: "9. Which of the following is a Python list?",
    options: ["(1,2,3)", "{1,2,3}", "[1,2,3]", "<1,2,3>"],
    answer: "[1,2,3]"
},
{
    question: "10. Which keyword is used to define a class in Python?",
    options: ["class", "object", "define", "struct"],
    answer: "class"
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
