----EJERCICIOS
-- SOLO ES REQUERIDO REALIZAR LOS EJERCICIOS DE COMPLEJIDAD BAJA, realizar los demas ejercicios serán puntos extras para la evaluación del examen.


--- EJERCICIO 1 - COMPLEJIDAD BAJA: 
--Realizar una consulta para consultar todos los alumnos existentes, mostrar: TipoDoc, Documento, Nombre, Apellido, Legajo.

SELECT tipodoc, documento, nombre, apellido, legajo FROM (persona p JOIN alumno a ON a.idpersona = p.identificador);

--- EJERCICIO 2 - COMPLEJIDAD BAJA:
--Realizar una consulta para consultar todas las carreras a la que un alumno esta inscripto, mostrar: Legajo, nombre, apellido, nombre carrera, fechainscripcioncarrera
--ordenado por legajo descendiente

SELECT legajo, nombre, apellido, nombre_carrera, fechainscripcion AS fechainscripcioncarrera FROM (
	(inscripciones_carrera JOIN
		(
			SELECT alumno.identificador AS idalumno, legajo, nombre, apellido FROM (
				alumno JOIN persona ON alumno.idpersona = persona.identificador
			)
		) alumno_persona ON inscripciones_carrera.idalumno = alumno_persona.idalumno
	) inscripcion_persona JOIN
	(
		SELECT identificador, nombre AS nombre_carrera from carrera
	) carrera_nombre ON inscripcion_persona.idcarrera = carrera_nombre.identificador
) ORDER BY legajo;

-- EJERCICIO 3 - COMPLEJIDAD MEDIA:
--Realizar una consulta para consultar la cantidad de inscriptos por curso, mostrando: nombre carrera, nombre curso, cantidad inscriptos, cupo máximo por curso

SELECT nombre_carrera, nombre_curso, cantidad_inscriptos, cupo_maximo FROM (
	SELECT * FROM (
		SELECT idcurso, COUNT(idcurso) AS cantidad_inscriptos
		FROM inscripciones_curso GROUP BY idcurso
	) inscriptos JOIN
	(
		SELECT identificador AS idcurso, nombre AS nombre_curso, cupomaximo AS cupo_maximo, idcarrera FROM curso
	) curso ON inscriptos.idcurso = curso.idcurso
) inscriptos_curso JOIN
(
	SELECT identificador AS idcarrera, nombre AS nombre_carrera FROM carrera
) carrera_nombre ON carrera_nombre.idcarrera = inscriptos_curso.idcarrera;

--- EJERCICIO 4 - COMPLEJIDAD ALTA:
--Sobre la consulta anterior (copiar y pegarla y modificarla) modificar la sql para que la consulta retorne solo los cursos cuya cantidad de inscripciones
--supera su cupo maximo

SELECT nombre_carrera, nombre_curso, cantidad_inscriptos, cupo_maximo FROM (
	SELECT * FROM (
		SELECT idcurso, COUNT(idcurso) AS cantidad_inscriptos
		FROM inscripciones_curso GROUP BY idcurso
	) inscriptos JOIN
	(
		SELECT identificador AS idcurso, nombre AS nombre_curso, cupomaximo AS cupo_maximo, idcarrera FROM curso
	) curso ON inscriptos.idcurso = curso.idcurso
) inscriptos_curso JOIN
(
	SELECT identificador AS idcarrera, nombre AS nombre_carrera FROM carrera
) carrera_nombre ON carrera_nombre.idcarrera = inscriptos_curso.idcarrera
WHERE cantidad_inscriptos > cupo_maximo;

--- EJERCICIO 5 -  COMPLEJIDAD BAJA:
-- actualizar todos las cursos que posean anio 2018 y cuyo cupo sea menor a 5, y actualizar el cupo de todos ellos a 10.

UPDATE curso
SET cupomaximo = 10
WHERE (anio = 2018 AND cupomaximo < 5);

--- EJERCICIO 6 -  COMPLEJIDAD ALTA:
-- actualizar todas las fechas de inscripcion a cursados que posean el siguiente error: la fecha de inscripcion al cursado de un
-- alumno es menor a la fecha de inscripcion a la carrera. La nueva fecha que debe tener es la fecha del dia. Se puede hacer en dos pasos, primero
-- realizando la consulta y luego realizando el update manual


--- EJERCICIO 7 - COMPLEJIDAD BAJA:
--INSERTAR un nuevo registro de alumno con tus datos personales, (hacer todos inserts que considera necesario)

INSERT INTO persona (identificador, tipodoc, documento, nombre, apellido, fechanac) VALUES (6, 'DNI', 38698242, 'Sebastian', 'Gonzalez', '1995-01-04');
INSERT INTO alumno (identificador, idpersona, legajo) VALUES (6, 6, 30160);
INSERT INTO inscripciones_carrera (idalumno, idcarrera, fechainscripcion) VALUES (6, 1, '2015-01-01');

--- EJERCICIO 8 -  COMPLEJIDAD BAJA:
-- si se desea comenzar a persistir de ahora en mas el dato de direccion de un alumno y considerando que este es un único cambio string de 200 caracteres.
-- Determine sobre que tabla seria mas conveniente persistir esta información y realizar la modificación de estructuras correspondientes.

ALTER TABLE persona
ADD direccion VARCHAR(200);
