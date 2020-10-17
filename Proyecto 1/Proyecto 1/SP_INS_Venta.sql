

EXEC SP_INS_Venta 2,10  --ejecuta el store procedure 2 y 10 son las variables que coloco abajo

SELECT * FROM Venta  --traigo los registros de venta

CREATE PROC SP_INS_Venta(

	@idProducto int,
	@cantidad int

)
AS


INSERT INTO Venta VALUES(@idProducto, @cantidad,getDate()) --inserta las variables en la tabla 