IF EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE TYPE = 'P'  AND NAME = 'sp_Order')
	BEGIN
		DROP PROCEDURE sp_Order
	END

GO

CREATE PROCEDURE sp_Order
    @cod_order INT
AS
BEGIN
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
END;
