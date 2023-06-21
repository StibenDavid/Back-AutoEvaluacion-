const express = require('express')
const cors = require('cors')
const mysql = require('mysql')
const bodyParser = require('body-parser')
const figlet = require('figlet')
const asciify = require('asciify-image')
const app = express()
app.use(cors())
app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json({ limit: '10mb' }))

const credentials = {
	host: 'localhost',
	user: 'root',
	password: '',
	database: 'autoevaluacion'
}

app.get('/', (req, res) => {
	res.send('Hola Mike, soy el servidor!')
})

app.post('/api/login', (req, res) => {
	const { username, password } = req.body
	const values = [username, password]
	console.log(values);
	var connection = mysql.createConnection(credentials)
	connection.query("SELECT * FROM login WHERE lg_mail = ? AND lg_password = ?", values, (err, result) => {
		if (err) {
			console.log(err);
			res.status(500).send(err)
		} else {
			if (result.length > 0) {
				res.status(200).send({
					"id": result[0].id,
					"user": result[0].user,
					"username": result[0].username,
					"picture": result[0].picture,
					"isAuth": true
				})
			} else {
				res.status(400).send('Usuario no existe')
			}
		}
	})
	connection.end()
})

app.get('/api/usuarios1', (req, res) => {
	var connection = mysql.createConnection(credentials)
	connection.query('SELECT * FROM usuarios', (err, rows) => {
		if (err) {
			res.status(500).send(err)
		} else {
			res.status(200).send(rows)
		}
	})
})

app.get('/api/periodos', (req, res) => {
	var connection = mysql.createConnection(credentials)
	connection.query('SELECT * FROM periodo', (err, rows) => {
		if (err) {
			res.status(500).send(err)
		} else {
			res.status(200).send(rows)
		}
	})
})

app.get('api/labores',(req,res)=>{
	var connection = mysql.createConnection(credentials)
	connection.query('SELECT * FROM labor', (err, rows) => {
		if (err) {
			res.status(500).send(err)
		} else {
			res.status(200).send(rows)
		}
	})
})

app.post('/api/labores/eliminar', (req, res) => {
	const { id } = req.body
	var connection = mysql.createConnection(credentials)
	connection.query('DELETE FROM labor WHERE per_id = ?', id, (err, result) => {
		if (err) {
			res.status(500).send(err)
		} else {
			res.status(200).send({ "status": "success", "message": "Labor Eliminado" })
		}
	})
	connection.end()
})

app.post('/api/labores/guardar', (req, res) => {
    const { labor_nombre, labor_horas} = req.body;
    console.log(req.body);
    const params = [labor_nombre, labor_horas];
    var connection = mysql.createConnection(credentials);
    connection.query('INSERT INTO labor(labor_nombre, labor_horas) VALUES ?', [[params]], (err, result) => {
        if (err) {
            res.status(500).send(err);
        } else {
            res.status(200).send({ "status": "success", "message": "Labor creada" });
        }
        connection.end();
    });
});

app.post('/api/labores/editar', (req, res) => {
	const { labor_id,labor_nombre, labor_horas } = req.body
	const params = [ labor_nombre, labor_horas]
	var connection = mysql.createConnection(credentials)
	connection.query('UPDATE labor SET labor_nombre=?, labor_horas WHERE labor_id = ?', params, (err, result) => {
		if (err) {
			res.status(500).send(err)
		} else {
			console.log("Modifican ",req.body);
			console.log("Modifican ",result);
			res.status(200).send({ "status": "success", "message": "Labor editado" })
		}
	})
	connection.end()
})
	

app.get('/api/autoevaluaciones', (req, res) => {
	var connection = mysql.createConnection(credentials)
	connection.query('SELECT * FROM evaluacion', (err, rows) => {
		if (err) {
			res.status(500).send(err)
		} else {
			res.status(200).send(rows)
		}
	})
})

app.get('/api/usuarios', (req, res) => {
	var connection = mysql.createConnection(credentials)
	connection.query('SELECT usr_identificacion, usr_nombre  FROM usuario', (err, rows) => {
		if (err) {
			res.status(500).send(err)
		} else {
			res.status(200).send(rows)
		}
	})
})

app.get('/api/periodos2', (req, res) => {
	var connection = mysql.createConnection(credentials)
	connection.query('SELECT per_id, per_nombre  FROM periodo', (err, rows) => {
		if (err) {
			res.status(500).send(err)
		} else {
			res.status(200).send(rows)
		}
	})
})

app.get('/api/logins', (req, res) => {
	var connection = mysql.createConnection(credentials)
	connection.query('SELECT * FROM login', (err, rows) => {
		if (err) {
			res.status(500).send(err)
		} else {
			res.status(200).send(rows)
		}
	})
})

app.post('/api/eliminar', (req, res) => {
	const { id } = req.body
	var connection = mysql.createConnection(credentials)
	connection.query('DELETE FROM usuarios WHERE id = ?', id, (err, result) => {
		if (err) {
			res.status(500).send(err)
		} else {
			res.status(200).send({ "status": "success", "message": "Usuario Eliminado" })
		}
	})
	connection.end()
})

app.post('/api/periodos/eliminar', (req, res) => {
	const { id } = req.body
	var connection = mysql.createConnection(credentials)
	connection.query('DELETE FROM periodo WHERE per_id = ?', id, (err, result) => {
		if (err) {
			res.status(500).send(err)
		} else {
			res.status(200).send({ "status": "success", "message": "Periodo Eliminado" })
		}
	})
	connection.end()
})

app.post('/api/autoevaluaciones/eliminar', (req, res) => {
	const { id } = req.body
	var connection = mysql.createConnection(credentials)
	connection.query('DELETE FROM evaluacion WHERE eva_id = ?', id, (err, result) => {
		if (err) {
			res.status(500).send(err)
		} else {
			res.status(200).send({ "status": "success", "message": "Periodo Eliminado" })
		}
	})
	connection.end()
})

app.post('/api/guardar', (req, res) => {
	const { avatar, nombre, planeta } = req.body
	const params = [[avatar, nombre, planeta]]
	var connection = mysql.createConnection(credentials)
	connection.query('INSERT INTO usuarios (avatar, nombre, planeta) VALUES ?', [params], (err, result) => {
		if (err) {
			res.status(500).send(err)
		} else {
			res.status(200).send({ "status": "success", "message": "Usuario creado" })
		}
	})
	connection.end()
})

app.post('/api/periodos/guardar', (req, res) => {
    const { per_nombre, per_fechainicio, per_fechafin, per_anno, per_semestre } = req.body;
    console.log(req.body);
    const params = [per_nombre, per_fechainicio, per_fechafin, per_anno, per_semestre];
    var connection = mysql.createConnection(credentials);
    connection.query('INSERT INTO periodo (per_nombre, per_fechainicio, per_fechafin, per_anno, per_semestre) VALUES ?', [[params]], (err, result) => {
        if (err) {
            res.status(500).send(err);
        } else {
            res.status(200).send({ "status": "success", "message": "Periodo creado" });
        }
        connection.end();
    });
});

app.post('/api/autoevaluaciones/guardar', (req, res) => {
    const { rol_id, usr_identificacion, per_id, lab_id, eva_estado, eva_puntaje, eva_resultado } = req.body;
    console.log(req.body);
    const params = [rol_id, usr_identificacion, per_id, lab_id, eva_estado, eva_puntaje, eva_resultado];
    var connection = mysql.createConnection(credentials);
    connection.query('INSERT INTO evaluacion (rol_id, usr_identificacion, per_id, lab_id, eva_estado, eva_puntaje, eva_resultado) VALUES ?', [[params]], (err, result) => {
        if (err) {
            res.status(500).send(err);
        } else {
            res.status(200).send({ "status": "success", "message": "Periodo creado" });
        }
        connection.end();
    });
});

app.post('/api/editar', (req, res) => {
	const { id, avatar, nombre, planeta } = req.body
	const params = [avatar, nombre, planeta, id]
	var connection = mysql.createConnection(credentials)
	connection.query('UPDATE usuarios set avatar = ?, nombre = ?, planeta = ? WHERE id = ?', params, (err, result) => {
		if (err) {
			res.status(500).send(err)
		} else {
			res.status(200).send({ "status": "success", "message": "Usuario editado" })
		}
	})
	connection.end()
})

app.post('/api/periodos/editar', (req, res) => {
	const { per_id, per_nombre, per_fechainicio, per_fechafin, per_anno,  per_semestre} = req.body
	const params = [ per_nombre, per_fechainicio, per_fechafin, per_anno,  per_semestre, per_id]
	var connection = mysql.createConnection(credentials)
	connection.query('UPDATE periodo SET per_nombre=?, per_fechainicio=?, per_fechafin=?,per_anno=?, per_semestre=? WHERE per_id = ?', params, (err, result) => {
		if (err) {
			res.status(500).send(err)
		} else {
			console.log("Modifican ",req.body);
			console.log("Modifican ",result);
			res.status(200).send({ "status": "success", "message": "Periodo editado" })
		}
	})
	connection.end()
})

app.post('/api/autoevaluaciones/editar', (req, res) => {
	const { id, rol_id, usr_identificacion, per_id, lab_id, eva_estado, eva_puntaje, eva_resultado} = req.body
	console.log(req.body);
	const params = [ rol_id, usr_identificacion, per_id, lab_id, eva_estado, eva_puntaje, eva_resultado, id]
	var connection = mysql.createConnection(credentials)
	connection.query('UPDATE evaluacion set rol_id=?, usr_identificacion=?, per_id=?, lab_id=?, eva_estado=?, eva_puntaje=?, eva_resultado=? WHERE eva_id = ?', params, (err, result) => {
		if (err) {
			res.status(500).send(err)
		} else {
			res.status(200).send({ "status": "success", "message": "Periodo editado" })
		}
	})
	connection.end()
})

app.listen(4000, async () => {
	console.log(figlet.textSync('Server v. 1.0.0'))
})