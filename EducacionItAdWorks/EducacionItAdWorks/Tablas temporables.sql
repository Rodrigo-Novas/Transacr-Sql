--1)Clonar estructura y datos de los campos nombre, color y precio de lista de la tabla production.product en una tabla llamada #Productos 

--tablas:Production.Product

--campos: Name, ListPrice, Color

SELECT	Color, Name, ListPrice

INTO	#Productos

FROM	Production.Product;



--2)Clonar solo estructura de los campos identificador, 
--nombre y apellido de la tabla person.person en una tabla llamada #Personas

--tablas: Person.Person

--campos: BusinessEntityID, FirstName, LastName

SELECT	BusinessEntityID, FirstName, LastName

INTO	#personas

FROM	Person.Person

WHERE 1=2;

--3)Eliminar si existe la tabla Productos

--tablas: Productos

IF OBJECT_ID (N'tempdb..#Productos', N'U') IS NOT NULL

		DROP TABLE #Productos;

GO

