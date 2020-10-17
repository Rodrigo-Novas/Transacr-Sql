
--Creo llave foranea para pacientes y pais
ALTER TABLE Pacientes
ADD FOREIGN KEY (idPais) REFERENCES Pais(idPais)


--Creo llave foranea para Pacientes y historiaPaciente

ALTER TABLE HistoriaPaciente --alter table es la tabla que contiene la foreign key y la referencia es la que contiene la PK
ADD FOREIGN KEY(idPaciente)	REFERENCES Pacientes(idPaciente)