.pragma library
.import QtQuick.LocalStorage 2.0 as LS

function getDB() {
    return LS.LocalStorage.openDatabaseSync("QuizDB", "1.0", "Quiz Database", 1000000)
}

// Initialize table
function initDB() {
    var db = getDB()
    db.transaction(function(tx) {
        tx.executeSql(
            "CREATE TABLE IF NOT EXISTS students (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, subject TEXT, score INTEGER)"
        )
    })
}

// Save result (with validation)
function saveResult(name, subject, score) {
    //  prevent bad data
    if (!name || !subject || score === undefined || score <= 0) {
        console.log("Invalid data, not saving:", name, subject, score)
        return
    }

    var db = getDB()
    db.transaction(function(tx) {
        tx.executeSql(
            "INSERT INTO students (name, subject, score) VALUES (?, ?, ?)",
            [name, subject, score]
        )
    })

    console.log("Saved:", name, subject, score)
}

// Get all valid results only
function getAllResults() {
    var db = getDB()
    var results = []

    db.transaction(function(tx) {
        // filter zero scores at DB level
        var rs = tx.executeSql(
            "SELECT * FROM students WHERE score > 0 ORDER BY score DESC"
        )

        for (var i = 0; i < rs.rows.length; i++) {
            results.push(rs.rows.item(i))
        }
    })

    return results
}

// clear database (use once)
function clearAll() {
    var db = getDB()
    db.transaction(function(tx) {
        tx.executeSql("DELETE FROM students")
    })
    console.log("Database cleared")
}
function deleteResult(id) {
    var db = getDB()
    db.transaction(function(tx) {
        tx.executeSql(
            "DELETE FROM students WHERE id = ?",
            [id]
        )
    })
    console.log("Deleted ID:", id)
}
