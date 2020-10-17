INSERT INTO TurnoEstado VALUES(0, 'Pendiente')
INSERT INTO TurnoEstado VALUES(1, 'Realizado')
INSERT INTO TurnoEstado VALUES(2, 'Cancelado')


--Inserto en la tabla turno
insert into Turno values ( '20200302 13:00', 0 , '' )
insert into Turno values ( '20200303 14:00', 0 , '')
insert into Turno values ( '20200303 15:30', 1 , 'El paciente ha sido atendido' )
insert into Turno values ( '20200305 18:00', 2 , 'El paciente llamó para cancelar el turno' ) 

--Inserto en tabla pais
select* from Pais
insert into Pais values('COL', 'COLOMBIA')
insert into Pais values('BRA', 'BASIL')
insert into Pais values('ARG', 'ARGENTINA')
insert into Pais values('PER', 'PERU')
insert into Pais values('ESP', 'ESPAÑA')

--insertar datos en la tabla pacientes
select * from Pacientes
insert into Pacientes values('Claudio', 'Lopez', '2019-01-18', NULL,'ESP', '1566578906')
insert into Pacientes values('Roberto', 'Perez', '2017-01-14', NULL,'ARG', '1578689045')