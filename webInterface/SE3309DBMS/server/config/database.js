const mysql = require('mysql');

const con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "policeDBMS21",
    database: "police"
});

module.exports = con;