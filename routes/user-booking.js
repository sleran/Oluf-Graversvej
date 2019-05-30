const db = require('../config/database')();
const moment = require('moment');
moment.locale('da');

const roleCheck = require('../middleware/role-check');

module.exports = function (app) {

    app.get('/booking-tid',[roleCheck.users, roleCheck.admins, roleCheck.superadmins, roleCheck.authors], (req, res, next) => {
        db.query(`SELECT reservations.id, slots.starts AS starts, slots.ends AS ends, reservations.date FROM reservations 
            INNER JOIN slots ON reservations.slot_fk = slots.id
            WHERE user_fk = ?`, [req.session.user], (err, reservations) => {
            if (err) return next(`${err} at db.query (${__filename}:7:9)`);
            res.render('user-booking-time', { 'reservations': reservations, 'moment': moment});
        })
    });

    app.post('/booking-tid',[roleCheck.users, roleCheck.admins, roleCheck.superadmins, roleCheck.authors], (req, res, next) => {
        try {		
			res.redirect(`/booking/${req.fields.date}`);
		} catch (err) {
			return next(`${err} in try block (${__filename}:49:9)`);
		}
    });

    app.get('/booking/:date',[roleCheck.users, roleCheck.admins, roleCheck.superadmins, roleCheck.authors], (req, res, next) => {
        db.query(`SELECT * FROM slots`, (err, slots) => {
            if (err) return next(`${err} at db.query (${__filename}:7:9)`);
            db.query(`SELECT * FROM reservations WHERE date = ?`, [req.params.date], (err, reservations) => {
                if (err) return next(`${err} at db.query (${__filename}:7:9)`);

                slots.forEach(slot => {
                    (reservations || []).forEach(reservation => {
                        if(slot.id === reservation.slot_fk && moment(req.params.date).format("YYYY-MM-DD") == moment(reservation.date).format("YYYY-MM-DD")) {
                            slot.reservation = reservation;
                        }
                    });
                });
                res.render('user-booking', { 'slots': slots });
            })
        })
    });

    app.post('/booking',[roleCheck.users, roleCheck.admins, roleCheck.superadmins, roleCheck.authors], (req, res, next) => {
		try {		
            console.log(req.fields);
            
			db.query('INSERT INTO reservations (user_fk, slot_fk, date) VALUES (?, ?, ?)', [req.session.user, req.fields.slot_fk, req.fields.date], (err, results) => {
				res.redirect(`/`);
			})
		} catch (err) {
			return next(`${err} in try block (${__filename}:49:9)`);
		}
    });
    
    app.delete('/booking-tid/reservation/:id',[roleCheck.users, roleCheck.admins, roleCheck.superadmins, roleCheck.authors], (req, res, next) => {
		try {		            
			db.query('DELETE FROM reservations WHERE id = ? AND user_fk = ?', [req.params.id, req.session.user], (err, results) => {
				res.end();
			})
		} catch (err) {
			return next(`${err} in try block (${__filename}:49:9)`);
		}
	});
    
};