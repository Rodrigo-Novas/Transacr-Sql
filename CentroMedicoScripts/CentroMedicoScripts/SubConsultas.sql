SELECT apellido, nombre, idPais, observacion(SELECT * FROM PAIS WHERE)
FROM Pacientes WHERE IDPACIENTE @IDPACIENTE