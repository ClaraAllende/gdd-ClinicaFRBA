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

--DROP FUNCTION HAKUNA_MATATA.FN_get_profesionales