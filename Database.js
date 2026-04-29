.pragma library

var students = []
var results = []

function saveStudent(student) {
    console.log("Saving student:", student.name)
    students.push(student)
}

function saveResult(result) {
    results.push(result)
}

function getResults() {
    return results
}
