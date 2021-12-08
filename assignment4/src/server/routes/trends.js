var express = require('express');
var app = express();
var database = require('../config/database');


app.get('/trends/crime/', (req, res) => {//get all cities from db
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

app.get('/trends/crime/city', (req, res) => {//get crime trends depending on what city the user selected (complex functionality)
    const city = req.query.inputCity
    console.log(city)
    let sql = `SELECT consequence.crimeTypeName AS Crime, COUNT(consequence.crimeTypeName) AS Occurance
                FROM consequence INNER JOIN report ON consequence.caseID = report.caseID
                INNER JOIN area ON report.city = area.city
                WHERE area.city = ${city}
                GROUP BY area.city, consequence.crimeTypeName
                ORDER BY Occurance DESC;`;

    database.query(sql, [],(err, result) => {
        if (err) {
            
            res.status(400).json({
                message: err
                
            });
            console.log(err)
            return;
        }

        if (result.length) res.json(result);
        else res.json({});        
    });
});


module.exports = app;