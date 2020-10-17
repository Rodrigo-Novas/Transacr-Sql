--Mostrar los empleados que tienen mas de 90 hs de vacaciones


SELECT VacationHours, BusinessEntityID  FROM HumanResources.Employee WHERE VacationHours > 90

/*Mostrar el nombre, precio y precio con iva de los productos con precio distinto de cero
Tablas:Production.Product
Campos: Name, ListPrice*/


SELECT 
Production.Product.Name as nombre, 
ListPrice as precio, ListPrice * 21 /100 as IVA
FROM Production.Product WHERE ListPrice != 0

/*Mostrar precio y nombre de los productos 776, 777, 778
Tablas:Production.Product
Campos: ProductID, Name, ListPrice*/

SELECT ProductID,Production.Product.Name, ListPrice FROM Production.Product WHERE ProductID IN(776, 777, 778)

/*Mostrar el nombre concatenado con el apellido de las personas cuyo apellido sea johnson
Tablas:Person.Person
Campos: FirstName, LastName*/

SELECT CONCAT(FirstName, ' ', LastName) AS nombreCompleto FROM Person.Person WHERE LastName like 'johnson' 

/*Mostrar todos los productos cuyo precio sea inferior a 150$ de color rojo o cuyo precio sea mayor a 500$ de color
negro
Tablas:Production.Product
Campos: ListPrice, Color*/

SELECT
ListPrice as precio, 
Color as color
FROM Production.Product
WHERE 
	(ListPrice < 150 AND Color like 'red')
	or 
	(ListPrice>500 and Color like 'black')

/*Mostrar el código, fecha de ingreso y horas de vacaciones de 
los empleados ingresaron a partir del año 2000
Tablas: HumanResources.Employee
Campos: BusinessEntityID, HireDate, VacationHours*/

SELECT BusinessEntityID, HireDate, VacationHours, YEAR(HireDate) as año FROM HumanResources.Employee WHERE  YEAR(HireDate) >= 2000

/*Mostrar el nombre, número de producto, precio de lista 
y el precio de lista incrementado en un 10% de los
productos cuya fecha de fin de venta sea anterior al día de hoy
Tablas:Production.Product
Campos: Name, ProductNumber, ListPrice, SellEndDate*/

SELECT 
Production.Product.Name as nombre, 
ProductNumber as nombreProducto, 
ListPrice as precio,
SellEndDate as fechaVenta,
ListPrice + (ListPrice *0.10) as precioAumentado
FROM Production.Product where   SellEndDate <  GETDATE()

/*Mostrar los representantes de ventas (vendedores) 
que no tienen definido el número de territorio
Tablas: Sales.SalesPerson
Campos: TerritoryID, BusinessEntityID*/

SELECT TerritoryID, BusinessEntityID FROM Sales.SalesPerson WHERE TerritoryID IS NULL

/*Mostrar el peso de todos los artículos. 
si el peso no estuviese definido, reemplazar por cero
Tablas:Production.Product
Campos: Weight*/

SELECT ISNULL(Production.Product.Weight,0) AS Peso FROM Production.Product --ISNULL REMPLACE LOS NULL POR NUMERO QUE LE INDIQUES