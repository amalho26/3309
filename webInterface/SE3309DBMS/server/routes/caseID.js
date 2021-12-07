var express = require('express');
var app = express();
var database = require('../config/database');


app.get('/caseID', (req, res) => {
    let sql = `SELECT caseID FROM report`;

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