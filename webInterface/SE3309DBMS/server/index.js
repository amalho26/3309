var express = require('express');
var app = express();
var cors = require('cors');
var database = require('./config/database');
var port = process.env.PORT || 3005;


database.connect((err) => {
    if (err) throw err;
});

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({
    extended: true
}));

app.use('/', [
    require('./routes/trends'),
    require('./routes/auth')
]);

// http://localhost:3005/tweets - GET, POST
// http://localhost:3005/tweets/user/:id - GET
// http://localhost:3005/tweets/:id - DELETE
// http://localhost:3005/authenticate - POST for login session



app.listen(port, () => {
    console.log(`running on port ${port}`);
});