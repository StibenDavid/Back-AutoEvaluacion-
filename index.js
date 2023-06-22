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
	connection.query("SELECT usuario.usr_nombre, usuario.usr_apellido, rol.rol_descripcion, login.usr_identificacion, login.rol_id, lg_mail FROM usuario JOIN login ON usuario.usr_identificacion = login.usr_identificacion JOIN userrol ON usuario.usr_identificacion = userrol.usr_identificacion JOIN rol ON userrol.rol_id = rol.rol_id WHERE lg_mail = ? AND lg_password = ?", values, (err, result) => {
		if (err) {
			console.log(err);
			res.status(500).send(err)
		} else {
			if (result.length > 0) {
				res.status(200).send(
					{
						usr_nombre: result[0].usr_nombre,
						usr_apellido: result[0].usr_apellido,
						rol_descripcion: result[0].rol_descripcion,
						usr_identificacion: result[0].usr_identificacion,
						rol_id: result[0].rol_id,
						lg_mail: result[0].lg_mail,
						isAuth: true
					}
				)
			} else {
				res.status(400).send('Usuario no existe')
			}
		}
	})
	connection.end()
})

app.post('/api/usuario', (req, res) => {
	const { id } = req.body
	var connection = mysql.createConnection(credentials)
	connection.query('SELECT usr_identificacion, usr_nombre, usr_apellido FROM usuario WHERE usr_identificacion = ?', id, (err, result) => {
		if (err) {
			res.status(500).send(err)
		} else {
			res.status(200).send(result)
		}
	})
	connection.end()
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

app.get('/api/periodos2', (req, res) => {
	var connection = mysql.createConnection(credentials)
	connection.query('SELECT per_id, per_nombre FROM periodo', (err, rows) => {
		if (err) {
			res.status(500).send(err)
		} else {
			res.status(200).send(rows)
		}
	})
})

app.get('/api/labores', (req, res) => {
    var connection = mysql.createConnection(credentials)
    connection.query('SELECT labor.lab_id, labor.lab_nombre, labor.lab_horas, labor.lab_estado, tipolabor.tl_codigo, tipolabor.tl_descripcion FROM labor JOIN tipolabor ON labor.tl_id = tipolabor.tl_id', (err, rows) => {
        if (err) {
            res.status(500).send(err)
        } else {
            res.status(200).send(rows)
        }
    })
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

app.post('/api/labores/eliminar', (req, res) => {
	const {id}=req.body
    var connection = mysql.createConnection(credentials)
	console.log(id)

    connection.query('DELETE FROM labor WHERE lab_id= ?',id, (err, result) => {
		
		if (err) {
            res.status(500).send(err)
			console.log("Entroooo")
        } else {
            res.status(200).send(result)
        }
    })
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

app.post('/api/labores/guardar', (req, res) => {
    const { lab_nombre,lab_horas, lab_estado, lab_codigo, lab_descripcion } = req.body;
    console.log(req.body);
    const params = [lab_nombre,lab_horas, lab_estado, lab_codigo, lab_descripcion];
    var connection = mysql.createConnection(credentials);
    connection.query('INSERT INTO labor (lab_nombre,lab_horas, lab_estado, lab_codigo, lab_descripcion) VALUES ?', [[params]], (err, result) => {
        if (err) {
            res.status(500).send(err);
			console.log("entro")
        } else {
            res.status(200).send({ "status": "success", "message": "Labor creada" });
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

app.post('/api/labores/editar', (req, res) => {
	const {lab_id,lab_nombre,lab_horas, lab_estado, lab_codigo, lab_descripcion} = req.body
	const params = [ lab_id,lab_nombre,lab_horas, lab_estado, lab_codigo, lab_descripcion]
	var connection = mysql.createConnection(credentials)
	connection.query('UPDATE labor SET lab_nombre=?, lab_horas=?, lab_estado=?,lab_codigo=?, lab_descripcion=? WHERE lab_id = ?', params, (err, result) => {
		if (err) {
			res.status(500).send(err)
		} else {
			console.log("Modifican ",req.body);
			console.log("Modifican ",result);
			res.status(200).send({ "status": "success", "message": "Labor editada" })
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