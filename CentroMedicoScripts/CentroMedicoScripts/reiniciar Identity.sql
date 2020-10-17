--Reiniciar identity
INSERT INTO Ejemplo values(1)--inserto valores a la tabla en modo de ejemplo

--Primero eliminar datos de la tabla
delete from Ejemplo 

--Si vuelvo a insertar va a ingresar desde el ultimo numero identity que tuvo en este caso 6
--Por eso debo reiniciarlo
dbcc checkident ('Ejemplo',RESEED,0) --REINICIA EL IDENTITY

--Inserto como prueba
INSERT INTO Ejemplo VALUES(1)


--Muestro los valores

SELECT * FROM Ejemplo