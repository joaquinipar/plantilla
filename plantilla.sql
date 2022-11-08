

-- EJEMPLO CURSOR

DECLARE @id char(6)
DECLARE @nombre char(100)

DECLARE mi_cursor CURSOR FOR  -- SE PUEDE PONER tambien asi es reejecutable DECLARE mi_cursor CURSOR LOCAL FOR
SELECT 
	clie_codigo ,
	clie_razon_social 
FROM CLIENTE
ORDER BY 1 ASC 
        
OPEN mi_cursor 
FETCH mi_cursor INTO @id, @nombre 
        
WHILE @@FETCH_STATUS = 0 
	BEGIN
	print @id 
	print @nombre 

	-- proxima iteracion
	FETCH mi_cursor INTO @id, @nombre
END 
CLOSE mi_cursor 
DEALLOCATE mi_cursor 

-- EJEMPLO TRIGGER

CREATE TRIGGER TR
on --GESTION2021.dbo.Item_Factura
instead of -- INSERT O DELETE O UPDATE (O combinados..)
AS
BEGIN
	PRINT 'A'

END



--- VARIABLES ITEM_FACTURA

	DECLARE @item_tipo char(1)
	DECLARE @item_sucursal char(4)
	DECLARE @item_numero char(8)
	DECLARE @item_producto char(8)
	DECLARE @item_cantidad decimal(12,2)
	DECLARE @item_precio decimal(12,2)



INSERT INTO GESTION2021.dbo.Item_Factura
			(item_tipo,
			item_sucursal,
			item_numero,
			item_producto,
			item_cantidad,
			item_precio )
			VALUES
			(
			@item_tipo,
			@item_sucursal,
			@item_numero,
			@item_producto,
			@item_cantidad,
			@item_precio
			)

