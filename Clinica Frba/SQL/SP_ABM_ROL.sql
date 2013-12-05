CREATE PROCEDURE HAKUNA_MATATA.SP_dameRolesDeUsuario
	(@id_usuario numeric(18,0))
	
AS
BEGIN
	DECLARE @id_rol numeric(18,0)
	DECLARE	@tablaRoles table(id_rol numeric (18,0),descripcion varchar(255))

	
	INSERT @tablaRoles
	SELECT R.id_rol, R.descripcion 
	FROM HAKUNA_MATATA.UsuarioXRol UXR LEFT JOIN HAKUNA_MATATA.Rol R ON (UXR.id_rol =R.id_rol)
	WHERE UXR.id_usuario=@id_usuario AND R.habilitada=1
	
	RETURN
END
GO

--EXEC HAKUNA_MATATA.SP_dameRolesDeUsuario 1;
--SELECT * FROM HAKUNA_MATATA.UsuarioXRol UXR LEFT JOIN HAKUNA_MATATA.Usuario U ON (UXR.id_usuario=U.id_usuario) WHERE UXR.id_usuario=1


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

CREATE PROCEDURE HAKUNA_MATATA.SP_dameFuncionalidades
(@id_rol numeric(18,0))

AS
BEGIN
		SELECT F.id_funcionalidad,F.nombre 
		FROM HAKUNA_MATATA.FuncionalidadXRol FXR 
		LEFT JOIN HAKUNA_MATATA.Funcionalidad F ON FXR.id_rol = @id_rol
		WHERE F.id_funcionalidad = FXR.id_funcionalidad AND F.habilitada=1;	
END
GO

CREATE PROCEDURE HAKUNA_MATATA.SP_agregarFuncionalidadAlRol
	(@id_funcionalidad numeric(18,0), @id_rol numeric(18,0)) 
AS
BEGIN		
	INSERT INTO HAKUNA_MATATA.FuncionalidadXRol (id_rol, id_funcionalidad)
	VALUES (@id_rol, @id_funcionalidad)
END
GO

CREATE PROCEDURE HAKUNA_MATATA.SP_borrarFuncionalidadAlRol
	(@id_funcionalidad numeric(18,0), @id_rol numeric(18,0)) 
AS
BEGIN
	UPDATE HAKUNA_MATATA.FuncionalidadXRol
	SET habilitada=0
	WHERE id_rol = @id_rol AND id_funcionalidad = @id_funcionalidad;
END
GO

CREATE PROCEDURE HAKUNA_MATATA.SP_agregarRol
(@nombre nvarchar(255)) 
AS
BEGIN
	IF( NOT EXISTS(
		SELECT * FROM HAKUNA_MATATA.Rol R WHERE R.descripcion=@nombre))
	INSERT INTO HAKUNA_MATATA.ROL (descripcion) VALUES (@nombre)
END
GO

--EXEC HAKUNA_MATATA.SP_agregarRol 'pepe';
--SELECT * FROM HAKUNA_MATATA.Rol

CREATE PROCEDURE HAKUNA_MATATA.SP_modificarRol
(@id_rol numeric(18,0), @nombreNuevo varchar(255)) 
AS
BEGIN	
	UPDATE HAKUNA_MATATA.ROL 
	SET descripcion = @nombreNuevo
	WHERE id_rol = @id_rol
END
GO

--EXEC HAKUNA_MATATA.SP_modificarRol 'pepe', 'papa';
--SELECT * FROM HAKUNA_MATATA.Rol

CREATE PROCEDURE HAKUNA_MATATA.SP_inhabilitarRol
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

CREATE PROCEDURE HAKUNA_MATATA.SP_habilitarRol
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

--DROP PROCEDURE HAKUNA_MATATA.SP_dameRolesDeUsuario;
--DROP FUNCTION HAKUNA_MATATA.dameNombreRol;
--DROP PROCEDURE HAKUNA_MATATA.SP_dameFuncionalidades;
--DROP PROCEDURE HAKUNA_MATATA.SP_agregarFuncionalidadAlRol;
--DROP PROCEDURE HAKUNA_MATATA.SP_borrarFuncionalidadAlRol;
--DROP PROCEDURE HAKUNA_MATATA.SP_agregarRol;
--DROP PROCEDURE HAKUNA_MATATA.SP_modificarRol;
--DROP PROCEDURE HAKUNA_MATATA.SP_inhabilitarRol;
--DROP PROCEDURE HAKUNA_MATATA.SP_habilitarRol;