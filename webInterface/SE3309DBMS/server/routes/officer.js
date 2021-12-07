var express = require('express');
var app = express();
var database = require('../config/database');


app.get('/officerSIN', (req, res) => {
    const username = req.query.userName;
    let sql = `SELECT officerSIN FROM loginInfo
    WHERE ${username} = userName`;

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