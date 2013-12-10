CREATE FUNCTION HAKUNA_MATATA.FN_get_profesionales
	()
RETURNS @tabla TABLE
	(nombre_y_apellido VARCHAR(510)
	)
AS
BEGIN
	INSERT INTO @tabla
	SELECT nombre + apellido
	FROM HAKUNA_MATATA.Profesional
	WHERE habilitada = 1
	RETURN
END
GO
-----------------------------------------------------------------------------
CREATE FUNCTION HAKUNA_MATATA.FN_get_especialidades
	()
RETURNS @tabla TABLE
	(descripcion VARCHAR(255)
	)
AS
BEGIN
	INSERT INTO @tabla
	SELECT descripcion
	FROM HAKUNA_MATATA.Especialidad
	WHERE habilitada = 1
	RETURN
END
GO

CREATE FUNCTION HAKUNA_MATATA.FN_get_profesionales_por_especialidad
	(@descripcion_especialidad VARCHAR(255)
	)
RETURNS @tabla TABLE
	(nombre_y_apellido VARCHAR(510)
	)
AS
BEGIN
	INSERT INTO @tabla
	SELECT P.nombre + P.apellido
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

/*
DROP FUNCTION HAKUNA_MATATA.FN_get_profesionales
DROP FUNCTION HAKUNA_MATATA.FN_get_especialidades
DROP FUNCTION HAKUNA_MATATA.FN_get_profesionales_por_especialidad
*/