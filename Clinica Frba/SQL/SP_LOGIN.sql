CREATE PROCEDURE HAKUNA_MATATA.SP_login
	(@nombre nvarchar(255), @contrasenia nvarchar(255)) 

AS
BEGIN	
	DECLARE @id_usuario numeric (18,0)	
	DECLARE	@tablaRoles table(
						id_rol numeric(18,0),
						descripcion varchar(255)
						)	
	SET @id_usuario = (SELECT id_usuario FROM HAKUNA_MATATA.Usuario U WHERE nombre = @nombre AND contrasenia = @contrasenia)
	BEGIN	
		INSERT @tablaRoles
		EXEC HAKUNA_MATATA.dameRolesDeUsuario @id_usuario
		
	END	
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

--DROP PROCEDURE HAKUNA_MATATA.SP_login;
--DROP PROCEDURE HAKUNA_MATATA.SP_inhabilitar_usuario
--DROP PROCEDURE HAKUNA_MATATA.SP_habilitar_usuario