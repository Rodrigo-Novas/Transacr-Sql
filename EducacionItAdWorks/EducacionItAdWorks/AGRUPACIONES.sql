--CLAUSULA HAVING

--SELECT
--ProductID
--,MAX(LineTotal) as Maximo
--FROM
--Sales.SalesOrderDetail
--WHERE
--ProductID>995
--GROUP BY
--ProductID
--HAVING
--MAX(LineTotal)>3000;


/*Mostrar el código de subcategoría y 
el precio del producto más barato de cada una de ellas
Tablas: Production.Product
Campos: ProductSubcategoryID, ListPrice*/
SELECT ProductSubcategoryID, MIN(ListPrice) FROM Production.Product group by ProductSubcategoryID

SELECT ProductSubcategoryID, ListPrice, ProductID 
FROM Production.Product PP
WHERE ListPrice=(
					SELECT MIN(ListPrice) ListPrice
					FROM Production.Product PP1
					WHERE PP.ProductSubcategoryID=PP1.ProductSubcategoryID 
			    )
ORDER BY ProductSubcategoryID


/*Mostrar los productos y la cantidad total vendida de cada uno de ellos
Tablas: Sales.SalesOrderDetail
Campos: ProductID, OrderQty*/


SELECT ProductID, SUM(OrderQty) AS CANTIDAD FROM Sales.SalesOrderDetail group by ProductID;

/*Mostrar el promedio vendido por factura.
Tablas: Sales.SalesOrderDetail
Campos: SalesOrderID, LineTotal*/

SELECT SalesOrderID, AVG(LineTotal) AS PROMEDIO FROM Sales.SalesOrderDetail SS GROUP BY SalesOrderID;

--HAVING

--WHERE opera sobre registros individuales, 
--mientras que HAVING lo hace sobre un grupo de registros.
/*Deberíamos usar HAVING solo cuando se vea implicado el uso de funciones de grupo 
(AVG, SUM, COUNT, MAX, MIN), 
debido a que con WHERE no podemos realizar condiciones que impliquen estas funciones*/


/*Mostrar todas las facturas realizadas y el total facturado
de cada una de ellas ordenado por número de factura
pero sólo de aquellas órdenes superen un total de $10.000
Tablas: Sales.SalesOrderDetail
Campos: SalesOrderID, LineTotal*/

SELECT SalesOrderID, MAX(LineTotal) AS TOTAL FROM Sales.SalesOrderDetail GROUP BY SalesOrderID HAVING MAX(LineTotal) > 10000


/*Mostrar la cantidad de facturas que vendieron más de 20 unidades
Tablas: Sales.SalesOrderDetail
Campos: SalesOrderID, OrderQty*/SELECT SalesOrderID, SUM(OrderQty) as cantidadTotal FROM SALES.SalesOrderDetail GROUP BY SalesOrderID HAVING SUM(OrderQty)>20/*Mostrar las subcategorías de los productos que 
tienen dos o más productos que cuestan menos de $150
Tablas: Production.Product
Campos: ProductSubcategoryID, ListPrice*/


SELECT ProductSubcategoryID, COUNT(ProductSubcategoryID) AS cantidad FROM Production.Product WHERE ListPrice<150  GROUP BY ProductSubcategoryID HAVING COUNT(ProductSubcategoryID)>= 2

/*Mostrar todos los códigos de subcategorías existentes
junto con la cantidad para los productos cuyo precio de
lista sea mayor a $ 70 y el precio promedio sea mayor a $ 300.
Tablas: Production.Product
Campos: ProductSubcategoryID, ListPrice*/

SELECT ProductSubcategoryID, COUNT(ProductSubcategoryID) AS CANTIDAD FROM Production.Product WHERE ListPrice>70 GROUP BY ProductSubcategoryID HAVING AVG(ListPrice)> 300


/*
ROLLUP ( )
Genera filas de agregado mediante la cláusula GROUP BY simple, más filas de subtotal o de super
agregado, así como una fila de total general. El número de agrupaciones que se devuelve es igual
al número de expresiones de la <lista de elementos compuestos> más uno. Considere, por
ejemplo, la siguiente instrucción:*/

SELECT
ProductID
,MAX(LineTotal) as Maximo
FROM
Sales.SalesOrderDetail
WHERE
ProductID>995
GROUP BY
ProductID with ROLLUP
HAVING
MAX(LineTotal)>3000;

/*)Mostrar el número de factura, el monto vendido, 
y al final, totalizar la facturación.
Tablas: Sales.SalesOrderDetail
Campos: SalesOrderID, UnitPrice, OrderQty*/

SELECT 
SalesOrderID, 
SUM(UnitPrice*OrderQty) AS Total
FROM 
Sales.SalesOrderDetail
group by 
SalesOrderID with rollup
