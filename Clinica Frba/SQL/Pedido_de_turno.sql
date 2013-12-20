CREATE FUNCTION HAKUNA_MATATA.FN_get_profesionales
	()
RETURNS @tabla TABLE
	(nombre_y_apellido VARCHAR(510),
	 matricula NUMERIC(18,0) --no se debe mostrar, pero cuando seleccione un profesional, debe enviar la matricula para poder mostrar los dias que atiende
	)
AS
BEGIN

	DECLARE @tablaTemp table	(nombre_y_apellido VARCHAR(510),
								 matricula NUMERIC(18,0))
	INSERT INTO @tablaTemp
	SELECT nombre + apellido, matricula
	FROM HAKUNA_MATATA.Profesional
	WHERE habilitada = 1
	
	INSERT INTO @tabla
	SELECT nombre_y_apellido, matricula
	FROM @tablaTemp
	RETURN
END
GO
-----------------------------------------------------------------------------
CREATE FUNCTION HAKUNA_MATATA.FN_get_especialidades
	()
RETURNS @tabla TABLE
	(descripcion VARCHAR(255),
	 id_especialidad NUMERIC(18,0)--no se debe mostrar, es por si hay descripciones duplicadas??
	)
AS
BEGIN
	DECLARE @tablaTemp table	(descripcion VARCHAR(255),
								 id_especialidad NUMERIC(18,0))

	INSERT INTO @tablaTemp
	SELECT descripcion, id_especialidad
	FROM HAKUNA_MATATA.Especialidad
	WHERE habilitada = 1
	
	INSERT INTO @tabla
	SELECT nombre_y_apellido, matricula
	FROM @tablaTemp
	RETURN
END
GO
-----------------------------------------------------------------------------
CREATE FUNCTION HAKUNA_MATATA.FN_get_profesionales_por_especialidad
	(@descripcion_especialidad VARCHAR(255)
	)
RETURNS @tabla TABLE
	(nombre_y_apellido VARCHAR(510),
	 matricula NUMERIC(18,0)--no se debe mostrar, pero cuando seleccione un profesional, debe enviar la matricula para poder mostrar los dias que atiende
	)
AS
BEGIN
	INSERT INTO @tabla
	SELECT P.nombre + P.apellido, P.matricula
	FROM HAKUNA_MATATA.Especialidad E
	JOIN HAKUNA_MATATA.EspecialidadXProfesional EP ON (	E.descripcion = @descripcion_especialidad	AND
														E.id_especialidad = EP.id_especialidad		AND
														E.habilitada = 1							AND
														EP.habilitada = 1)
	JOIN HAKUNA_MATATA.Profesional P ON (EP.matricula = P.matricula	AND
										 P.habilitada = 1)
	RETURN
END
GO
-----------------------------------------------------------------------------
CREATE FUNCTION HAKUNTA_MATATA.FN_get_dias_profesional
	(@matricula NUMERIC(18,0)
	)
RETURNS @tabla TABLE
	(@año NUMERIC(4,0),
	 @mes NUMERIC(2,0),
	 @dia NUMERIC(2,0)
	)
AS
BEGIN
	DECLARE @id_agenda NUMERIC(18,0)
	DECLARE @año NUMERIC(4,0)
	DECLARE @mes NUMERIC(2,0)
	DECLARE @dia NUMERIC(2,0)
	
	DECLARE CUR_Agenda CURSOR
	FOR	SELECT id_agenda
		FROM HAKUNA_MATATA.Agenda
		WHERE	((fecha_inicio > GETDATE())	OR
				 (fecha_inicio < GETDATE() AND fecha_fin > GETDATE()))	AND --CAMBIAR TODOS LOS GETDATE() POR UNA FUNCION NUESTRA QUE RETORNE LA FECHA DEL ARCHIVO DE CONFIGURACION
				matricula = @matricula	AND
				habilitada = 1
		
	OPEN CUR_Agenda
	FETCH CUR_Agenda
	INTO @id_agenda

	WHILE @@FETCH_STATUS = 0
	BEGIN

		DECLARE CUR_Turno CURSOR
		FOR SELECT CAST(YEAR(fecha_y_hora) AS NUMERIC(4,0)), CAST(MONTH(fecha_y_hora) AS NUMERIC(2,0)), CAST(DAY(fecha_y_hora) AS NUMERIC(2,0))
			FROM HAKUNA_MATATA.Turno
			WHERE	id_agenda = @id_agenda AND
					id_afiliado = NULL AND --significa que este turno está libre
					habilitada = 1
			
		OPEN CUR_Turno
		FETCH CUR_Turno
		INTO @año, @mes, @dia
		
		WHILE @@FETCH_STATUS = 0
		BEGIN
			IF(NOT (EXISTS (SELECT * FROM @tabla WHERE año = @año AND mes = @mes AND dia = @dia)))
			BEGIN
				INSERT INTO @tabla (año, mes, dia)
				VALUES @año, @mes, @dia
			END
			
			FETCH CUR_Turno
			INTO @año, @mes, @dia
		END
		CLOSE CUR_Turno
		DEALLOCATE CUR_Turno

		FETCH CUR_Agenda
		INTO @id_agenda
	
	END
	CLOSE CUR_Agenda
	DEALLOCATE CUR_Agenda

	RETURN
END
GO


/*
DROP FUNCTION HAKUNA_MATATA.FN_get_profesionales
DROP FUNCTION HAKUNA_MATATA.FN_get_especialidades
DROP FUNCTION HAKUNA_MATATA.FN_get_profesionales_por_especialidad
DROP FUNCTION HAKUNTA_MATATA.FN_get_dias_profesional
*/