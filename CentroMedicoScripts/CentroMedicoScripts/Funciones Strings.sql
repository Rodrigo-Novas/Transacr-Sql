--Funcion right y left

declare @var varchar(50) = 'rodrigo novas'
print left(@var,3)
print right(@var,3)


--Funcion len (devuelve la cantidad de caracteres)
print len(@var)

--Lower y upper pasa a minuscula o mayuscula

print lower(@var)
print upper(@var)

--Replace remplaza un caracter por otro

print replace(@var,'rod','josf')

--Replicate permite repetir una cantidad de veces que queremos repetir un caracter
--Sirve por ejemplo para en la interface del usuario esos id formateados

print replicate('hola', 5)

--Ltrim y Rtrim
print ltrim (' jose jose ') --left
print trim(' jose jose ')--todo
print rtrim (' jose jose ')--right

--funcion concat
print concat('roberto',' ', 'juan')

--funcion getdate y getutcdate

print getdate() --da la fecha de la maquina
print getutcdate() --nos da la fecha utc (universal)

--funcion dateadd nos permite agregar dias años meses horas miutos y segundos a una fecha

print dateadd(day,-2, getdate())--que quiero agregar o sacar, cuanto quiero agregar o sacar, a que fecha le quiero agregar y sacar

--funcion date diff devuelve la diferencia entre dos fechas

print datediff(day,getdate(),getutcdate())


--funcion date part permite sacar el intervalo de una fecha

print datepart(month, getdate()) --devuelve el mes day month min hour seg
--se puede agregar dw que es el dia de la semana
print datepart(dw, getdate())


--funcion idate, nos devuelve trueo false dependiendo de la fecha

print isdate(getdate())--devuelve verdadero 1
print isdate(4)--devuelve falso 0


--CAST Y CONVERT

DECLARE @numero int = 4;
declare @string varchar(30) = 'hola'
declare @fecha datetime = getdate()

print cast(@numero as varchar(10)) --castea el dato no lo convierte solo es a modo de visualizacion

print convert(varchar(10), @string) --funciona perfecto cuando hay que convertir fechas

print convert(char(20), @fecha, 112)--el tercer parametro le da el formato de fecha el 112 devuelve año mes y dia, es buenisimo para hacer comparaciones


