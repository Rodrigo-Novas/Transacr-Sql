CREATE or alter PROC altaPaciente(
	@dni varchar(50),
	@nombre varchar(50),
	@apellido varchar(50),
	@fNacimiento date, --se define como varchar 8 porque el formato de fecha de sql para almacenar fehcas es yyyy-mm-dd por eso mismo ocupa 8 caracteres
	@domicilio varchar(50),
	@idPais char(3),
	@telefono varchar(20)='' -- lo inicializo aca por si viene con null lo coloco vacio
)
AS
if NOT EXISTS (SELECT * FROM Pacientes where Pacientes.dni= @dni)
	BEGIN 
		insert into Pacientes (dni, nombre, apellido, fNacimiento, domicilio, idPais, telefono)
		values(@dni, @nombre, @apellido,@fNacimiento,@domicilio,@idPais, @telefono)
		print 'El paciente se agrego correctamente'
		return
	END
else 
	begin
	print 'el paciente ya existe'
	end
return	

EXEC altaPaciente '22325', 'JOSE', 'NOVAS', '9-12-2019', 'JOSE LEON', 'MEX', '2890768'