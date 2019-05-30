const db = require('../config/database')();

module.exports = function (app) {

//admin menu route
app.get('/admin/menu', (req, res, next) => {
    db.query(`SELECT * FROM menu ORDER BY position`, (err, menus) => {
        if (err) return next(`${err} at db.query (${__filename}:7:5)`);
        res.render('administration/admin-menu', { 'title': 'Menupunkter', 'content': 'Opret, slet og redigér', 'menus': menus});
    })
});

app.post('/admin/menu', (req, res, next) => {
    db.query('INSERT INTO menu (name, position, fk_category) VALUES (?, ?, ?)', [req.fields.name, req.fields.position, req.fields.pageUpdate || req.fields.custom], (err, result) => {
        if (err) return next(`${err} at db.query (${__filename}:14:5)`);
        res.status(200);
        res.redirect('/admin/menu');
    })
});

app.patch('/admin/menu', (req, res, next) => {
    db.query('UPDATE menu SET name = ?, position = ?, fk_category = ? WHERE id = ?', [req.fields.name, req.fields.position, req.fields.pageUpdate || req.fields.custom, req.fields.id], (err, result) => {
        if (err) return next(`${err} at db.query (${__filename}:22:5)`);
        res.status(200);
        res.end();
    })
});

app.delete('/admin/menu/:id', (req, res, next) => {
    db.query(`DELETE FROM menu WHERE id = ?`, [req.params.id], (err, results) => {
        if (err) return next(`${err} at db.query (${__filename}:30:5)`);
        res.status(200);
        res.end();
    })
});

}