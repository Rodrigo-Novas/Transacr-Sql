declare @fecha char(12)
declare @path varchar(100)
declare @name varchar(30)
set @fecha= concat(convert(char(8),getdate(), 112), replace(CONVERT(char(5), GETDATE(), 108), ':', ''))
--print @fecha
set @path = 'C:\backupSQL\CentroMedico' + @fecha + '.bak'
set @name ='CentroMedico' + @fecha

BACKUP DATABASE CentroMedico
TO DISK = @path --ruta donde se guarda
WITH NO_COMPRESSION, NAME = @name --no comprimido y nombre de backup