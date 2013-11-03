CREATE FUNCTION [HAKUNA_MATATA].[SP_login]
	(@nombre nvarchar(255), @contrasenia nvarchar(255)) 
RETURNS	@tablaRoles table(
descripcion varchar(255)
)

AS
BEGIN	
	DECLARE @id_usuario NUMERIC (18,0)	
	DECLARE @nombre_rol NVARCHAR(255)
	
	IF EXISTS (SELECT @id_usuario 'id_usuario' 
			   FROM HAKUNA_MATATA.Usuario U
			   WHERE nombre = @nombre AND contrasenia = @contrasenia)
		INSERT @tablaRoles
			SELECT descripcion 
			FROM HAKUNA_MATATA.UsuarioXRol UXR INNER JOIN HAKUNA_MATATA.Rol R ON (UXR.id_rol =R.id_rol)
			WHERE UXR.id_usuario = @id_usuario
		RETURN

END
GO

CREATE FUNCTION [HAKUNA_MATATA].[SP_menu_funcionalidades]
	(@nombreRol nvarchar(255)) 
RETURNS	@tablaFuncionalidades table(
nombre varchar(255)
)

AS
BEGIN	
	INSERT @tablaFuncionalidades
		SELECT F.nombre 
		FROM HAKUNA_MATATA.Rol R INNER JOIN HAKUNA_MATATA.FuncionalidadXRol FXR ON (R.id_rol =FXR.id_rol)
								 INNER JOIN HAKUNA_MATATA.Funcionalidad F ON (FXR.id_funcionalidad =F.id_funcionalidad)
		WHERE R.id_usuario = @nombre_rol
	RETURN

END
GO

DROP FUNCTION [HAKUNA_MATATA].[SP_login];