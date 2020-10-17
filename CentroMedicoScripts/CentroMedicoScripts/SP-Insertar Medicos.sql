go
create proc Alta_Medico(
	@nombre  varchar(50),
	@apellido varchar(50),
	@idEspecialidad int,
	@Descripcion varchar (50)
)
as
IF NOT EXISTS(SELECT TOP 1 idMedico from Medico where nombre=@nombre and apellido=@apellido)
BEGIN
	insert into Medico (nombre, apellido)
	values(@nombre, @apellido)
	declare @auxMedico int
	set @auxMedico = @@IDENTITY
	print(@auxMedico)
	insert into MedicoEspecialidad(idMedico, idEspecialidad, descripcion) values(@auxMedico, @idEspecialidad, @Descripcion)
	print('Campos insertados correctamente')

END
else
begin
print('No se pudo ejecutar')
end;

go
--select * from Medico
--select * from MedicoEspecialidad
insert Medico values('rodrigo','novas')
insert Medico values('gabriel','hidalgo');

--create type Prueba from varchar(50)
go
exec Alta_Medico 'roberto', 'gomez',2,'Encargado de limpieza'