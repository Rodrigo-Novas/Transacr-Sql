--condiciion if else

DECLARE @idPaciente int  --declaro variable
set @idPaciente = 1 --seteo valor de la varible
--coloco los if
IF @idPaciente = 3
	SELECT * FROM Pacientes WHERE idPaciente = @idPaciente
ELSE IF @idPaciente=1
begin --esto es para que ejecute todo el bloque sino ejecuta la primer linea solamente
	SELECT * FROM Pacientes WHERE idPaciente = @idPaciente
	print @idPaciente

	IF EXISTS(SELECT *FROM Pacientes WHERE idPaciente= 4) --si existe el id paciente 4 entonces devolver existe
		PRINT 'Existe'
end

--ESTRUCTURA WHILE

DECLARE @contador int = 0
WHILE @contador <= 10
BEGIN
	PRINT @contador
set @contador=@contador+1
END

--CONDICIONAL CASE

DECLARE @VALOR INT 
DECLARE @RESULT CHAR(10)= ''
SET @VALOR = 4
SET @RESULT = (CASE WHEN @VALOR = 4 THEN 'AZUL'
					WHEN @VALOR = 5  THEN 'ROJO' END)
SELECT* FROM Turno
SELECT *,(CASE WHEN estadoDelTurno=1 THEN 'AZUL'
				WHEN estadoDelTurno=2 THEN 'ROJO'
				else 'gris'END) as color FROM Turno



