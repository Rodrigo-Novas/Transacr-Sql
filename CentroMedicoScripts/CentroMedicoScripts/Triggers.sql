--hay 3 eventos que desembocan un trigger (insert - uodate -delete)
--Se puede almacenar un registro de log, cargar datos en otra tabla, emitir una alerta, gurdar data para que depues se envia esa info
--Monitorea esa info que vamos insertando actualizando y eliminando
--se dispara automaticamente

--creo tabla para trigger

select * from pacientelog
create table PacienteLog
(
	idPaciente Paciente identity(1,1) not null,
	idPais pais,
	fechaAlta datetime

	constraint PK_logPaciente primary key (idPaciente)
)
--Voy a usar el sp que esta en sp_insertar paciente para insertar los pacientes y que se active el trigger
--creo trigger
go
create trigger PacientesCreados ON Pacientes
after insert
as
if (select idPais from inserted) = 'MEX' --inserted es el ultimo registro insertado de la tabla paciente
begin
	insert into PacienteLog(idPais,fechaAlta)
	select
	i.idPais,
	getdate()
	from
	inserted i
end