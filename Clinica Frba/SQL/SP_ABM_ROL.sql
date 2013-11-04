CREATE PROCEDURE [HAKUNA_MATATA].[SP_dameFuncionalidades]
(@codigoRol numeric(18,0) = -1)
AS
BEGIN
	IF (@codigoRol = -1)
		BEGIN
			SELECT nombre 'Nombre' from HAKUNA_MATATA.Funcionalidad WHERE habilitada=1;
		END
	ELSE
		BEGIN
			SELECT nombre 'Nombre' FROM HAKUNA_MATATA.Funcionalidad F
			JOIN HAKUNA_MATATA.FuncionalidadXRol FXR ON FXR.id_rol = @codigoRol
			WHERE F.id_funcionalidad = FXR.id_funcionalidad;
		END
END
GO

CREATE PROCEDURE [HAKUNA_MATATA].[SP_agregarFuncionalidadAlRol]
	(@nombreFuncionalidad nvarchar(255), @nombreRol varchar(255)) 
AS
BEGIN
	DECLARE @id_funcionalidad numeric(18,0);
	DECLARE @id_rol numeric(18,0);

	SET @id_funcionalidad = (SELECT id_funcionalidad FROM [HAKUNA_MATATA].[Funcionalidad]
							WHERE nombre = @nombreFuncionalidad);

	SET @id_rol = (SELECT id_rol FROM [HAKUNA_MATATA].[Rol]
							WHERE descripcion = @nombreRol);
						

	INSERT INTO [HAKUNA_MATATA].[FuncionalidadXRol] (id_rol, id_funcionalidad)
	VALUES (@id_rol, @id_funcionalidad)
END
GO

CREATE PROCEDURE [HAKUNA_MATATA].[SP_borrarFuncionalidadAlRol]
	(@nombreRol varchar(255), @nombreFuncionalidad varchar(255)) 
AS
BEGIN
	DECLARE @id_rol NUMERIC (18,0)
	DECLARE @id_funcionalidad NUMERIC (18,0)	
	
	SELECT @id_rol = id_rol FROM HAKUNA_MATATA.ROL
	WHERE descripcion = @nombreRol
	
	SELECT @id_funcionalidad = id_funcionalidad FROM HAKUNA_MATATA.Funcionalidad
	WHERE nombre = @nombreFuncionalidad
	
	DELETE FROM [HAKUNA_MATATA].[FuncionalidadXRol]
	WHERE id_rol = @id_rol AND id_funcionalidad = @id_funcionalidad;
END
GO

CREATE PROCEDURE [HAKUNA_MATATA].[SP_agregarRol]
(@nombre nvarchar(255)='administrador') 
AS
BEGIN
	IF( NOT EXISTS(
		SELECT * FROM HAKUNA_MATATA.Rol R WHERE R.descripcion=@nombre))
	INSERT INTO [HAKUNA_MATATA].[ROL] (descripcion) VALUES (@nombre)
END
GO

--EXEC HAKUNA_MATATA.SP_agregarRol 'pepe';
--SELECT * FROM HAKUNA_MATATA.Rol

CREATE PROCEDURE [HAKUNA_MATATA].[SP_modificarRol]
(@nombreViejo varchar(255), @nombreNuevo varchar(255)) 
AS
BEGIN	
	UPDATE [HAKUNA_MATATA].[ROL] 
	SET descripcion = @nombreNuevo
	WHERE descripcion = @nombreViejo
END
GO

--EXEC HAKUNA_MATATA.SP_modificarRol 'pepe', 'papa';
--SELECT * FROM HAKUNA_MATATA.Rol

CREATE PROCEDURE [HAKUNA_MATATA].[SP_inhabilitarRol]
	(@nombre varchar(255)) 
AS
BEGIN
	DECLARE @id_rol NUMERIC (18,0)	
	DECLARE @nombre_rol NVARCHAR(255)
	
	SELECT @id_rol = id_rol FROM HAKUNA_MATATA.ROL
	WHERE descripcion = @nombre

	UPDATE HAKUNA_MATATA.ROL
	SET habilitada = 0
	WHERE id_rol = @id_rol
END
GO

--EXEC HAKUNA_MATATA.SP_inhabilitarRol 'papa';
--SELECT * FROM HAKUNA_MATATA.Rol

CREATE PROCEDURE [HAKUNA_MATATA].[SP_habilitarRol]
	(@nombre nvarchar(255))
AS
BEGIN
	
	DECLARE @id_rol NUMERIC (18,0)	
	SELECT @id_rol = id_rol FROM HAKUNA_MATATA.ROL
	WHERE descripcion = @nombre

	UPDATE HAKUNA_MATATA.ROL
	SET habilitada = 1
	WHERE id_rol =  @id_rol
END
GO

--EXEC HAKUNA_MATATA.SP_habilitarRol 'papa';
--SELECT * FROM HAKUNA_MATATA.Rol

DROP PROCEDURE [HAKUNA_MATATA].[SP_dameFuncionalidades];
DROP PROCEDURE [HAKUNA_MATATA].[SP_agregarFuncionalidadAlRol];
DROP PROCEDURE [HAKUNA_MATATA].[SP_borrarFuncionalidadAlRol];
DROP PROCEDURE [HAKUNA_MATATA].[SP_agregarRol];
DROP PROCEDURE [HAKUNA_MATATA].[SP_modificarRol];
DROP PROCEDURE [HAKUNA_MATATA].[SP_inhabilitarRol];
DROP PROCEDURE [HAKUNA_MATATA].[SP_habilitarRol];