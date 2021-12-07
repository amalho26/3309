var express = require('express');
var app = express();
var database = require('../config/database');
var authValidations = require('../validations/auth');


app.post('/authenticate', (req, res) => {

    
    let requestBody = getCredentialsFromHeaders(req);

    // Validation our authentications using Joi npm library
    const { error } = authValidations(requestBody)

    if (error) {
        res.json({
            id : "",
            message: error.details[0].message
        })
    } else {
        let sql = `SELECT loginID FROM loginInfo WHERE userName = '${requestBody.email}' AND pwd = '${requestBody.password}'`;

        database.query(sql, (err, result) => {
            if (err) {
                res.status(400).send(err);
                return;
            }

            if (result.length) res.json(result[0]);
            else res.json({
                id : "",
                message : "Wrong username or password!"
            });

        });
    }

});

// Get users credential from headers
function getCredentialsFromHeaders(req) {

    // Get authorization from headers
    let authorization = req.header('authorization');

    // Convert authorization to array
    let authData = authorization.split(" ");

    // Convert to utf-8
    let token = Buffer.from(`${authData[1]}`, 'base64').toString('utf8');

    // Convert token to array
    let credentials = token.split(":");

    return {
        email: credentials[0],
        password : credentials[1]
    }
}

module.exports = app;