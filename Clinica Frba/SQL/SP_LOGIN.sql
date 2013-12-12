CREATE PROCEDURE HAKUNA_MATATA.SP_login
	(@nombre nvarchar(255), @contrasenia nvarchar(255), @id_usuario numeric(18,0) OUTPUT) 	
AS
BEGIN	
	SET @id_usuario = (SELECT U.id_usuario FROM HAKUNA_MATATA.Usuario U WHERE U.nombre = @nombre AND U.contrasenia = @contrasenia)
	IF(@@ROWCOUNT=0)
		RAISERROR ('No se encuentra el usuario',-1,-1, 'El usuario no existe o bien la contraseña es incorrecta')
END
GO

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