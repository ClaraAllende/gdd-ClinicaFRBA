--HAY QUE TESTEAR QUE ANDE

CREATE TYPE HAKUNA_MATATA.Especialidades AS TABLE --tabla que recibe por parametro el SP_alta_afiliado con todas las especialidades de un afiliado
(descripcion_especialidad VARCHAR(255));
GO

CREATE PROCEDURE HAKUNA_MATATA.SP_alta_profesional
	(@matricula NUMERIC(18, 0),
	 @nombre_usuario VARCHAR(255), --AGREGARLO A LA VENTANA
 	 @nombre VARCHAR(255),
	 @apellido VARCHAR(255),
	 @descripcion_tipo_documento VARCHAR(255), --buscarlo en tabla tipodocumento
	 @numero_documento NUMERIC(18,0),
	 @direccion VARCHAR(255),
	 @telefono NUMERIC(18,0),
	 @mail VARCHAR(255),
	 @fecha_nacimiento DATETIME,
	 @sexo BIT,
	 @tabla_especialidades HAKUNA_MATATA.Especialidades READONLY -- buscarlo en tabla especilidad
	)

AS
BEGIN
	DECLARE @id_usuario NUMERIC(18,0)
	DECLARE @id_tipo_documento NUMERIC(18,0)
	DECLARE @id_especialidad NUMERIC(18,0)
	DECLARE @descripcion_especialidad VARCHAR(255)
	
	SELECT TOP 1 @id_usuario = id_usuario
	FROM HAKUNA_MATATA.Usuario
	WHERE @nombre_usuario = nombre
		AND habilitada = 1
	
	SELECT TOP 1 @id_tipo_documento = id_tipo_documento
	FROM HAKUNA_MATATA.TipoDocumento
	WHERE @descripcion_tipo_documento = descripcion
		AND habilitada = 1
	
	SET IDENTITY_INSERT HAKUNA_MATATA.Profesional ON -- para insertar el numero de matricula
	INSERT INTO HAKUNA_MATATA.Profesional	(matricula,
											 id_usuario,
											 nombre,
											 apellido,
											 id_tipo_documento,
											 numero_documento,
											 direccion,
											 telefono,
											 mail,
											 fecha_nacimiento,
											 sexo)
	VALUES	(@matricula,
			 @id_usuario,
			 @nombre,
			 @apellido,
			 @id_tipo_documento,
			 @numero_documento,
			 @direccion,
			 @telefono,
			 @mail,
			 @fecha_nacimiento,
			 @sexo
			)
	SET IDENTITY_INSERT HAKUNA_MATATA.Profesional OFF
	
	DECLARE cur_especialidades CURSOR
	FOR SELECT descripcion_especialidad
		FROM @tabla_especialidades
		
	OPEN cur_especialidades
	FETCH cur_especialidades
	INTO @descripcion_especialidad
	
	WHILE @@FETCH_STATUS = 0
	BEGIN
		
		SELECT TOP 1 @id_especialidad = id_especialidad
		FROM HAKUNA_MATATA.Especialidad
		WHERE @descripcion_especialidad = descripcion
			AND habilitada = 1
		
		INSERT INTO HAKUNA_MATATA.EspecialidadXProfesional(matricula, id_especialidad)
		VALUES(@matricula, @id_especialidad)
		
		FETCH cur_especialidades
		INTO @descripcion_especialidad
	END
	CLOSE cur_especialidades
	DEALLOCATE cur_especialidades
	
	
END
GO

-------------------------------------------------------------------------------------------------
--para modificar un profesional se tiene que hacer por la matricula (no se puede cambair la matricula, para esto debería dar de baja logica el de la matricula vieja y dar de alta de nuevo con la nueva matricula
CREATE PROCEDURE HAKUNA_MATATA.SP_modificar_profesional
	(@matricula NUMERIC(18, 0),
	 @nombre_usuario VARCHAR(255), --AGREGARLO A LA VENTANA
 	 @nombre VARCHAR(255),
	 @apellido VARCHAR(255),
	 @descripcion_tipo_documento VARCHAR(255), --buscarlo en tabla tipodocumento
	 @numero_documento NUMERIC(18,0),
	 @direccion VARCHAR(255),
	 @telefono NUMERIC(18,0),
	 @mail VARCHAR(255),
	 @fecha_nacimiento DATETIME,
	 @sexo BIT,
	 @tabla_especialidades HAKUNA_MATATA.Especialidades READONLY -- buscarlo en tabla especilidad
	)

AS
BEGIN
	DECLARE @id_usuario NUMERIC(18,0)
	DECLARE @id_tipo_documento NUMERIC(18,0)
	DECLARE @id_especialidad NUMERIC(18,0)
	DECLARE @descripcion_especialidad VARCHAR(255)
	
	SELECT TOP 1 @id_usuario = id_usuario
	FROM HAKUNA_MATATA.Usuario
	WHERE @nombre_usuario = nombre
		AND habilitada = 1
	
	SELECT TOP 1 @id_tipo_documento = id_tipo_documento
	FROM HAKUNA_MATATA.TipoDocumento
	WHERE @descripcion_tipo_documento = descripcion
		AND habilitada = 1
	
	SET IDENTITY_INSERT HAKUNA_MATATA.Profesional ON -- para insertar el numero de matricula
	UPDATE HAKUNA_MATATA.Profesional
	SET	 id_usuario = @id_usuario,
		 nombre = @nombre,
		 apellido = @apellido,
		 id_tipo_documento = @id_tipo_documento,
		 numero_documento = @numero_documento,
		 direccion = @direccion,
		 telefono = @telefono,
		 mail = @mail,
		 fecha_nacimiento = @fecha_nacimiento,
		 sexo = @sexo
	WHERE @matricula = matricula
	SET IDENTITY_INSERT HAKUNA_MATATA.Profesional OFF
	
	UPDATE HAKUNA_MATATA.EspecialidadXProfesional
	SET habilitada = 0
	WHERE matricula = @matricula
	
	DECLARE cur_especialidades CURSOR
	FOR SELECT descripcion_especialidad
		FROM @tabla_especialidades
		
	OPEN cur_especialidades
	FETCH cur_especialidades
	INTO @descripcion_especialidad
	
	WHILE @@FETCH_STATUS = 0
	BEGIN
		
		SELECT TOP 1 @id_especialidad = id_especialidad
		FROM HAKUNA_MATATA.Especialidad
		WHERE @descripcion_especialidad = descripcion
			AND habilitada = 1
		
		INSERT INTO HAKUNA_MATATA.EspecialidadXProfesional(matricula, id_especialidad)
		VALUES(@matricula, @id_especialidad)
		
		FETCH cur_especialidades
		INTO @descripcion_especialidad
	END
	CLOSE cur_especialidades
	DEALLOCATE cur_especialidades
	
	
END
GO

--LA BAJA SE HACE POR LA MATRICULA
CREATE PROCEDURE HAKUNA_MATATA.SP_baja_profesional
	(@matricula NUMERIC(18, 0))

AS
BEGIN

	UPDATE HAKUNA_MATATA.Profesional
	SET habilitada = 0
	WHERE matricula = @matricula
	
	-- FALTA LA PARTE DE DAR DE BAJA LOS TURNOS!!!!!!!!!
	
END
GO

--DROP PROCEDURE HAKUNA_MATATA.SP_alta_profesional
--DROP PROCEDURE HAKUNA_MATATA.SP_modificar_profesional
--DROP PROCEDURE HAKUNA_MATATA.SP_baja_profesional
--DROP TYPE HAKUNA_MATATA.Especialidades