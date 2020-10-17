go
select * from Especialidad

go
create proc Alta_Especialidad
(
	@Especialidad varchar(30)

)
as
if not exists(select top 1 idEspecialidad from Especialidad where especialidad = @Especialidad)
begin
	insert into Especialidad (especialidad) values(@Especialidad)
	print ('Se inserto correctamente')
end
else
begin
	print('No pudo insertarse')
end

exec Alta_Especialidad 'Nombre del producto'

go
sp_rename 'especialidad.especialiad', 'especialidad', 'COLUMN'; --Este sp renombra el nombre de la columna