/*Mostrar el nombre, precio y color de 
los accesorios para asientos de las bicicletas cuyo
precio sea mayor a 100 pesos
Tablas: Production.Product
Campos: Name, ListPrice, Color*/

SELECT 
Production.Product.Name as nombre, 
ListPrice as precio, 
Color 
FROM Production.Product WHERE Name like '%Seat%' and  ListPrice > 100

/*Mostrar los nombre de los productos que tengan 
cualquier combinación de ‘mountain bike’
Tablas: Production.Product
Campos: Name*/

SELECT
Production.Product.Name as nombre
FROM Production.Product WHERE  Name like '%mountain bike%';

/*Mostrar las personas cuyo nombre empiece con la letra “y”
Tablas: Person.Person
Campos: FirstName*/

SELECT FirstName FROM Person.Person WHERE FirstName LIKE 'y%'

/*Mostrar las personas que la segunda letra de su apellido es una s
Tablas: Person.Person
Campos: LastName*/
SELECT LastName as apellido FROM Person.Person WHERE LastName like '[a-s]%'
SELECT LastName as apellido FROM Person.Person WHERE LastName like '_[s]%' 

/*Mostrar el nombre concatenado con el apellido 
de las personas cuyo apellido tengan
terminación española (ez)
Tablas: Person.Person
Campos: FirstName, LastName*/

SELECT FirstName as nombre, LastName as apellido FROM Person.Person where LastName like '%ez'

/*Mostrar los nombres de los
productos que terminen en un número
Tablas: Production.Product
Campos: Name*/

SELECT Name FROM Production.Product WHERE Name like '%[0-1-2-3-4-5-6-7-8-9]'

/*Mostrar las personas cuyo nombre tenga una C o c como primer carácter,
cualquier otro como segundo carácter, ni d ni e ni f ni g como tercer carácter,
cualquiera entre j y r o entre s y w como cuarto carácter 
y el resto sin restricciones
Tablas: Person.Person
Campos: FirstName*/

SELECT FirstName FROM Person.Person WHERE FirstName like '[C-c]_[^d-g][j-w]%'


/*Mostrar todos los productos cuyo precio de lista esté entre 200 y 300
Tablas: Production.Product
Campos: ListPrice*/

SELECT ListPrice AS precio FROM Production.Product WHERE ListPrice BETWEEN 200 AND 300

/*Mostrar los códigos de venta y producto, 
cantidad de venta y precio unitario de los
artículos 750, 753 y 770
Tablas: Sales.SalesOrderDetail
Campos: SalesOrderID, OrderQty, ProductID, UnitPrice*/

SELECT 
SalesOrderID, 
OrderQty, 
ProductID, 
UnitPrice AS precioUnitario
FROM Sales.SalesOrderDetail where ProductID IN (750,753,770)