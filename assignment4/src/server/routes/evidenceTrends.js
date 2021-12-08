var express = require('express');
var app = express();
var database = require('../config/database');


app.get('/trends/evidence', (req, res) => {//get all stations in database
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

app.get('/trends/evidence/station', (req, res) => {//complex functionality that get evidence trends when user gives station and time period

    const station = req.query.inputStation
    const start =  req.query.startTime
    const end = req.query.endTime
    let sql = `SELECT 
    e.evidenceType,
    COUNT(e.evidenceType) AS count
    FROM evidence_log e
    JOIN officer o ON e.officerSIN = o.officerSocialInsuranceNumber
    JOIN station s ON o.stationNo = s.stationNo
    WHERE s.stationNo = ${station} AND e.date BETWEEN ${start} AND ${end}
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