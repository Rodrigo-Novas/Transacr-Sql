SELECT * FROM PACIENTES


SELECT apellido, MAX(idPaciente) from Pacientes GROUP BY apellido --saca el id minimo agrupado por apellido