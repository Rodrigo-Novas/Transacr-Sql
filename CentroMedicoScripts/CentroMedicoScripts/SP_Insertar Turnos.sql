
insert into Medico values (2, 'raul', 'fernandez')


exec altaTurno '20190215 00:15', 2, 5, 'el paciente tiene que estar en ayunas'

CREATE PROC altaTurno(

	@fechaTurno char(14), --yyy-mm-yy 12:00:00
	@idPaciente Paciente,
	@idMedico Medico,
	@observacion observacion = ''
)
AS
--estado =0 es pendiente estado = 1 es realizado, estado = 2 es cancelado

if not exists(select top 1 idTurno from turno where fechaTurno= @fechaTurno)
	begin 
	
		insert into Turno(fechaTurno,estadoDelTurno,observacion)
		values(@fechaTurno,0,@observacion)
		declare @auxIdTurno turno
		set @auxIdTurno= @@IDENTITY --esta variable identity de sistema nos da el ultimo valor insertado
		insert into TurnoPaciente(idTurno,idMedico,idPaciente)
		values(@auxIdTurno,@idMedico,@idPaciente)
		print 'Se agrego el turno correctamente'
		return
	end
else
	begin
	print 'el turno ya existe'
	return
end

--creo variable de tipo tabla
go
declare @hola table(
	idHola int,
	holaNombre varchar(50)
)
insert @hola values (1,'jesus')

update @hola set idHola=2
select * from @hola