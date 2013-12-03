--HAY QUE TESTEAR QUE ANDE

CREATE PROCEDURE HAKUNA_MATATA.SP_alta_afiliado
	(@nombre_usuario VARCHAR(255), --AGREGARLO A LA VENTANA
 	 @nombre VARCHAR(255),
	 @apellido VARCHAR(255),
	 @descripcion_tipo_documento VARCHAR(255), --buscarlo en tabla tipodocumento
	 @numero_documento NUMERIC(18,0),
	 @direccion VARCHAR(255),
	 @telefono NUMERIC(18,0),
	 @mail VARCHAR(255),
	 @fecha_nacimiento DATETIME,
	 @sexo BIT,
	 @descripcion_estado_civil VARCHAR(255), --buscarlo en la tabla EstadoCivil
	 @cantidad_familiares_a_cargo NUMERIC(18,0),
	 @descripcion_plan_medico VARCHAR(255), --buscarlo en la tabla PlanMedico
	 @terminacion_id_afiliado NUMERIC(2,0) --ES IMPORTANTE QUE SE ENVÍO PRIMERO AL QUE TERMINA CON 00 Y LUEGO A LOS SIGUIENTES
	)

AS
BEGIN
	DECLARE @id_usuario NUMERIC(18,0)
	DECLARE @id_tipo_documento NUMERIC(18,0)
	DECLARE @id_estado_civil NUMERIC(18,0)
	DECLARE @id_plan_medico NUMERIC(18,0)
	DECLARE @id_afiliado NUMERIC(18,0)
	
	SELECT TOP 1 @id_usuario = id_usuario
	FROM HAKUNA_MATATA.Usuario
	WHERE @nombre_usuario = nombre
		AND habilitada = 1
	
	SELECT TOP 1 @id_tipo_documento = id_tipo_documento
	FROM HAKUNA_MATATA.TipoDocumento
	WHERE @descripcion_tipo_documento = descripcion
		AND habilitada = 1
	
	SELECT TOP 1 @id_estado_civil = id_estado_civil
	FROM HAKUNA_MATATA.EstadoCivil
	WHERE @descripcion_estado_civil = descripcion
		AND habilitada = 1
	
	IF(@terminacion_id_afiliado = 01)
	BEGIN		
		SELECT TOP 1 @id_afiliado = CAST((id_afiliado/100) + 1 AS NUMERIC(18,0)) + @terminacion_id_afiliado
		FROM HAKUNA_MATATA.Afiliado
		WHERE habilitada = 1
		ORDER BY id_afiliado DESC
	END
	ELSE
	BEGIN
		SELECT TOP 1 @id_afiliado = CAST(id_afiliado/100 AS NUMERIC(18,0)) + @terminacion_id_afiliado
		FROM HAKUNA_MATATA.Afiliado
		WHERE habilitada = 1
		ORDER BY id_afiliado DESC
	END
			
	SET IDENTITY_INSERT HAKUNA_MATATA.Afiliado ON -- para insertar el numero de afiliado que no va de 1 en 1
	INSERT INTO HAKUNA_MATATA.Afiliado	(id_afiliado,
 										 id_usuario,
										 nombre,
										 apellido,
										 id_tipo_documento,
										 numero_documento,
										 direccion,
										 telefono,
										 mail,
										 fecha_nacimiento,
										 sexo,
										 id_estado_civil,
										 id_plan,
										 cantidad_familiares_a_cargo
										)
	VALUES	(@id_afiliado,
			 @id_usuario,
 			 @nombre,
			 @apellido,
			 @id_tipo_documento,
			 @numero_documento,
			 @direccion,
			 @telefono,
			 @mail,
			 @fecha_nacimiento,
			 @sexo,
			 @id_estado_civil,
			 @id_plan_medico,
			 @cantidad_familiares_a_cargo
			)
	SET IDENTITY_INSERT HAKUNA_MATATA.Afiliado OFF
	
END
GO
/*
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
*/

--DROP PROCEDURE HAKUNA_MATATA.SP_alta_afiliado