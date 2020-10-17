/*6) Mostrar los precios de venta de aquellos productos 
donde el precio de venta sea inferior al precio de lista
recomendado para ese producto ordenados por nombre de producto
Tablas: Sales.SalesOrderDetail, Production.Product
Campos: ProductID, Name, ListPrice, UnitPrice*/
SELECT
p.Name as nombre,
s.UnitPrice AS precio
FROM
Sales.SalesOrderDetail S INNER JOIN Production.Product P 
ON S.ProductID = P.ProductID
where p.ListPrice > s.UnitPrice
/*7) Mostrar todos los productos que tengan igual precio. 
Se deben mostrar de a pares, código y nombre de cada uno
de los dos productos y el precio de ambos.ordenar por precio en forma descendente
Tablas:Production.Product
Campos: ProductID, ListPrice, Name*/
select
p1.Name,
p1.ListPrice,
p2.Name,
p2.ListPrice
from 
Production.Product p1 inner join Production.Product p2 on p1.ListPrice = p2.ListPrice
where p1.ProductID>p2.ProductID
ORDER BY	p1.ListPrice DESC;

/*8) Mostrar el nombre de los productos y de los proveedores cuya
subcategoría es 15 ordenados por nombre de
proveedor
Tablas: Production.Product, Purchasing.ProductVendor, Purchasing.Vendor
Campos: Name ,ProductID, BusinessEntityID, ProductSubcategoryID*/
select
p.Name as nombreProd,
v.Name as nombreProv
from
Production.Product p inner join Purchasing.ProductVendor pv on pv.ProductID= p.ProductID
inner join Purchasing.Vendor v on v.BusinessEntityID= pv.BusinessEntityID
where p.ProductSubcategoryID = 15 
order by v.Name asc
/*9) Mostrar todas las personas (nombre y apellido) y 
en el caso que sean empleados mostrar también el login id, sino
mostrar null
Tablas: Person.Person, HumanResources.Employee
Campos: FirstName, LastName, LoginID, BusinessEntityID*/

select
p.FirstName as nombre,
p.LastName as apellido,
e.LoginID as loguinId
from
Person.Person p left join HumanResources.Employee e on p.BusinessEntityID = e.BusinessEntityID

--temporales

/*1) Clonar estructura y datos de los campos nombre, 
color y precio de lista de la tabla production.product en una
tabla llamada #Productos
Tablas:Production.Product
Campos: Name, ListPrice, Color*/

select 
Name,
ListPrice,
Color
into #Productos
from
Production.Product


/*2) Clonar solo estructura de los campos identificador, 
nombre y apellido de la tabla person.person en una tabla
llamada #Personas
Tablas: Person.Person
Campos: BusinessEntityID, FirstName, LastName*/

select
BusinessEntityID,
FirstName,
LastName
into #Personas
from 
Person.Person
/*3) Eliminar si existe la tabla #Productos
Tablas: #Productos*/

drop table #Productos

/*4) Eliminar si existe la tabla #Personas
Tablas: #personas*/
IF OBJECT_ID (N'tempdb..#Personas', N'U') IS NOT NULL
	begin
		DROP TABLE #Personas;
	end
else
begin
print('No existe tabla')
end

 /*5) Crear una CTE con las órdenes de venta
Tablas: Sales.SalesOrderHeader
Campos: SalesPersonID, SalesOrderID, OrderDat*/

;with CTE_VENTA(
	idVenta,
	idOrder,
	orderDate


)
AS
(
	SELECT
	SalesPersonID,
	SalesOrderID,
	OrderDate
	FROM
	Sales.SalesOrderHeader
)
select
*
from
CTE_VENTA