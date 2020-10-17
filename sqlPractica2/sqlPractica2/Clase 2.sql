/*Laboratorio Distinct
1) Mostrar los diferentes productos vendidos
Tablas: Sales.SalesOrderDetail
Campos: ProductID
Laboratorio Union*/
select
distinct
s.ProductID
from
Sales.SalesOrderDetail s
where s.OrderQty=3 and s.LineTotal=4


/*1) Mostrar todos los productos vendidos y ordenados
Tablas: Sales.SalesOrderDetail, Production.WorkOrder
Campos: ProductID*/

select
ProductID
from
Sales.SalesOrderDetail 
union all 
select
ProductID
from
Production.WorkOrder
/*2) Mostrar los diferentes productos vendidos y ordenados
Tablas: Sales.SalesOrderDetail, Production.WorkOrder
Campos: ProductID*/
select
ProductID
from
Sales.SalesOrderDetail 
union
select
ProductID
from
Production.WorkOrder

/*Laboratorio Expresión Case
1) Obtener el id y una columna denominada sexo cuyo valores disponibles sean “Masculino” y ”Femenino”
Tablas: HumanResources.Employee
Campos: BusinessEntityID, Gender*/
select
BusinessEntityID,
case Gender 
	WHEN 'M' THEN 'Masculino'
	else 'Femenino'
end as genero
from
HumanResources.Employee
/*2) Mostrar el id de los empleados si tiene salario 
deberá mostrarse descendente de lo contrario ascendente
Tablas:HumanResources.Employee
Campos: BusinessEntityID, SalariedFlag*/
select
BusinessEntityID,
SalariedFlag
from
HumanResources.Employee e
order by case e.SalariedFlag when 1 then e.BusinessEntityID end asc,
		 case e.SalariedFlag when 0 then e.BusinessEntityID end desc;

/*3) Mostrar la fecha de nacimiento del empleado más joven
Tablas: HumanResources.Employee
Campos: BirthDate*/

select
min(e.BirthDate) as fecha
from
HumanResources.Employee e


/*4) Mostrar el promedio del listado de precios de productos
Tablas: Production.Product
Campos: ListPrice*/
select
avg(listprice) as promedio
from 
Production.Product p

/*5) Mostrar la cantidad y el total vendido por productos
Tablas: Sales.SalesOrderDetail
Campos: LineTotal*/
	
	select
	COUNT(lineTotal) as cantLine,
	SUM(lineTotal) as total
	from
	sales.SalesOrderDetail


--Group by
/*3) Mostrar los productos y el
total vendido de cada uno de ellos, ordenados por el total vendido
Tablas: Sales.SalesOrderDetail
Campos: ProductID, LineTotal*/
select
ProductID,
sum(LineTotal) totalLine
from
Sales.SalesOrderDetail
group by ProductID
order by totalLine

/*4) Mostrar el promedio vendido por factura.
Tablas: Sales.SalesOrderDetail
Campos: SalesOrderID, LineTotal*/

select
SalesOrderID,
avg(lineTotal) as totalLine
from
Sales.SalesOrderDetail
group by SalesOrderID

--having

/*Mostrar las subcategorías de los productos que 
tienen dos o más productos que cuestan menos de $150
Tablas: Production.Product
Campos: ProductSubcategoryID, ListPrice*/


SELECT  ProductSubcategoryID
		,COUNT(ProductSubcategoryID) AS Cantidad
 FROM Production.Product
 WHERE ListPrice>150
 GROUP BY ProductSubcategoryID
 HAVING COUNT(ProductSubcategoryID)>2
/*4) Mostrar todos los códigos de subcategorías existentes 
junto con la cantidad para los productos cuyo precio de
lista sea mayor a $ 70 y el precio promedio sea mayor a $ 300.
Tablas: Production.Product
Campos: ProductSubcategoryID, ListPrice*/
SELECT
ProductSubcategoryID,
COUNT(PRODUCTSUBCATEGORYID) AS CONTPRODUCT
FROM
Production.Product
WHERE ListPrice >70
GROUP BY ProductSubcategoryID
HAVING AVG(ListPrice) > 300


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
