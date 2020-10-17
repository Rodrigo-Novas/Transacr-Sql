--Operadores

/*Mostrar el código, fecha de ingreso y 
horas de vacaciones de los empleados ingresaron a partir del año 2000
Tablas: HumanResources.Employee
Campos: BusinessEntityID, HireDate, VacationHours*/
select
e.BusinessEntityID as idEntitidad,
e.HireDate as fechaEntrada,
e.VacationHours as horasVacaciones
from
HumanResources.Employee e
where year(e.HireDate) >= '2000'

/*7) Mostrar el nombre, número de producto, 
precio de lista y el precio de lista incrementado en un 10% de los
productos cuya fecha de fin de venta sea anterior al día de hoy
Tablas:Production.Product
Campos: Name, ProductNumber, ListPrice, SellEndDate*/

select
p.Name as nombre,
p.ProductNumber as numeroProducto,
p.ListPrice as precioLista,
p.ListPrice +(p.ListPrice * 0.10) as lista10
from
Production.Product p
where p.SellEndDate<GETDATE()

/*1) Mostrar los representantes de ventas 
(vendedores) que no tienen definido el número de territorio
Tablas: Sales.SalesPerson
Campos: TerritoryID, BusinessEntityID*/

select
p.BusinessEntityID as idEntidad,
p.TerritoryID as idTerritorio
from
Sales.SalesPerson p
where p.TerritoryID is null

/*2) Mostrar el peso de todos los artículos. 
si el peso no estuviese definido, reemplazar por cero
Tablas:Production.Product
Campos: Weight*/

select
case
	when p.Weight is null then 0
	else
	p.Weight
end as peso
from
Production.Product p
order by p.Weight asc; --lo pongo para ver mejor 

--Criterios de seleccion
--between
/*3) Mostrar el la fecha,numero de version y 
subtotal de las ventas efectuadas en los años
2005 y 2006
Tablas: Sales.SalesOrderHeader
Campos: OrderDate, AccountNumber, SubTotal*/
select
year(s.OrderDate) as fechaOrden,
s.AccountNumber as numeroCuenta,
s.SubTotal as subTotal
from
Sales.SalesOrderHeader s
where year(s.OrderDate) between  '2005' and '2006'


/*4) Mostrar todos los productos cuyo Subtotal no esté entre 50 y 70
Tablas: Sales.SalesOrderHeader
Campos: OrderDate, AccountNumber, SubTotal*/
select
s.OrderDate as fechaOrden,
s.AccountNumber as numeroCuenta,
s.SubTotal as subTotal
from
Sales.SalesOrderHeader s
where s.SubTotal not between 50 and 70

--In
/*1) Mostrar los códigos de venta y producto, 
cantidad de venta y precio unitario de los
artículos 750, 753 y 770
Tablas: Sales.SalesOrderDetail
Campos: SalesOrderID, OrderQty, ProductID, UnitPrice*/

select
s.SalesOrderID as idSales,
s.OrderQty as orden,
s.ProductID as idProducto,
s.UnitPrice as precioUnitario
from
Sales.SalesOrderDetail s
where s.ProductID in (750, 753 , 770)

/*2) Mostrar todos los productos cuyo color sea verde, blanco y azul
Tablas: Production.Product
Campos: Color*/

select
p.Color
from
Production.Product p
where p.Color in('green','white','blue')


/*1) Mostrar las personas ordenadas primero por su apellido y luego por su nombre
 Tablas:Person.Person
 Campos: Firstname, Lastname*/
 select
 distinct
 p.FirstName as nombre,
 p.LastName as apellido
 from
 Person.Person p
 order by p.LastName asc, p.FirstName asc

 /*2) Mostrar cinco productos más caros y su nombre ordenado en forma alfabética
 Tablas:Production.Product
 Campos: Name, ListPrice*/

 select
 top 5
 p.Name as nombre,
 p.ListPrice as precioLista
 from
 Production.Product p
 order by nombre asc;