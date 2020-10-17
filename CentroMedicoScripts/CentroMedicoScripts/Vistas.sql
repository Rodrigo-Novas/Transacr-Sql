sp_help Turno

-- crear vista
go
create view PacientesYTurnos as
select 
p.apellido,
t.estadoDelTurno,
p.nombre,
tp.idMedico
from 
Pacientes p inner join TurnoPaciente tp on tp.idPaciente =p.idPaciente
inner join Turno t on tp.idTurno = t.idTurno
where ISNULL(t.estadoDelTurno,0)=0;

--ejecutar una vista (se trata como una tabla)

select
*
from 
PacientesYTurnos