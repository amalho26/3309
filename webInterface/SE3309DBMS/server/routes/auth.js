var express = require('express');
var app = express();
var database = require('../config/database');
var authValidations = require('../validations/auth');

app.post('/authenticate', (req, res) => {

    let requestBody = getCredentialsFromHeaders(req);

    const { error } = authValidations(requestBody)

    if (error) {
        res.json({
            id : "",
            message: error.details[0].message
        })
    } else {
        let sql = `SELECT id FROM users WHERE name = '${requestBody.name}' AND stationNo = '${requestBody.stationNo}'`;

        database.query(sql, (err, result) => {
            if (err) {
                res.status(400).send(err);
                return;
            }

            if (result.length) res.json(result[0]);
            else res.json({
                id : "",
            });

        });
    }

});


function getCredentialsFromHeaders(req) {

 
    let authorization = req.header('authorization');
    let authData = authorization.split(" ");

    let token = Buffer.from(`${authData[1]}`, 'base64').toString('utf8');

    let credentials = token.split(":");

    return {
        user: credentials[0],
        station: credentials[1]
    }
}

module.exports = app;