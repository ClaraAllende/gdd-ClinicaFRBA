CREATE PROCEDURE HAKUNA_MATATA.SP_dameTipoDocumento
AS
BEGIN
	DECLARE	@tablaTipoDocumento table(
								descripcion varchar(255)
								)
	INSERT @tablaTipoDocumento
	SELECT T.descripcion from HAKUNA_MATATA.TipoDocumento T
	WHERE T.habilitada=1
	
	RETURN 
END
GO

CREATE PROCEDURE HAKUNA_MATATA.SP_dameEstadoCivil
AS
BEGIN
	DECLARE	@tablaEstadoCivil table(
								descripcion varchar(255)
								)
	INSERT @tablaEstadoCivil
	SELECT E.descripcion from HAKUNA_MATATA.EstadoCivil E
	WHERE E.habilitada=1
	
	RETURN 
END
GO

CREATE PROCEDURE HAKUNA_MATATA.SP_crearAfiliado
	(@id_usuario numeric (18,0),
	 @nombre varchar(255),
	 @apellido varchar (255),
	 @id_tipo_documento numeric (18,0),
	 @numero_documento numeric (18,0),
	 @direccion varchar(255),
	 @telefono numeric (18,0),
	 @mail varchar(255),
	 @fecha_nacimiento datetime,
	 @sexo bit,
	 @id_estado_civil numeric (18,0),
	 @id_plan numeric (18,0))
	 
AS
BEGIN
--No estamos contemplando los hijos o familiares a cargo
	INSERT HAKUNA_MATATA.Afiliado(id_usuario, nombre,apellido,id_tipo_documento, numero_documento, direccion, telefono, mail, fecha_nacimiento, sexo, id_estado_civil, id_plan)
	VALUES (@id_usuario, @nombre, @apellido, @id_tipo_documento, @numero_documento, @direccion, @telefono, @mail, @fecha_nacimiento, @sexo, @id_estado_civil, @id_plan)
END
GO 

--SELECT * FROM HAKUNA_MATATA.Afiliado

CREATE FUNCTION HAKUNA_MATATA.dameNumeroPrincipalAfiliado
								(@id_usuario numeric(18,0))
RETURNS numeric(18,0)
AS
BEGIN
	DECLARE	 @numeroAfiliado numeric(18,0)
	DECLARE	 @numeroPrincipal numeric(18,0)
	SELECT @numeroAfiliado = id_afiliado FROM HAKUNA_MATATA.Afiliado A WHERE A.id_usuario=@id_usuario
	SET @numeroPrincipal= (SELECT @numeroAfiliado/100 as Integer)
	RETURN @numeroPrincipal
END
GO

--SELECT HAKUNA_MATATA.SP_dameNumeroPrincipalAfiliado (10);
--SELECT * FROM HAKUNA_MATATA.Afiliado A WHERE A.id_afiliado=1

DROP PROCEDURE HAKUNA_MATATA.SP_dameEstadoCivil;
DROP PROCEDURE HAKUNA_MATATA.SP_dameTipoDocumento;
DROP PROCEDURE HAKUNA_MATATA.SP_crearAfiliado
DROP FUNCTION HAKUNA_MATATA.dameNumeroPrincipalAfiliado