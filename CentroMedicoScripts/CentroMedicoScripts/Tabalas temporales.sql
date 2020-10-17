--tabla temporal fisica
create table #tablaTemporal  (id int identity(1,1) not null, pais varchar(20))

--tabla temporal en memoria o variable de tipo tabla
declare @tablaTemporal table (id int identity(1,1) not null, pais varchar(20))

--Script para generar una tabla temporal que va a almacenar los turnos de los pacientes
--Se usa tabla temporal para alivianar la consulta principal

