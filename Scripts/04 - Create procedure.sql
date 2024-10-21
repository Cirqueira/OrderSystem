IF EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE TYPE = 'P'  AND NAME = 'sp_OrderDetails')
	BEGIN
		DROP PROCEDURE sp_OrderDetails
	END

GO

CREATE PROCEDURE sp_OrderDetails
    @cod_order INT  -- Parâmetro para o código do pedido
AS
BEGIN   
    SELECT oi.cod_item_order
         , p.cod_product
         , p.name AS name_product
         , p.description
         , oi.quantity
         , oi.unit_price
         , (oi.quantity * oi.unit_price) AS total_item
    FROM tab_orders_item oi
    INNER JOIN tab_item p 
	  ON (oi.cod_product = p.cod_product)
    WHERE oi.cod_order = @cod_order;
END;
