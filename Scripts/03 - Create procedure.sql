/*
IF EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE TYPE = 'P'  AND NAME = 'SP_TOTAL_ORDER')
	BEGIN
		DROP PROCEDURE SP_TOTAL_ORDER
	END

GO

CREATE PROCEDURE SP_CALCULATE_TOTAL_ORDER
    @p_cod_order INT,						-- Código do pedido de entrada
    @p_total_value DECIMAL(10, 2) OUTPUT	-- Valor total calculado (parâmetro de saída)
AS
BEGIN    
    DECLARE @total DECIMAL(10, 2) = 0;		-- Variável para armazenar o valor total temporário

    -- Soma o valor total com base na quantidade e preço unitário dos itens do pedido
    SELECT @total = SUM(quantity * unit_price)
    FROM tab_orders_item
    WHERE cod_order = @p_cod_order;

    -- Atribui o valor calculado ao parâmetro de saída
    SET @p_total_value = @total;
END
*/

IF EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE TYPE = 'P'  AND NAME = 'sp_Order')
	BEGIN
		DROP PROCEDURE sp_Order
	END

GO

CREATE PROCEDURE sp_Order
    @cod_order INT  -- Parâmetro para o código do pedido
AS
BEGIN
    -- Seleciona as informações do cliente e do pedido
    SELECT o.cod_order
         , c.cod_client
         , c.name AS name_client
         , c.address
         , c.phone
         , c.email
         , o.date_order
         , o.total_value
    FROM tab_orders o
    INNER JOIN tab_clients c 
	  ON (o.cod_client = c.cod_client)
    WHERE o.cod_order = @cod_order;
	
    -- Seleciona os itens do pedido
    /*SELECT oi.cod_item_order
         , p.cod_product
         , p.name AS name_product
         , p.description
         , oi.quantity
         , oi.unit_price
         , (oi.quantity * oi.unit_price) AS total_item
    FROM tab_orders_item oi
    INNER JOIN tab_item p 
	  ON (oi.cod_product = p.cod_product)
    WHERE oi.cod_order = @cod_order;*/
END;
