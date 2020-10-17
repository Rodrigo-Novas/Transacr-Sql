/*Mostrar los diferentes productos vendidos
Tablas: Sales.SalesOrderDetail
Campos: ProductID*/

SELECT DISTINCT ProductID FROM Sales.SalesOrderDetail



/*Mostrar todos los productos vendidos y ordenados
Tablas: Sales.SalesOrderDetail, Production.WorkOrder
Campos: ProductID*/
--UNION ALL PONE LOS REPETIDOS Y UNION LOS AGRUPO EN UNO SOLO
SELECT ProductID FROM Sales.SalesOrderDetail UNION SELECT ProductID FROM Production.WorkOrder ORDER BY ProductID ASC 
SELECT ProductID FROM Sales.SalesOrderDetail UNION ALL SELECT ProductID FROM Production.WorkOrder ORDER BY ProductID ASC 

 /*Obtener el id y una columna denominada sexo cuyo valores disponibles 
 sean “Masculino” y ”Femenino”
Tablas: HumanResources.Employee
Campos: BusinessEntityID, Gender*/

SELECT
BusinessEntityID, 
Gender, 
(CASE WHEN GENDER = 'M' THEN 'Masculino' ELSE 'Femenino' end) as sexo --tremendo esto papa
FROM HumanResources.Employee 



/*Mostrar el id de los empleados si tiene salario deberá 
mostrarse descendente de lo contrario ascendente
Tablas:HumanResources.Employee
Campos: BusinessEntityID, SalariedFlag*/

SELECT 
BusinessEntityID,
SalariedFlag  
FROM 
HumanResources.Employee 
ORDER BY 
(CASE WHEN SalariedFlag =1 THEN BusinessEntityID END)DESC, 
(CASE WHEN SalariedFlag = 0 THEN BusinessEntityID END) ASC;


--FUNCIONES DE AGREGADO

/* Mostrar la fecha más reciente de venta
Tablas: Sales.SalesOrderHeader
Campos: OrderDate*/SELECT MAX(OrderDate) AS FECHA from Sales.SalesOrderHeader  /*Mostrar el precio más barato de todas las bicicletas
Tablas: Production.Product
Campos: ListPrice, Name*/SELECT MIN(ListPrice) AS precio from Production.Product WHERE NAME LIKE '%Bike%' /*Mostrar la fecha de nacimiento del empleado más joven
Tablas: HumanResources.Employee
Campos: BirthDate*/

select MAX(birthdate) as fechaNac from HumanResources.Employee

/*Mostrar el promedio del listado de precios de productos
Tablas: Production.Product
Campos: ListPrice*/
--Se puede hacer de las dos formas es mas sencilla la segunda
SELECT SUM(ListPrice)/COUNT(ListPrice) as Promedio from Production.Product;

SELECT AVG(ListPrice) AS Promedio FROM Production.Product;


/*Mostrar la cantidad y el total vendido por productos
Tablas: Sales.SalesOrderDetail
Campos: LineTotal*/

SELECT SUM(LineTotal) as total , COUNT(LineTotal) as cantidad FROM Sales.SalesOrderDetail

