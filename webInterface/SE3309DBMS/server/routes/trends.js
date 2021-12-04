var express = require('express');
var app = express();
var database = require('../config/database');


app.get('/trends/crime/', (req, res) => {
    let sql = `SELECT city FROM area`;

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

app.get('/trends/crime/1', (req, res) => {
    let sql = `SELECT area.${city} As City, consequence.crimeTypeName AS Crime, COUNT(consequence.crimeTypeName) AS Occurance
                FROM consequence INNER JOIN report ON consequence.caseID = report.caseID
                INNER JOIN area ON report.city = area.city
                WHERE area.city = 'ajax'
                GROUP BY area.city, consequence.crimeTypeName
                ORDER BY Occurance DESC
                LIMIT 1`;

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