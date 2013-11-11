CREATE PROCEDURE [HAKUNA_MATATA].[SP_agregarAgenda]
(@matricula numeric(18,0), @fechaInicio datetime, @fechaFin datetime)
AS
BEGIN
	IF (NOT EXISTS (SELECT * FROM HAKUNA_MATATA.Agenda A
					WHERE @matricula = A.matricula AND @fechaInicio < A.fecha_fin))
	INSERT INTO [HAKUNA_MATATA].[Agenda] (matricula, fecha_inicio, fecha_fin)
	VALUES (@matricula, @fechaInicio, @fechaFin)
END
GO


/*
DECLARE @fechaAux1 date = '2011-09-25'
DECLARE @fechaAux2 date = '2011-10-25'
DECLARE @fecha1 dateTime = @fechaAux1
DECLARE @fecha2 dateTime = @fechaAux2
EXEC HAKUNA_MATATA.SP_agregarAgenda 3, @fecha1, @fecha2;
SELECT * FROM HAKUNA_MATATA.Agenda
DROP PROCEDURE [HAKUNA_MATATA].[SP_agregarAgenda];
DELETE HAKUNA_MATATA.Agenda
SELECT * FROM HAKUNA_MATATA.Agenda
*/



CREATE PROCEDURE [HAKUNA_MATATA].[SP_agregarTurno]
(@id_agenda numeric(18,0), @fecha_y_hora datetime)
AS
BEGIN
	IF (NOT EXISTS (SELECT * FROM HAKUNA_MATATA.Turno T WHERE @id_agenda = T.id_agenda AND @fecha_y_hora = T.fecha_y_hora))
		INSERT INTO [HAKUNA_MATATA].[Turno] (id_agenda, fecha_y_hora) VALUES (@id_agenda, @fecha_y_hora)
END
GO

/*
DECLARE @horaAux1 time(3) = '01:01:02';
DECLARE @hora1 dateTime = @horaAux1;

EXEC HAKUNA_MATATA.SP_agregarTurno 23, @hora1;
SELECT * FROM HAKUNA_MATATA.Turno
DROP PROCEDURE [HAKUNA_MATATA].[SP_agregarTurno]
*/


CREATE PROCEDURE [HAKUNA_MATATA].[SP_reservarTurno]
(@id_turno numeric(18,0), @id_afiliado numeric(18,0))
AS
BEGIN
	DECLARE @afiliado numeric(18,0);
	SET @afiliado = (SELECT T.id_afiliado from HAKUNA_MATATA.Turno T WHERE T.id_turno = @id_turno
	IF (@afiliado is null)
		UPDATE T SET T.id_afiliado = @id_afiliado FROM HAKUNA_MATATA.Turno T WHERE T.id_turno = @id_turno
END
GO


/*
DROP PROCEDURE [HAKUNA_MATATA].[SP_reservarTurno];
EXEC HAKUNA_MATATA.SP_reservarTurno 13, 101;
select * from HAKUNA_MATATA.Turno
/*