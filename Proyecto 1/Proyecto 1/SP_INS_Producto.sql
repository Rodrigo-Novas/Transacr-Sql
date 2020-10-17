--no importan las lineas rojas funciona todo ok
--SELECT * FROM Producto

EXEC SP_INS_Producto 'Camisa manga corta', 'Gris', 660

CREATE PROC SP_INS_Producto(

	@descripcion varchar(50),
	@color varchar(20),
	@precio money
)
AS

INSERT INTO Producto values(@descripcion, @color, @precio)