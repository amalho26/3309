var express = require('express');
var app = express();
var database = require('../config/database');

app.get('/reports/view/', (req,res) => {//get report when user inputs case ID
    let CaseID = req.query.caseID;
    console.log(CaseID);
    let sql = `SELECT caseID, date, arrivalTime, timeOnScene, city FROM report
    WHERE caseID = ${CaseID}`;

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

app.post('/reports/add', (req, res) => {// add new report values into db
    
    let sql = `INSERT INTO report VALUES(${req.body.rCase}, ${req.body.rDate}, ${req.body.rArrivalTime}, ${req.body.rTimeOnScene}, ${req.body.rsin}, ${req.body.rcity})`;

    database.query(sql, [],(err, result) => {
        if (err) {
            
            res.status(400).json({
                message: err
                
            });
            console.log(err)
            return;
        }

        if (result.length) {res.json(result); console.log("works")}
        else res.json({});        
    });
});


module.exports = app;