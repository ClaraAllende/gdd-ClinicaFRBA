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

--DROP FUNCTION HAKUNA_MATATA.FN_get_profesionales
--DROP FUNCTION HAKUNA_MATATA.FN_get_especialidades