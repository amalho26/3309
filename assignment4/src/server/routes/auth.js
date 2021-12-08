var express = require('express');
var app = express();
var database = require('../config/database');
var authValidations = require('../validations/auth');


//get name from userId stored in cookies
app.get('/authenticate/name', (req, res) => {
    const id = req.query.id
    let sql = `SELECT fname, lname FROM loginInfo WHERE loginId = ${id}`;

    database.query(sql, [],(err, result) => {
        if (err) {
            res.status(400).json({
                message: err
            });
            return;
        }

        if (result.length){
            res.json(result);
            console.log(result)
        }
        else res.json({});        
    });
});

app.get('/authenticate/sin', (req, res) => {//get sin of officers from userId set in cookies
    const id = req.query.id
    let sql = `SELECT loginOfficerID FROM loginInfo WHERE loginId = ${id}`;

    database.query(sql, [],(err, result) => {
        if (err) {
            res.status(400).json({
                message: err
            });
            return;
        }

        if (result.length){
            res.json(result);
            console.log(result)
        }
        else res.json({});        
    });
});

app.post('/authenticate', (req, res) => {//authenticate user
    let requestBody = getCredentialsFromHeaders(req);
    //Validate authentications 
    const { error } = authValidations(requestBody)

    if (error) {
        res.json({
            id : "",
            message: error.details[0].message
        })
    } else {//checks to see if email/password match in database
        let sql = `SELECT loginID FROM loginInfo WHERE userName = '${requestBody.email}' AND pwd = '${requestBody.password}'`;

        database.query(sql, (err, result) => {
            if (err) {
                res.status(400).send(err);
                return;
            }

            if (result.length){
                res.json(result[0]);
            } 
            else res.json({
                id : "",
                message : "Wrong username or password!"
            });

        });
    }

});

//Get users credential from headers
function getCredentialsFromHeaders(req) {

    //Get authorization from headers
    let authorization = req.header('authorization');

    //Convert authorization to array
    let authData = authorization.split(" ");
    

    //Convert to utf-8
    let token = Buffer.from(`${authData[1]}`, 'base64').toString('utf8');
    //Convert token to array
    let credentials = token.split(":");
   
    return {
        email: credentials[0],
        password : credentials[1]
    }
}

module.exports = app;