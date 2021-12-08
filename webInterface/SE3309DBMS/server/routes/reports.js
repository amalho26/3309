var express = require('express');
var app = express();
var database = require('../config/database');

app.get('/reports/view/', (req,res) => {
    let CaseID = req.query.caseID;
    console.log(CaseID);
    let sql = `SELECT caseID, date, arrivalTime, timeOnScene, city FROM report
    WHERE caseID = ${CaseID}`;
    // let sql = `SELECT caseID, date, arrivalTime, timeOnScene, city FROM report
    // WHERE caseID = 29312`;
    //let sql = `SELECT caseID, date, arrivalTime, timeOnScene, city FROM report`;
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

app.post('/reports/add', (req, res) => {
    //caseID, date, arrivalTime, timeOnScene, officerSocialInsuranceNumber, City
    let date = req.body.rDate;
    let arrivalTime = req.body.rArrivalTime;
    let timeOnScene = req.body.rTimeOnScene;
    let officerSocialInsuranceNumber = req.body.rsin;
    let city = req.body.rcity;
    console.log(req.body.rCase)
    console.log(date)
    console.log(arrivalTime)
    console.log(timeOnScene)
    console.log(officerSocialInsuranceNumber)
    console.log(city)

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