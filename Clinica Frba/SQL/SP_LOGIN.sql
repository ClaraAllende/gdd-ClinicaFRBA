CREATE PROCEDURE [HAKUNA_MATATA].[SP_login] ---hay que arreglar este procedimiento
	(@nombre nvarchar(255), @contrasenia nvarchar(255)) 

AS
BEGIN	
	DECLARE @id_usuario numeric (18,0)	
	DECLARE @tablaIDRoles table(
								id_rol numeric(18,0)
								)
	DECLARE	@tablaRoles table(
						descripcion varchar(255)
						)	
	SET @id_usuario = (SELECT id_usuario FROM HAKUNA_MATATA.Usuario U WHERE nombre = @nombre AND contrasenia = @contrasenia)
	BEGIN	
		INSERT @tablaIDRoles
		EXEC HAKUNA_MATATA.dameCodigosRolDeUsuario
		
		INSERT @tablaRoles
		SELECT HAKUNA_MATATA.dameNombreRol(id_rol)
		FROM @tablaIDRoles
	END	
	RETURN 

END
GO

CREATE FUNCTION [HAKUNA_MATATA].[menu_funcionalidades]
	(@id_rol numeric(18,0)) 
RETURNS	@tablaFuncionalidades table(
									nombre varchar(255)
									)

AS
BEGIN	

	INSERT @tablaFuncionalidades
		SELECT F.nombre 
		FROM HAKUNA_MATATA.Rol R INNER JOIN HAKUNA_MATATA.FuncionalidadXRol FXR ON (R.id_rol =FXR.id_rol)
								 INNER JOIN HAKUNA_MATATA.Funcionalidad F ON (FXR.id_funcionalidad =F.id_funcionalidad)
		WHERE R.id_rol = @id_rol
	RETURN

END
GO

CREATE PROCEDURE HAKUNA_MATATA.SP_inhabilitar_usuario
	(@nombreUsuario varchar(255))
AS
BEGIN
	UPDATE HAKUNA_MATATA.Usuario
	SET habilitada = 0
	WHERE nombre = @nombreUsuario
END
GO	

--EXEC HAKUNA_MATATA.SP_inhabilitar_usuario 69186172;
--SELECT * FROM HAKUNA_MATATA.Usuario;

CREATE PROCEDURE HAKUNA_MATATA.SP_habilitar_usuario
	(@nombreUsuario varchar(255))
AS
BEGIN
	UPDATE HAKUNA_MATATA.Usuario
	SET habilitada = 1
	WHERE nombre = @nombreUsuario
END
GO

--EXEC HAKUNA_MATATA.SP_habilitar_usuario 69186172;
--SELECT * FROM HAKUNA_MATATA.Usuario;

DROP PROCEDURE [HAKUNA_MATATA].[SP_login];
DROP FUNCTION [HAKUNA_MATATA].[menu_funcionalidades]
DROP PROCEDURE HAKUNA_MATATA.SP_inhabilitar_usuario
DROP PROCEDURE HAKUNA_MATATA.SP_habilitar_usuario