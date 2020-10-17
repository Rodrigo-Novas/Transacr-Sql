--operador and y or
SELECT* FROM TURNO
SELECT estadoDelTurno from turno where estadoDelTurno=2 OR estadoDelTurno=0
SELECT estadoDelTurno from turno where estadoDelTurno=0 AND idTurno=1

--EL OPERADOR IN NOS PERMITE FILTRAR POR UN GRUPO DE VALORES
SELECT* FROM TURNO

SELECT estadoDelTurno from turno where estadoDelTurno IN(1,2,3) --Nos trae los registros que contengan ese datos

--EL OPERADOR LOGICO LIKE NOS PERMITE TRABAJAR SOBRE CAMPOS CADENA DE CARACTER, NOS FILTRARA LOS DATOS DE LA CONSULTA POR ALGUN CARACTER QUE EXISTA EN ESE CMPO

SELECT * FROM Pacientes where nombre LIKE 'R%' --va a filtrar todos los nombres que comiencen por un r

--operador NOT SIRVE PARA NEGAR LO QUE VIENE DESPUES

SELECT * FROM PACIENTES WHERE NOMBRE NOT LIKE 'R%'
SELECT estadoDelTurno from turno where estadoDelTurno NOT IN(1,2,3)

--OPERADOR BETWEEN NOS PERMITE FILTRAR LOS REGISTROS POR UN DETERMINADO RANGO, 
--PUEDE SER UN RANGO DE FECHAS NUMEROS O TEXTOS


SELECT * FROM TURNO WHERE fechaTurno BETWEEN '2020-03-02' AND '2020-03-05'