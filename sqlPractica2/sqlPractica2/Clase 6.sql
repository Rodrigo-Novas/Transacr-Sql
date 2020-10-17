--1)Crear una función que devuelva
--el promedio de los productos.
--Tablas: Production.Product
--Campos: ListPrice

go
create function dbo.fPromedio()
returns money
as
begin

declare @promedio money

select
@promedio= avg(ListPrice) 
from
Production.Product
return @promedio
end
go
select dbo.fPromedio() as promedio



--3) Crear una función que dado un código devuelva 
--la cantidad de productos vendidos o cero si no se ha vendido.
--Tablas: Sales.SalesOrderDetail
--Campos:ProductID, OrderQty
go
CREATE FUNCTION dbo.FN_CantidadVentasProductos(@codigoProducto INT) 
RETURNS INT
AS
 BEGIN
	   DECLARE @total INT;

	   SELECT 
			@total = SUM(OrderQty)
	   FROM 
			Sales.SalesOrderDetail
	   WHERE 
			ProductID= @codigoProducto
	   
	   IF (@total IS NULL)
		  SET @total = 0
	   
	   RETURN @total
 END
GO

SELECT dbo.FN_CantidadVentasProductos(712)




go
select 1/2 as result


--ggg
go
select floor(-1234.321)
--ggg


/*1) Clonar estructura (ProductID, ListPrice) y datos de la tabla 
Production.Product en una tabla llamada Productos.*/


SELECT ProductID, ListPrice
INTO Productos
FROM Production.Product;
GO

/*2) Crear un trigger sobre la tabla Productos llamado TR_ActualizaPrecios 
dónde actualice
la tabla #HistoricoPrecios con los cambios de precio.
Tablas: Productos
Campos: ProductID, ListPrice*/
--select 1 from productos

create trigger TR_ActualizaPrecios on Productos
after update
AS
		UPDATE  P
		SET ListPrice=i.ListPrice
		FROM Productos P	
		INNER JOIN inserted i
		ON P.ProductID=i.ProductID
GO

UPDATE [Production].[Product]
SET ListPrice=20
WHERE ProductID=707


SELECT * FROM Productos
WHERE ProductID=707
GO


/*3) Adaptar el trigger del punto anterior donde*/