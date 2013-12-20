CREATE PROCEDURE HAKUNA_MATATA.SP_precios_bonos
	(@nro_afiliado varchar(255))
AS
BEGIN
	DECLARE @id_plan NUMERIC(18,0)
	
	SET @id_plan = (SELECT A.id_plan FROM HAKUNA_MATATA.Afiliado A WHERE A.id_afiliado = @nro_afiliado)
	
	SELECT P.precio_bono_consulta, P.precio_bono_farmacia FROM HAKUNA_MATATA.PlanMedico P WHERE P.id_plan = @id_plan
END
GO
/*
DROP PROCEDURE HAKUNA_MATATA.SP_precios_bonos
EXEC HAKUNA_MATATA.SP_precios_bonos 24435558;

SELECT * FROM HAKUNA_MATATA.Afiliado A
SELECT * FROM HAKUNA_MATATA.Usuario U
SELECT * FROM HAKUNA_MATATA.PlanMedico P
*/



CREATE PROCEDURE HAKUNA_MATATA.SP_comprar_bonos
	(@nro_afiliado VARCHAR(255),
	@cant_bonos_consulta INT,
	@cant_bonos_farmacia INT)
AS
BEGIN
	DECLARE @id_plan NUMERIC(18,0)
	DECLARE @id_compra NUMERIC(18,0)
	DECLARE @precio_consulta NUMERIC(18,0)
	DECLARE @precio_farmacia NUMERIC(18,0)
	DECLARE @incremento INT = 1
	DECLARE @numero_inicial INT = 1
	DECLARE @indice INT
	
	SET @id_plan = (SELECT A.id_plan FROM HAKUNA_MATATA.Afiliado A WHERE A.id_afiliado = @nro_afiliado)
	
	SET @precio_consulta = (SELECT P.precio_bono_consulta FROM HAKUNA_MATATA.PlanMedico P WHERE P.id_plan = @id_plan)

	SET @precio_farmacia = (SELECT P.precio_bono_farmacia FROM HAKUNA_MATATA.PlanMedico P WHERE P.id_plan = @id_plan)
	
	INSERT INTO HAKUNA_MATATA.Compra values(@nro_afiliado, GETDATE(), 1)
	SET @id_compra = (SELECT MAX(C.id_compra) FROM HAKUNA_MATATA.Compra C)

	SET @indice = @numero_inicial	
	WHILE @indice <= @cant_bonos_consulta
	BEGIN
	    INSERT INTO HAKUNA_MATATA.BonoConsulta
			values(@id_compra, NULL, @id_plan, @precio_consulta,GETDATE(),NULL,NULL,1)
	  	SET @indice = @indice + 1
	END
	
	SET @indice = @numero_inicial	
	WHILE @indice <= @cant_bonos_farmacia
	BEGIN
		INSERT INTO HAKUNA_MATATA.BonoFarmacia
			values(@id_compra, NULL, @id_plan, @precio_farmacia,GETDATE(),GETDATE(),NULL,NULL,1)
		SET @indice = @indice + 1
	END
END
GO
/*
DROP PROCEDURE HAKUNA_MATATA.SP_comprar_bonos
EXEC HAKUNA_MATATA.SP_comprar_bonos 24435555, 2, 1;

SELECT * FROM HAKUNA_MATATA.BonoConsulta
SELECT * FROM HAKUNA_MATATA.BonoFarmacia
SELECT * FROM HAKUNA_MATATA.Compra
SELECT * FROM HAKUNA_MATATA.PlanMedico
DELETE HAKUNA_MATATA.Compra WHERE id_compra = 53389
DELETE HAKUNA_MATATA.BonoConsulta WHERE id_bono = 181694
*/