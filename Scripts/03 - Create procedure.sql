IF EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE TYPE = 'P'  AND NAME = 'SP_TOTAL_ORDER')
	BEGIN
		DROP PROCEDURE SP_TOTAL_ORDER
	END

GO

CREATE PROCEDURE SP_CALCULATE_TOTAL_ORDER
    @p_cod_order INT,						-- C�digo do pedido de entrada
    @p_total_value DECIMAL(10, 2) OUTPUT	-- Valor total calculado (par�metro de sa�da)
AS
BEGIN    
    DECLARE @total DECIMAL(10, 2) = 0;		-- Vari�vel para armazenar o valor total tempor�rio

    -- Soma o valor total com base na quantidade e pre�o unit�rio dos itens do pedido
    SELECT @total = SUM(quantity * unit_price)
    FROM tab_orders_item
    WHERE cod_order = @p_cod_order;

    -- Atribui o valor calculado ao par�metro de sa�da
    SET @p_total_value = @total;
END