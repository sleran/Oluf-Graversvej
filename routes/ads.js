
const db = require('../config/database')();

module.exports = function (app) {

    app.get('/annoncer', (req, res, next) => {
        db.query(`SELECT * FROM ads`, (err, ads) => {
            if (err) return next(`${err} at db.query (${__filename}:7:9)`);
            res.render('ads', { 'ads': ads });
        })
    });
    
};