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
    require('./routes/auth'),
    require('./routes/evidenceTrends'),
    require('./routes/reports'),
    require('./routes/witnessStatements')
]);

app.listen(port, () => {
    console.log(`running on port ${port}`);
});