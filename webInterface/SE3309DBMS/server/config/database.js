const mysql = require('mysql');

const con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "Asm51122.",
    database: "police"
});

module.exports = con;