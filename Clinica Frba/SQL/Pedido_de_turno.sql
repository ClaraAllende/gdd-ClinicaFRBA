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

CREATE FUNCTION HAKUNTA_MATATA.FN_get_dias_profesional
	(@matricula NUMERIC(18,0)
	)
RETURNS @tabla TABLE
	(
	)
AS
BEGIN
	
	RETURN
END
GO


/*
DROP FUNCTION HAKUNA_MATATA.FN_get_profesionales
DROP FUNCTION HAKUNA_MATATA.FN_get_especialidades
DROP FUNCTION HAKUNA_MATATA.FN_get_profesionales_por_especialidad
*/