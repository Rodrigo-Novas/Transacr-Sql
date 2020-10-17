--F1 Y F2 LOS ATRIBUTOS DEBEN SER ATOMICO, 
--NO SE PUEDE REPETIR VALORES, LOS ATRIBUTOS NO CLAVES DEBEN DEPENDER COMPLETAMENTE DE LA PK

CREATE TABLE Pacientes(
	idPaciente int NOT NULL, --ES NOT NULL PORQUE VA A SER PK
	nombre varchar(50),
	apellido varchar(50),
	fNacimiento date,
	domicilio varchar(50),
	idPais char(3),
	telefono varchar(20),

	constraint PK_Paciente Primary key(idPaciente) --de esta forma defino un campo PK
)


--Creo tabla historial
CREATE TABLE Historia(
	idHistoria int NOT NULL,
	fechaDeHistoria datetime,
	observacion varchar(2000),

	CONSTRAINT PK_Historial Primary Key(idHistoria) --defino PK
)

--Creo la tabla que va a relacionar ambas tablas anteriores. Se encuentra en tercera forma normal
CREATE TABLE HistoriaPaciente(
	idHistoria int NOT NULL,
	idPaciente int NOT NULL,
	idMedico  int NOT NULL

	--las tres van a ser PKs
	CONSTRAINT PK_HistoriaPaciente Primary key(idHistoria, idPaciente, idMedico)	
)

--Creo tabla turno
CREATE TABLE Turno(
	idTurno int NOT NULL,
	fechaTurno datetime,
	estadoDelTurno smallint,
	observacion	varchar(300)

	CONSTRAINT PK_Turnos Primary Key(idTurno)
)


--Creo tabla turno paciente


CREATE TABLE TurnoPaciente(
	idTurno int NOT NULL,
	idPaciente int NOT NULL,
	idMedico int NOT NULL

	CONSTRAINT PK_TurnoPaciente Primary Key(idTurno, idPaciente, idMedico)

)



--CREO TABLA DE Especialidad


CREATE TABLE Especialidad(

	idEspecialidad int IDENTITY(1,1) NOT NULL,  --IDENTITY (1,) SIGNIFICA QUE VA A EMPEZAR ON 1 Y VA A IR DE 1 A 1 AUMENTANDO
	especialiad varchar(30),

	CONSTRAINT PK_Especialidad Primary Key (idEspecialidad)
)


--Creo tabla pais

CREATE TABLE Pais(

	idPais char(3) NOT NULL,
	pais varchar(30) NULL

	CONSTRAINT PK_Pais Primary key(idPais)
)

--Creo tabla Medico 


CREATE TABLE Medico(

	idMedico int IDENTITY(1,1) NOT NULL,
	nombre varchar(10) NOT NULL,
	apellido varchar(10) NOT NULL


	CONSTRAINT PK_Medico Primary Key(idMedico)
)

--CREO TABLA TURNO ESTADO
 CREATE TABLE TurnoEstado(
 
	idEstado smallint NOT NULL,
	descripcion varchar(50),

 CONSTRAINT PK_TurnoEstado Primary Key(idEstado)
 )


--Creo tabla de Pago


CREATE TABLE Pago(
	idPago int IDENTITY(1,1) NOT NULL,
	concepto tinyint NOT NULL,
	fecha datetime NOT NULL,
	monto money NOT NULL,
	estado tinyint NOT NULL,
	obs varchar(1000)

	CONSTRAINT PK_Pago Primary Key (idPago)
)


--Relacion pago / Paciente / Turno


CREATE TABLE PagoPaciente(

		idPago int NOT NULL,
		idPaciente int NOT NULL,
		idTurno	 int NOT NULL

		CONSTRAINT PK_PagoPaciente PRIMARY KEY (idPago, idPaciente, idTurno)
)


--Creo tabla de conceptos

CREATE TABLE Concepto(
	idConcepto tinyint IDENTITY(1,1) NOT NULL,
	descripcion varchar(100)
	CONSTRAINT PK_Concepto Primary Key(idConcepto)
)

--Creo tabla medico especialidad

CREATE TABLE MedicoEspecialidad(

	idMedico int  NOT NULL,
	idEspecialidad int NOT NULL,
	apellido varchar(20)

	CONSTRAINT PK_MedicoEspecialidad PRIMARY KEY(idMedico,idEspecialidad)
)

CREATE TABLE Ejemplo(

	idEjemplo int IDENTITY(1,1) NOT NULL,
	numeroAux int

	CONSTRAINT PK_Ejemplo PRIMARY KEY(idEjemplo)
)