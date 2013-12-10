CREATE PROCEDURE HAKUNA_MATATA.SP_dameRolDeUsuario
	(@id_usuario numeric(18,0))
	
AS

BEGIN
	DECLARE @id_rol numeric(18,0)
	DECLARE	@tablaRoles table(descripcion varchar(255))

	
	INSERT @tablaRoles
	SELECT R.descripcion from HAKUNA_MATATA.UsuarioXRol UXR INNER JOIN HAKUNA_MATATA.Rol R ON (UXR.id_rol =R.id_rol)
	WHERE id_usuario=@id_usuario AND R.habilitada=1
	
END
GO

--EXEC HAKUNA_MATATA.SP_dameRolDeUsuario 1;

CREATE FUNCTION HAKUNA_MATATA.dameNombreRol
				(@id_rol numeric(18,0))
				RETURNS varchar(255)
				AS
BEGIN
	DECLARE @nombreRol varchar(255)	
	SELECT @nombreRol = descripcion FROM HAKUNA_MATATA.Rol R WHERE R.id_rol=@id_rol
	RETURN @nombreRol
END
GO 

--EXEC HAKUNA_MATATA.dameNombreRol 1;
--SELECT * FROM HAKUNA_MATATA.Rol

CREATE PROCEDURE [HAKUNA_MATATA].[SP_dameFuncionalidades]
(@codigoRol numeric(18,0))
-- Mandando como parametro el valor -1 devuelve todas las funcionaldades habilitadas
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
(@nombre nvarchar(255)) 
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
(@id_rol numeric(18,0), @nombreNuevo varchar(255)) 
AS
BEGIN	
	UPDATE [HAKUNA_MATATA].[ROL] 
	SET descripcion = @nombreNuevo
	WHERE id_rol = @id_rol
END
GO

--EXEC HAKUNA_MATATA.SP_modificarRol 'pepe', 'papa';
--SELECT * FROM HAKUNA_MATATA.Rol

CREATE PROCEDURE [HAKUNA_MATATA].[SP_inhabilitarRol]
	(@id_rol numeric (18,0)) 
AS
BEGIN
	UPDATE HAKUNA_MATATA.ROL
	SET habilitada = 0
	WHERE id_rol = @id_rol
	
END
GO

--EXEC HAKUNA_MATATA.SP_inhabilitarRol 2;
----SELECT * FROM HAKUNA_MATATA.Rol

--INSERT INTO HAKUNA_MATATA.UsuarioXRol (id_rol, id_usuario)
--VALUES (4,1)
--SELECT * FROM HAKUNA_MATATA.Rol
--SELECT * FROM HAKUNA_MATATA.UsuarioXRol

CREATE PROCEDURE [HAKUNA_MATATA].[SP_habilitarRol]
	(@id_rol numeric (18,0)) 
AS
BEGIN
	UPDATE HAKUNA_MATATA.ROL
	SET habilitada = 1
	WHERE id_rol = @id_rol
	
END
GO

--EXEC HAKUNA_MATATA.SP_habilitarRol 2;
--SELECT * FROM HAKUNA_MATATA.Rol

/*
DROP PROCEDURE HAKUNA_MATATA.SP_dameRolDeUsuario;
DROP FUNCTION HAKUNA_MATATA.dameNombreRol;
DROP PROCEDURE [HAKUNA_MATATA].[SP_dameFuncionalidades];
DROP PROCEDURE [HAKUNA_MATATA].[SP_agregarFuncionalidadAlRol];
DROP PROCEDURE [HAKUNA_MATATA].[SP_borrarFuncionalidadAlRol];
DROP PROCEDURE [HAKUNA_MATATA].[SP_agregarRol];
DROP PROCEDURE [HAKUNA_MATATA].[SP_modificarRol];
DROP PROCEDURE [HAKUNA_MATATA].[SP_inhabilitarRol];
DROP PROCEDURE [HAKUNA_MATATA].[SP_habilitarRol];
*/