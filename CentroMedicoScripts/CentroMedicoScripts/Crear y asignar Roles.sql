--Creacion de login
use [CentroMedico]
create login [rodrigo] with password = 'password1234$'
go
alter login [rodrigo] enable
go


--creacion de roles
create  role Pagos authorization dbo
go
alter role pagos add MEMBER rodrigo
go
