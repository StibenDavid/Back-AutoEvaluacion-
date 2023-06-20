/* INSERTs para la tabla Periodo */

INSERT INTO Periodo (per_id, per_nombre, per_fechainicio, per_fechafin, per_anno, per_semestre)
VALUES (1, '2023-1', '2023-01-01', '2023-06-30', '2023', 1);

INSERT INTO Periodo (per_id, per_nombre, per_fechainicio, per_fechafin, per_anno, per_semestre)
VALUES (2, '2023-2', '2023-07-01', '2023-12-31', '2023', 2);


/* INSERTs para la tabla TipoLabor */

INSERT INTO TipoLabor (tl_id, tl_codigo, tl_descripcion)
VALUES (1, 'D', 'Docencia');

INSERT INTO TipoLabor (tl_id, tl_codigo, tl_descripcion)
VALUES (2, 'TD', 'Trabajos Docencia');

INSERT INTO TipoLabor (tl_id, tl_codigo, tl_descripcion)
VALUES (3, 'PI', 'Proyectos Investigación');

INSERT INTO TipoLabor (tl_id, tl_codigo, tl_descripcion)
VALUES (4, 'TI', 'Trabajos Investigación');

INSERT INTO TipoLabor (tl_id, tl_codigo, tl_descripcion)
VALUES (5, 'AD', 'Administración');

INSERT INTO TipoLabor (tl_id, tl_codigo, tl_descripcion)
VALUES (6, 'AS', 'Asesoría');

INSERT INTO TipoLabor (tl_id, tl_codigo, tl_descripcion)
VALUES (7, 'S', 'Servicios');

INSERT INTO TipoLabor (tl_id, tl_codigo, tl_descripcion)
VALUES (8, 'E', 'Extensión');

INSERT INTO TipoLabor (tl_id, tl_codigo, tl_descripcion)
VALUES (9, 'C', 'Capacitación');

INSERT INTO TipoLabor (tl_id, tl_codigo, tl_descripcion)
VALUES (10, 'OS', 'Otros Servicios');




/* INSERTs para la tabla Labor */

INSERT INTO Labor (lab_id, tl_id, lab_nombre, lab_horas)
VALUES (1, 1, 'Clase de Programación I', 4);

INSERT INTO Labor (lab_id, tl_id, lab_nombre, lab_horas)
VALUES (2, 2, 'Corrección de Tareas de Bases de Datos', 2);

INSERT INTO Labor (lab_id, tl_id, lab_nombre, lab_horas)
VALUES (3, 3, 'Proyecto de Desarrollo de Software', 8);

INSERT INTO Labor (lab_id, tl_id, lab_nombre, lab_horas)
VALUES (4, 4, 'Trabajo de Investigación en Inteligencia Artificial', 6);

INSERT INTO Labor (lab_id, tl_id, lab_nombre, lab_horas)
VALUES (5, 5, 'Administración de Servidores', 3);

INSERT INTO Labor (lab_id, tl_id, lab_nombre, lab_horas)
VALUES (6, 6, 'Asesoría en Redes de Computadoras', 2);

INSERT INTO Labor (lab_id, tl_id, lab_nombre, lab_horas)
VALUES (7, 7, 'Servicios de Consultoría en Tecnología', 5);

INSERT INTO Labor (lab_id, tl_id, lab_nombre, lab_horas)
VALUES (8, 8, 'Proyecto de Desarrollo de Aplicaciones Web', 4);

INSERT INTO Labor (lab_id, tl_id, lab_nombre, lab_horas)
VALUES (9, 9, 'Capacitación en Ciberseguridad', 3);

INSERT INTO Labor (lab_id, tl_id, lab_nombre, lab_horas)
VALUES (10, 10, 'Otros Servicios de Ingeniería de Sistemas', 2);


/* INSERTs para la tabla Usuario */
-- Coordinador
INSERT INTO Usuario (usr_identificacion, usr_nombre, usr_apellido, usr_genero, usr_estudio, usr_estado)
VALUES (1, 'coordinador1', 'Pérez', 'Masculino', 'Ingeniería de Sistemas', 1);

--  Decano
INSERT INTO Usuario (usr_identificacion, usr_nombre, usr_apellido, usr_genero, usr_estudio, usr_estado)
VALUES (2, 'decano1', 'Pérez', 'Masculino', 'Ingeniería de Sistemas', 1);


INSERT INTO Usuario (usr_identificacion, usr_nombre, usr_apellido, usr_genero, usr_estudio, usr_estado)
VALUES (123456789, 'Juan', 'Pérez', 'Masculino', 'Ingeniería de Sistemas', 1);

INSERT INTO Usuario (usr_identificacion, usr_nombre, usr_apellido, usr_genero, usr_estudio, usr_estado)
VALUES (987654321, 'María', 'López', 'Femenino', 'Ingeniería de Sistemas', 1);

INSERT INTO Usuario (usr_identificacion, usr_nombre, usr_apellido, usr_genero, usr_estudio, usr_estado)
VALUES (456789123, 'Carlos', 'Gómez', 'Masculino', 'Ingeniería de Sistemas', 1);

INSERT INTO Usuario (usr_identificacion, usr_nombre, usr_apellido, usr_genero, usr_estudio, usr_estado)
VALUES (789123456, 'Laura', 'Torres', 'Femenino', 'Ingeniería de Sistemas', 1);

INSERT INTO Usuario (usr_identificacion, usr_nombre, usr_apellido, usr_genero, usr_estudio, usr_estado)
VALUES (321654987, 'Andrés', 'Rojas', 'Masculino', 'Ingeniería de Sistemas', 1);

INSERT INTO Usuario (usr_identificacion, usr_nombre, usr_apellido, usr_genero, usr_estudio, usr_estado)
VALUES (654987321, 'Ana', 'Mendoza', 'Femenino', 'Ingeniería de Sistemas', 1);

INSERT INTO Usuario (usr_identificacion, usr_nombre, usr_apellido, usr_genero, usr_estudio, usr_estado)
VALUES (789456123, 'Pedro', 'Hernández', 'Masculino', 'Ingeniería de Sistemas', 1);

INSERT INTO Usuario (usr_identificacion, usr_nombre, usr_apellido, usr_genero, usr_estudio, usr_estado)
VALUES (123789456, 'Sofía', 'García', 'Femenino', 'Ingeniería de Sistemas', 1);

INSERT INTO Usuario (usr_identificacion, usr_nombre, usr_apellido, usr_genero, usr_estudio, usr_estado)
VALUES (456123789, 'Luis', 'Silva', 'Masculino', 'Ingeniería de Sistemas', 1);

INSERT INTO Usuario (usr_identificacion, usr_nombre, usr_apellido, usr_genero, usr_estudio, usr_estado)
VALUES (987456123, 'Ana', 'Pérez', 'Femenino', 'Ingeniería de Sistemas', 1);


/* INSERTs para la tabla Rol */

INSERT INTO Rol (rol_id, rol_descripcion)
VALUES (1, 'Coordinador');

INSERT INTO Rol (rol_id, rol_descripcion)
VALUES (2, 'Decano');

INSERT INTO Rol (rol_id, rol_descripcion)
VALUES (3, 'Docente');


/* INSERTs para la tabla UserRol */

-- Coordinador - Rol Coordinador
INSERT INTO UserRol (usr_identificacion, rol_id, ur_fechainicio, ur_fechafin)
VALUES (1, 1, '2023-01-01', NULL);

-- Decano - Rol Decano
INSERT INTO UserRol (usr_identificacion, rol_id, ur_fechainicio, ur_fechafin)
VALUES (2, 2, '2023-01-01', NULL);

-- Docente Juan Pérez - Rol Docente
INSERT INTO UserRol (usr_identificacion, rol_id, ur_fechainicio, ur_fechafin)
VALUES (123456789, 3, '2023-01-01', NULL);

-- Docente María López - Rol Docente
INSERT INTO UserRol (usr_identificacion, rol_id, ur_fechainicio, ur_fechafin)
VALUES (987654321, 3, '2023-01-01', NULL);

-- Docente Carlos Gómez - Rol Docente
INSERT INTO UserRol (usr_identificacion, rol_id, ur_fechainicio, ur_fechafin)
VALUES (456789123, 3, '2023-01-01', NULL);

-- Docente Laura Torres - Rol Docente
INSERT INTO UserRol (usr_identificacion, rol_id, ur_fechainicio, ur_fechafin)
VALUES (789123456, 3, '2023-01-01', NULL);

-- Docente Andrés Rojas - Rol Docente
INSERT INTO UserRol (usr_identificacion, rol_id, ur_fechainicio, ur_fechafin)
VALUES (321654987, 3, '2023-01-01', NULL);

-- Docente Ana Mendoza - Rol Docente
INSERT INTO UserRol (usr_identificacion, rol_id, ur_fechainicio, ur_fechafin)
VALUES (654987321, 3, '2023-01-01', NULL);

-- Docente Pedro Hernández - Rol Docente
INSERT INTO UserRol (usr_identificacion, rol_id, ur_fechainicio, ur_fechafin)
VALUES (789456123, 3, '2023-01-01', NULL);

-- Docente Sofía García - Rol Docente
INSERT INTO UserRol (usr_identificacion, rol_id, ur_fechainicio, ur_fechafin)
VALUES (123789456, 3, '2023-01-01', NULL);

-- Docente Luis Silva - Rol Docente
INSERT INTO UserRol (usr_identificacion, rol_id, ur_fechainicio, ur_fechafin)
VALUES (456123789, 3, '2023-01-01', NULL);

-- Docente Ana Pérez - Rol Docente
INSERT INTO UserRol (usr_identificacion, rol_id, ur_fechainicio, ur_fechafin)
VALUES (987456123, 3, '2023-01-01', NULL);


/* INSERTs para la tabla Evaluacion */

-- Evaluación 1 - Labor 1 - Periodo 1 - Coordinador
INSERT INTO Evaluacion (eva_id, lab_id, per_id, usr_identificacion, rol_id, eva_estado, eva_puntaje, eva_resultado)
VALUES (1, 1, 1, 1, 1, 'Terminado', 90, 'Aprobado');

-- Evaluación 2 - Labor 2 - Periodo 1 - Docente Juan Pérez
INSERT INTO Evaluacion (eva_id, lab_id, per_id, usr_identificacion, rol_id, eva_estado, eva_puntaje, eva_resultado)
VALUES (2, 2, 1, 123456789, 3, 'Terminado', 92, 'Aprobado');

-- Evaluación 3 - Labor 3 - Periodo 1 - Docente María López
INSERT INTO Evaluacion (eva_id, lab_id, per_id, usr_identificacion, rol_id, eva_estado, eva_puntaje, eva_resultado)
VALUES (3, 3, 1, 987654321, 3, 'Terminado', 85, 'Aprobado');

-- Evaluación 4 - Labor 4 - Periodo 1 - Docente Carlos Gómez
INSERT INTO Evaluacion (eva_id, lab_id, per_id, usr_identificacion, rol_id, eva_estado, eva_puntaje, eva_resultado)
VALUES (4, 4, 1, 456789123, 3, 'Terminado', 91, 'Aprobado');

-- Evaluación 5 - Labor 5 - Periodo 1 - Docente Laura Torres
INSERT INTO Evaluacion (eva_id, lab_id, per_id, usr_identificacion, rol_id, eva_estado, eva_puntaje, eva_resultado)
VALUES (5, 5, 1, 789123456, 3, 'Terminado', 82, 'Aprobado');

-- Evaluación 6 - Labor 6 - Periodo 1 - Docente Andrés Rojas
INSERT INTO Evaluacion (eva_id, lab_id, per_id, usr_identificacion, rol_id, eva_estado, eva_puntaje, eva_resultado)
VALUES (6, 6, 1, 321654987, 3, 'Terminado', 94, 'Aprobado');

-- Evaluación 7 - Labor 7 - Periodo 1 - Docente Ana Mendoza
INSERT INTO Evaluacion (eva_id, lab_id, per_id, usr_identificacion, rol_id, eva_estado, eva_puntaje, eva_resultado)
VALUES (7, 7, 1, 654987321, 3, 'Terminado', 88, 'Aprobado');

-- Evaluación 8 - Labor 8 - Periodo 1 - Docente Pedro Hernández
INSERT INTO Evaluacion (eva_id, lab_id, per_id, usr_identificacion, rol_id, eva_estado, eva_puntaje, eva_resultado)
VALUES (8, 8, 1, 789456123, 3, 'Terminado', 90, 'Aprobado');

-- Evaluación 9 - Labor 9 - Periodo 1 - Docente Sofía García
INSERT INTO Evaluacion (eva_id, lab_id, per_id, usr_identificacion, rol_id, eva_estado, eva_puntaje, eva_resultado)
VALUES (9, 9, 1, 123789456, 3, 'Terminado', 86, 'Aprobado');

-- Evaluación 10 - Labor 10 - Periodo 1 - Docente Luis Silva
INSERT INTO Evaluacion (eva_id, lab_id, per_id, usr_identificacion, rol_id, eva_estado, eva_puntaje, eva_resultado)
VALUES (10, 10, 1, 456123789, 3, 'Terminado', 81, 'Aprobado');

-- Evaluación 11 - Labor 1 - Periodo 2 - Coordinador
INSERT INTO Evaluacion (eva_id, lab_id, per_id, usr_identificacion, rol_id, eva_estado, eva_puntaje, eva_resultado)
VALUES (11, 1, 2, 1, 1, 'En ejecución', 0, 'Pendiente');

-- Evaluación 12 - Labor 2 - Periodo 2 - Docente Juan Pérez
INSERT INTO Evaluacion (eva_id, lab_id, per_id, usr_identificacion, rol_id, eva_estado, eva_puntaje, eva_resultado)
VALUES (12, 2, 2, 123456789, 3, 'En ejecución', 0, 'Pendiente');

-- Evaluación 13 - Labor 3 - Periodo 2 - Docente María López
INSERT INTO Evaluacion (eva_id, lab_id, per_id, usr_identificacion, rol_id, eva_estado, eva_puntaje, eva_resultado)
VALUES (13, 3, 2, 987654321, 3, 'En ejecución', 0, 'Pendiente');

-- Evaluación 14 - Labor 4 - Periodo 2 - Docente Carlos Gómez
INSERT INTO Evaluacion (eva_id, lab_id, per_id, usr_identificacion, rol_id, eva_estado, eva_puntaje, eva_resultado)
VALUES (14, 4, 2, 456789123, 3, 'En ejecución', 0, 'Pendiente');

-- Evaluación 15 - Labor 5 - Periodo 2 - Docente Laura Torres
INSERT INTO Evaluacion (eva_id, lab_id, per_id, usr_identificacion, rol_id, eva_estado, eva_puntaje, eva_resultado)
VALUES (15, 5, 2, 789123456, 3, 'En ejecución', 0, 'Pendiente');

-- Evaluación 16 - Labor 6 - Periodo 2 - Docente Andrés Rojas
INSERT INTO Evaluacion (eva_id, lab_id, per_id, usr_identificacion, rol_id, eva_estado, eva_puntaje, eva_resultado)
VALUES (16, 6, 2, 321654987, 3, 'En ejecución', 0, 'Pendiente');

-- Evaluación 17 - Labor 7 - Periodo 2 - Docente Ana Mendoza
INSERT INTO Evaluacion (eva_id, lab_id, per_id, usr_identificacion, rol_id, eva_estado, eva_puntaje, eva_resultado)
VALUES (17, 7, 2, 654987321, 3, 'En ejecución', 0, 'Pendiente');

-- Evaluación 18 - Labor 8 - Periodo 2 - Docente Pedro Hernández
INSERT INTO Evaluacion (eva_id, lab_id, per_id, usr_identificacion, rol_id, eva_estado, eva_puntaje, eva_resultado)
VALUES (18, 8, 2, 789456123, 3, 'En ejecución', 0, 'Pendiente');

-- Evaluación 19 - Labor 9 - Periodo 2 - Docente Sofía García
INSERT INTO Evaluacion (eva_id, lab_id, per_id, usr_identificacion, rol_id, eva_estado, eva_puntaje, eva_resultado)
VALUES (19, 9, 2, 123789456, 3, 'En ejecución', 0, 'Pendiente');

-- Evaluación 20 - Labor 10 - Periodo 2 - Docente Luis Silva
INSERT INTO Evaluacion (eva_id, lab_id, per_id, usr_identificacion, rol_id, eva_estado, eva_puntaje, eva_resultado)
VALUES (20, 10, 2, 456123789, 3, 'En ejecución', 0, 'Pendiente');

-- Evaluación 21 - Labor 1 - Periodo 3 - Coordinador
INSERT INTO Evaluacion (eva_id, lab_id, per_id, usr_identificacion, rol_id, eva_estado, eva_puntaje, eva_resultado)
VALUES (21, 1, 2, 1, 1, 'Suspendido', 0, 'Pendiente');

-- Evaluación 22 - Labor 2 - Periodo 3 - Docente Juan Pérez
INSERT INTO Evaluacion (eva_id, lab_id, per_id, usr_identificacion, rol_id, eva_estado, eva_puntaje, eva_resultado)
VALUES (22, 2, 2, 123456789, 3, 'Suspendido', 0, 'Pendiente');

-- Evaluación 23 - Labor 3 - Periodo 3 - Docente María López
INSERT INTO Evaluacion (eva_id, lab_id, per_id, usr_identificacion, rol_id, eva_estado, eva_puntaje, eva_resultado)
VALUES (23, 3, 2, 987654321, 3, 'Suspendido', 0, 'Pendiente');

-- Evaluación 24 - Labor 4 - Periodo 3 - Docente Carlos Gómez
INSERT INTO Evaluacion (eva_id, lab_id, per_id, usr_identificacion, rol_id, eva_estado, eva_puntaje, eva_resultado)
VALUES (24, 4, 2, 456789123, 3, 'Suspendido', 0, 'Pendiente');

-- Evaluación 25 - Labor 5 - Periodo 3 - Docente Laura Torres
INSERT INTO Evaluacion (eva_id, lab_id, per_id, usr_identificacion, rol_id, eva_estado, eva_puntaje, eva_resultado)
VALUES (25, 5, 2, 789123456, 3, 'Suspendido', 0, 'Pendiente');

-- Evaluación 26 - Labor 6 - Periodo 3 - Docente Andrés Rojas
INSERT INTO Evaluacion (eva_id, lab_id, per_id, usr_identificacion, rol_id, eva_estado, eva_puntaje, eva_resultado)
VALUES (26, 6, 2, 321654987, 3, 'Suspendido', 0, 'Pendiente');

-- Evaluación 27 - Labor 7 - Periodo 3 - Docente Ana Mendoza
INSERT INTO Evaluacion (eva_id, lab_id, per_id, usr_identificacion, rol_id, eva_estado, eva_puntaje, eva_resultado)
VALUES (27, 7, 2, 654987321, 3, 'Suspendido', 0, 'Pendiente');

-- Evaluación 28 - Labor 8 - Periodo 3 - Docente Pedro Hernández
INSERT INTO Evaluacion (eva_id, lab_id, per_id, usr_identificacion, rol_id, eva_estado, eva_puntaje, eva_resultado)
VALUES (28, 8, 2, 789456123, 3, 'Suspendido', 0, 'Pendiente');

-- Evaluación 29 - Labor 9 - Periodo 3 - Docente Sofía García
INSERT INTO Evaluacion (eva_id, lab_id, per_id, usr_identificacion, rol_id, eva_estado, eva_puntaje, eva_resultado)
VALUES (29, 9, 2, 123789456, 3, 'Suspendido', 0, 'Pendiente');

-- Evaluación 30 - Labor 10 - Periodo 3 - Docente Luis Silva
INSERT INTO Evaluacion (eva_id, lab_id, per_id, usr_identificacion, rol_id, eva_estado, eva_puntaje, eva_resultado)
VALUES (30, 10, 2, 456123789, 3, 'Suspendido', 0, 'Pendiente');

/* INSERTs para la tabla Login */

-- Login 1 - Coordinador - Correo y contraseña correspondientes
INSERT INTO Login (lg_id, usr_identificacion, rol_id, lg_mail, lg_password)
VALUES (1, 1, 1, 'coordinador@example.com', 'password');

-- Login 2 - Decano - Correo y contraseña correspondientes
INSERT INTO Login (lg_id, usr_identificacion, rol_id, lg_mail, lg_password)
VALUES (2, 2, 2, 'decano@example.com', 'password');

-- Login 3 - Docente Juan Pérez - Correo y contraseña correspondientes
INSERT INTO Login (lg_id, usr_identificacion, rol_id, lg_mail, lg_password)
VALUES (3, 123456789, 3, 'juanperez@example.com', 'password');

-- Login 4 - Docente María López - Correo y contraseña correspondientes
INSERT INTO Login (lg_id, usr_identificacion, rol_id, lg_mail, lg_password)
VALUES (4, 987654321, 3, 'marialopez@example.com', 'password');

-- Login 5 - Docente Carlos Gómez - Correo y contraseña correspondientes
INSERT INTO Login (lg_id, usr_identificacion, rol_id, lg_mail, lg_password)
VALUES (5, 456789123, 3, 'carlosgomez@example.com', 'password');

-- Login 6 - Docente Laura Torres - Correo y contraseña correspondientes
INSERT INTO Login (lg_id, usr_identificacion, rol_id, lg_mail, lg_password)
VALUES (6, 789123456, 3, 'lauratorres@example.com', 'password');

-- Login 7 - Docente Andrés Rojas - Correo y contraseña correspondientes
INSERT INTO Login (lg_id, usr_identificacion, rol_id, lg_mail, lg_password)
VALUES (7, 321654987, 3, 'andresrojas@example.com', 'password');

-- Login 8 - Docente Ana Mendoza - Correo y contraseña correspondientes
INSERT INTO Login (lg_id, usr_identificacion, rol_id, lg_mail, lg_password)
VALUES (8, 654987321, 3, 'anamendoza@example.com', 'password');

-- Login 9 - Docente Pedro Hernández - Correo y contraseña correspondientes
INSERT INTO Login (lg_id, usr_identificacion, rol_id, lg_mail, lg_password)
VALUES (9, 789456123, 3, 'pedrohernandez@example.com', 'password');

-- Login 10 - Docente Sofía García - Correo y contraseña correspondientes
INSERT INTO Login (lg_id, usr_identificacion, rol_id, lg_mail, lg_password)
VALUES (10, 123789456, 3, 'sofiagarcia@example.com', 'password');

-- Login 11 - Docente Luis Silva - Correo y contraseña correspondientes
INSERT INTO Login (lg_id, usr_identificacion, rol_id, lg_mail, lg_password)
VALUES (11, 456123789, 3, 'luissilva@example.com', 'password');

-- Login 12 - Docente Ana Pérez - Correo y contraseña correspondientes
INSERT INTO Login (lg_id, usr_identificacion, rol_id, lg_mail, lg_password)
VALUES (12, 987456123, 3, 'anaperez@example.com', 'password');