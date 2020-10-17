go
CREATE PROC SEL_TurnosPaciente(

@idPaciente Paciente
)
as
select * from Turno t 
inner join TurnoPaciente tp 
on t.idTurno = tp.idTurno
inner join Pacientes p on p.idPaciente = tp.idPaciente
where tp.idPaciente= @idPaciente;


--insert TurnoPaciente values ( 1, 1)