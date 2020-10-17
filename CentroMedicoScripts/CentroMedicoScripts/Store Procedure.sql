--Creo store procedure paciente


CREATE PROC SP_Paciente(
	@idPaciente int  --parametro de entrada
)
AS
SELECT *FROM Pacientes WHERE idPaciente = @idPaciente
GO



--Ejecutar store procesure

EXECUTE SP_Paciente 3