const db = require('../config/database')();

module.exports = function (app) {
	db.query(`SELECT * FROM globals`, (err, results) => {
		if (err) return next(`${err} at db.query (${__filename}:4:5)`);
		app.locals.site = results[0];
	});

	db.query(`SELECT * FROM menu ORDER BY position`, (err, results) => {
		if (err) return next(`${err} at db.query (${__filename}:9:5)`);
		app.locals.menus = results;		
	});

	app.locals.session = {

	}
};
