const db = require('../config/database')();
const fs = require('fs');

const roleCheck = require('../middleware/role-check');

module.exports = function (app) {

//admin articles route
	app.get('/admin/annoncer',[roleCheck.admins, roleCheck.superadmins], (req, res, next) => {
		db.query(`SELECT id, name, persons, price, image FROM ads`, (err, ads) => {
			if (err) return next(`${err} at db.query (${__filename}:8:9)`);
            res.render('administration/admin-ads', { 'title': 'annoncer', 'content': 'Opret, slet og redigér', 'ads': ads});
        })
	});

	app.get('/admin/rediger-annonce/:id', (req, res, next) => {
		db.query(`SELECT id, name, persons, price, image FROM ads
		WHERE id = ?`, [req.params.id], (err, ads) => {
			if (err) return next(`${err} at db.query (${__filename}:16:9)`);
            res.render('administration/admin-ads-edit', { 'title': ads[0].name, 'content': 'hej med dig', 'ads': ads[0]});
        })
	});
	app.post('/admin/annoncer', (req, res, next) => {
		let timestamp = Date.now();
		let renamedFilename = `${timestamp}_${req.files.image.name}`

		db.query('INSERT INTO ads (name, persons, price, image) VALUES (?, ?, ?, ?)', [req.fields.name, req.fields.persons, req.fields.price, renamedFilename], (err, result) => {
			if (err) {
				return next(`${err} at db.query (${__filename}:24:9)`);
			} else if (!req.files || !req.files.image) {
				return next(new Error('Der var ingen fil med formularen'));
			}
			fs.readFile(req.files.image.path, (err, data) => {
				if (err) {
					return next(new Error('Den midlertidige fil kunne ikke læses'));
				}
				
				fs.writeFile(`./public/media/${renamedFilename}`, data, (err) => {
					if (err) {
						return next(new Error('Filen kunne ikke gemmes'));
					}
					res.redirect('/admin/annoncer');
				});
			});
			
		})
	});

	app.patch('/admin/annoncer', (req, res, next) => {
		db.query('UPDATE ads SET name = ?, persons = ?, price = ? WHERE id = ?', [req.fields.name, req.fields.persons, req.fields.price, req.fields.id], (err, result) => {
			if (err) return next(`${err} at db.query (${__filename}:47:9)`);
			res.status(204);
			res.end();
		})
	});

	app.patch('/admin/annoncer/image/:id', (req, res, next) => {
		if (!req.files || !req.files.photo) {
			return next(`File not found (${__filename}:55:9)`);
		}
		const file = req.files.photo;
		const renamedFilename = `${Date.now()}_${file.name}`;
		fs.readFile(file.path, (err, data) => {
			if (err) return next(`${err} at fs.readFile (${__filename}:60:9)`);
			fs.writeFile(`./public/media/${renamedFilename}`, data, err => {
				db.query('SELECT image FROM products WHERE id = ?', [req.params.id], (err, results) => {
					if (err) return next(`${err} at db.query (${__filename}:63:17)`);
						db.query('UPDATE products SET image = ? WHERE id = ?', [renamedFilename, req.params.id], (err, result) => {
							if (err) return next(`${err} at db.query (${__filename}:65:25)`);
							res.status(200);
							res.json({
							photo: renamedFilename
							});
						});
				
				});
			});
		});
	});

	app.delete('/admin/annoncer/:id', (req, res, next) => {
		db.query(`DELETE FROM ads WHERE id = ?`, [req.params.id], (err, results) => {
			if (err) return next(`${err} at db.query (${__filename}:79:9)`);
			res.status(200);
			res.end();
		})
	});
}