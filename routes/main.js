
const db = require('../config/database')();

module.exports = function (app) {

    app.get('/', (req, res, next) => {
        res.render('main');
    });
    
};