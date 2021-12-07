var express = require('express');
var app = express();
var database = require('../config/database');


app.get('/evidenceLog', (req, res) => {
    let sql = `SELECT * FROM evidenceLog`;

    database.query(sql, [],(err, result) => {
        if (err) {
            res.status(400).json({
                message: err
            });
            return;
        }

        if (result.length) res.json(result);
        else res.json({});        
    });
});
app.post('/evidenceLog/addEvidence/', (req, res) => { //adding new 
    let sql = 'INSERT INTO evidence_log VALUES(?, ?, ?)'
});
app.put('/evidenceLog/updateEvidence/', (req, res)=> {
    let sql = 'UPDATE INTO evidence_log VALUES (?, ?, ?)'
});
app.get('/evidenceLog/ET/', (req, res) => {
    let sql = 'SELECT DISTINCT evidenceType FROM evidence_log'
    database.query(sql, [],(err, result) => {
        if (err) {
            res.status(400).json({
                message: err
            });
            return;
        }

        if (result.length) res.json(result);
        else res.json({});        
    });
});
app.get('/evidenceLog/LT/', (req, res) => {
    let sql = 'SELECT DISTINCT logType FROM evidence_log'
    database.query(sql, [],(err, result) => {
        if (err) {
            res.status(400).json({
                message: err
            });
            return;
        }

        if (result.length) res.json(result);
        else res.json({});        
    });
});

module.exports = app;