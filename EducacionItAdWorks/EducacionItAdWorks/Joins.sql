/*Mostrar los empleados que también son vendedores
Tablas: HumanResources.Employee, Sales.SalesPerson
Campos: BusinessEntityID*/

SELECT
*
FROM HumanResources.Employee E
JOIN Sales.SalesPerson S
on E.BusinessEntityID = S.BusinessEntityID


/*Mostrar los empleados ordenados alfabéticamente por apellido y por nombre
Tablas: HumanResources.Employee, Person.Person
Campos: BusinessEntityID, LastName, FirstName*/


SELECT
E.BusinessEntityID,
P.BusinessEntityID,
P.LastName,
P.FirstName
FROM HumanResources.Employee E
JOIN Person.Person P
ON E.BusinessEntityID= E.BusinessEntityID
ORDER BY
P.LastName ASC,
P.FirstName ASC;


/*Mostrar el código de logueo, número de territorio y 
sueldo básico de los vendedores
Tablas: HumanResources.Employee, Sales.SalesPerson
Campos: LoginID, TerritoryID, Bonus, BusinessEntityID
*/

select
e.LoginID,
s.TerritoryID,
s.Bonus
from HumanResources.Employee E
join Sales.SalesPerson S
on s.BusinessEntityID = e.BusinessEntityID

/*Mostrar los productos que sean ruedas
Tablas: Production.Product, Production.ProductSubcategory
Campos: Name, ProductSubcategoryID*/

select
p.name,
ps.Name
from Production.Product p
join Production.ProductSubcategory ps
on p.ProductSubcategoryID = ps.ProductSubcategoryID
where ps.name like '%[w-W]heels%'

/*Mostrar los nombres de los productos que no son bicicletas
Tablas:Production.Product, Production.ProductSubcategory
Campos: Name, ProductSubcategoryID*/


select
p.Name,
ps.name
from
production.Product p
join Production.ProductSubcategory ps
on ps.ProductSubcategoryID = ps.ProductSubcategoryID
where ps.Name not like '%Bike%'


/*Mostrar los precios de venta de aquellos 
productos donde el precio de venta sea inferior al precio de lista
recomendado para ese producto ordenados por nombre de producto
Tablas: Sales.SalesOrderDetail, Production.Product
Campos: ProductID, Name, ListPrice, UnitPrice*/

select
p.ListPrice,
s.UnitPrice,
p.Name
from
Sales.SalesOrderDetail s
inner join production.product p
on s.ProductID = p.ProductID
where
s.UnitPrice < p.ListPrice
order by
p.Name asc

/* Mostrar todos los productos que tengan igual precio. 
Se deben mostrar de a pares, código y nombre de cada uno
de los dos productos y el precio de ambos.ordenar por precio en forma descendente
Tablas:Production.Product
Campos: ProductID, ListPrice, Name*/

SELECT
P1.ProductID,
P1.Name,
P1.ListPrice,
P2.ProductID,
P2.Name,
P2.ListPrice
FROM
Production.Product P1
JOIN Production.Product P2
ON P1.ListPrice = P2.ListPrice
WHERE P1.ProductID > P2.ProductID
ORDER BY P1.ListPrice DESC,
		P2.ListPrice DESC;

