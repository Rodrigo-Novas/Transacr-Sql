/*3) Mostrar el o los códigos del producto mas caro
Tablas:Production.Product
Campos: ProductID,ListPrice*/
select
ProductID,
ListPrice
from
Production.Product
where ListPrice = (select max(listPrice) from Production.Product)

 /*4) Mostrar el producto más barato de cada subcategoría. 
 mostrar subcategoría, código de producto
 y el precio de lista más barato ordenado por subcategoría
Tablas:Production.Product
Campos: ProductSubcategoryID, ProductID, ListPrice*/
SELECT		p1.ProductSubcategoryID, p1.ProductID, p1.ListPrice

FROM		Production.Product p1

WHERE		ListPrice = (	SELECT	MIN (ListPrice) 

	FROM		Production.Product p2

	WHERE		p2.ProductSubcategoryID = p1.ProductSubcategoryID 
	)

ORDER BY	p1.ProductSubcategoryID;


/*3) Mostrar la cantidad de personas que no son vendedores
Tablas: Person.Person, Sales.SalesPerson
Campos: BusinessEntityID*/
select
BusinessEntityID
from
Person.Person P
WHERE NOT EXISTS (SELECT 1 FROM Sales.SalesPerson S WHERE P.BusinessEntityID = S.BusinessEntityID)

/*4) Mostrar todos los vendedores (nombre y apellido) 
que no tengan asignado un territorio de ventas
Tablas: Person.Person, Sales.SalesPerson
Campos: BusinessEntityID, TerritoryID, LastName, FirstName*/

select
LastName,
FirstName
from 
Person.Person p
where not exists (select 1 from Sales.SalesPerson s where p.BusinessEntityID = s.BusinessEntityID and s.TerritoryID is null )


/*3) Mostrar los nombres de los diez productos más caros
 Tablas: Production.Product
 Campos: ListPrice*/

select
Name
from
Production.Product
where ListPrice in (select top 10 listPrice from Production.Product order by 1 desc)  


 /*4) Mostrar aquellos productos cuya cantidad 
 de pedidos de venta sea igual o superior a 20
 Tablas: Production.Product, Sales.SalesOrderDetail
 Campos: Name, ProductID , OrderQty*/
 select
 name,
 ProductID
 from
 Production.Product 
 where ProductID in (select ProductID from Sales.SalesOrderDetail where OrderQty >=20)


 /*2) Mostrar los clientes ubicados en un territorio no cubierto por ningún vendedor
 Tablas: Sales.Customer, Sales.SalesPerson
 Campos: TerritoryID*/

 select
*
 from
 sales.Customer
 where TerritoryID <> all (select TerritoryID from sales.customer)


 /*3) Listar los productos cuyos precios de venta sean mayores
 o iguales que el precio de venta
 máximo de cualquier subcategoría de producto.
 Tablas: Production.Product*/
SELECT Name producto

FROM Production.Product

WHERE ListPrice >= ANY (

							SELECT		MAX (ListPrice)

							FROM		Production.Product

							GROUP BY	ProductSubcategoryID

						);



	
