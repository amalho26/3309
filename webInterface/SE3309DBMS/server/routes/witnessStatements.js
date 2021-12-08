var express = require('express');
var app = express();
var database = require('../config/database');


app.delete('/witnessStatements/drop', (req,res) => {
    let sql = `
    DROP VIEW criminalWitnessStatements;`
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
})

//function to create the view 
app.post('/witnessStatements/create/', (req,res) => {
    let fname = req.body.fName;
    let lname = req.body.lName;
    console.log(fname);
    console.log(lname);
    let sql = `CREATE VIEW criminalWitnessStatements
    AS SELECT COUNT(w.socialInsuranceNumber) AS witnessOccurences, p.fName, p.lName
    FROM witness_statement w, people p, criminal c
    WHERE p.fName = ${fname} AND p.lname = ${lname}
    AND c.criminalSocialInsuranceNumber = p.socialInsuranceNumber
    AND w.socialInsuranceNumber = c.criminalSocialInsuranceNumber;`;

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

//function to view the view 
app.get('/witnessStatements/view/', (req,res) => {

    let sql = `SELECT * FROM criminalWitnessStatements`;

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