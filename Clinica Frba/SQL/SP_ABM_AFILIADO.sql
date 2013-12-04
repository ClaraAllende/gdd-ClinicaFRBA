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
-------------------------------------------------------------------------------------------------
--para modificar un afiliado se tiene que hacer por el id_afiliado
CREATE PROCEDURE HAKUNA_MATATA.SP_modificar_afiliado
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
	 @id_afiliado NUMERIC(18,0),
	 @modificacion_plan_medico VARCHAR(255) -- si no se modifica se manda en null y listo
	)

AS
BEGIN
	DECLARE @id_usuario NUMERIC(18,0)
	DECLARE @id_tipo_documento NUMERIC(18,0)
	DECLARE @id_estado_civil NUMERIC(18,0)
	DECLARE @id_plan_medico NUMERIC(18,0)
	DECLARE @fecha DATETIME
	
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
			
	UPDATE HAKUNA_MATATA.Afiliado
	SET	id_usuario = @id_usuario,
		nombre = @nombre,
		apellido = @apellido,
		id_tipo_documento = @id_tipo_documento,
		numero_documento = @numero_documento,
		direccion = @direccion,
		telefono = @telefono,
		mail = @mail,
		fecha_nacimiento = @fecha_nacimiento,
		sexo = @sexo,
		id_estado_civil = @id_estado_civil,
		id_plan = id_plan,
		cantidad_familiares_a_cargo = @cantidad_familiares_a_cargo
	WHERE @id_afiliado = id_afiliado
	
	IF(@modificacion_plan_medico IS NOT NULL)
	BEGIN
		SET @fecha = CURRENT_TIMESTAMP
		INSERT INTO HAKUNA_MATATA.AuditoriaAfiliado(id_afiliado, descripcion, fecha)
		VALUES (@id_afiliado, @modificacion_plan_medico, @fecha)
	END
	
END
GO

-------------------------------------------------------------------------------------------------------------------
--LA BAJA SE HACE POR EL ID_AFILIADO
CREATE PROCEDURE HAKUNA_MATATA.SP_baja_afiliado
	(@id_afiliado NUMERIC(18, 0))

AS
BEGIN

	UPDATE HAKUNA_MATATA.afiliado
	SET habilitada = 0
	WHERE id_afiliado = @id_afiliado
	
	-- FALTA LA PARTE DE DAR DE QUE LOS TURNOS Y BONOS QUEDEN INUTILIZABLES (LO DEBERÍA HACER ACÁ, O CUANDO ALGUIEN QUIERA USARLO, CHEQUEAR QUE EL AFILIADO ESTÉ ACTIVO???
	
END
GO

--------------------------------------------------------------------------------------------------------------------
CREATE TRIGGER TR_modificar_baja_afiliado
ON HAKUNA_MATATA.Afiliado FOR UPDATE
AS
BEGIN
	DECLARE @fecha DATETIME
	DECLARE @id_afiliado NUMERIC(18,0)
	DECLARE @habilitada BIT
	
	IF(UPDATE(habilitada)) -- se dio de baja
	BEGIN
		SET @fecha = CURRENT_TIMESTAMP
		
		DECLARE CUR_auditoria CURSOR
		FOR SELECT id_afiliado, habilitada
			FROM INSERTED
			
		OPEN CUR_auditoria
		FETCH CUR_auditoria 
		INTO @id_afiliado, @habilitada
		
		WHILE @@FETCH_STATUS = 0
		BEGIN
			IF(@habilitada = 0)
			BEGIN
				INSERT INTO HAKUNA_MATATA.Auditoria(fecha, descripcion, id_afiliado)
				VALUES(@fecha, 'BAJA AFILIADO', @id_afiliado)
			
				FETCH CUR_auditoria
				INTO @id_afiliado, @habilitada
			END
		END
		
		CLOSE CUR_auditoria
		DEALLOCATE CUR_auditoria
	END
END



--DROP PROCEDURE HAKUNA_MATATA.SP_alta_afiliado
--DROP PROCEDURE HAKUNA_MATATA.SP_modificar_afiliado
--DROP PROCEDURE HAKUNA_MATATA.SP_baja_afiliado
--DROP TRIGGER HAKUNA_MATATA.TR_modificar_baja_afiliado