var express = require('express');
var app = express();
var database = require('../config/database');


app.get('/trends/evidence', (req, res) => {
    let sql = `SELECT stationNo FROM station`;

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

app.get('/trends/evidence/station', (req, res) => {

    const station = req.query.inputStation
    let sql = `SELECT 
    e.evidenceType,
    COUNT(e.evidenceType) AS count
    FROM evidence_log e
    JOIN officer o ON e.officerSIN = o.officerSocialInsuranceNumber
    JOIN station s ON o.stationNo = s.stationNo
    WHERE s.stationNo = ${station} AND e.date BETWEEN '2019-01-01' AND '2021-01-01'
    GROUP BY e.evidenceType`;

    database.query(sql, [],(err, result) => {
        if (err) {
            res.status(400).json({
                message: err
            });
            return;
        }

        if (result.length) res.json(result);        
    });
   
});

module.exports = app;