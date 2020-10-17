--Funciona sin pasarle parametros ya que estoy iniializando en cero a variable

CREATE PROC SP_SEL_Productos(
	@idProducto int = 0 --lo inicializamos en cero por si algun producto no viene en la tabla	
)
AS

IF @idProducto >0
	SELECT * FROM Producto where idProducto = @idProducto
else
	SELECT * FROM Producto ORDER BY descripcion