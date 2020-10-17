USE [EducacionITBlog]
GO
CREATE TABLE allBoys(
	idAllBoys int identity(1,1) not null,
	nombreJugadores varchar(20) 

	CONSTRAINT PK_ALLBOYS primary key (idAllBoys)  --creo pk
)
--creo variable
declare @rodrigo int;
set @rodrigo= 10;

--inserto datos

INSERT INTO allBoys values('mauricio');

--Selecciono campos de la tabla
select nombreJugadores from allBoys;

--selecciono con regex
select nombreJugadores from allBoys where nombreJugadores = 'ma%'
--actualiza datos
update allBoys set nombreJugadores='juan' where idAllBoys=1;

--borro datos
delete from allBoys where idAllBoys=2;

--store procedure

CREATE PROC SP_EDUCACIONIT
(
	@nombreJug varchar(20)
)
as
SELECT * from allBoys where nombreJugadores = @nombreJug;
go

exec SP_EDUCACIONIT 'juan'

--crear tipos propios

CREATE TYPE nombreJugador from varchar(20) 