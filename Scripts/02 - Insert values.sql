Use Pedidos;

-- Cadastrando 5 clientes.
INSERT INTO tab_clients (cod_client, name, address, phone, email) 
VALUES 
(1, 'Antonio Alves', 'Rua Antonio Alves de Tolledo , 1315', '+55(17)991010101', 'antonio.alves@email.com'),
(2, 'Bruno Barreto', 'Rua Maria Dias, 57', '+55(17)991020202', 'bruno.barreto@email.com'),
(3, 'Carlos Costa', 'Rua Carlos Catelli, 22', '+55(17)991030303', 'carlos.costa@email.com'),
(4, 'Daniel Dumont', 'Rua Raul Furquim, 353', '+55(17)991040404', 'daniel.drumont@email.com'),
(5, 'Emilio Esteves', 'Rua Hamileto Stamato, 12', '+55(17)991050505', 'emilio.esteves@email.com');

/****************************************/

-- Cadastrando 3 produtos.
INSERT INTO tab_item (cod_product, name, description, price) 
VALUES 
(1, 'X-Salada', 'Hamburguer, presunto, queijo, alface e tomate', 20.00),
(2, 'X-Bacon', 'Hamburguer, bacon, queijo, alface e tomate', 24.00),
(3, 'X-Tudo', 'Hamburguer, presunto, queijo, ovo, bacon, salsicha, milho, requeijão, alface e tomate', 30.00);

/****************************************/

-- Cadastrando pedido 01 para o cliente 1 (Antonio Alves).
INSERT INTO tab_orders (cod_order, cod_client, date_order, total_value) 
VALUES (1, 1, '2024-10-13', 68.00);

-- Inserindo itens ao pedido 01.
INSERT INTO tab_orders_item (cod_item_order, cod_order, cod_product, quantity, unit_price) 
VALUES
(1, 1, 1, 1, 20.00),	-- 1 un. x-salada (1 * 20,00 = R$ 20,00)
(2, 1, 2, 2, 24.00);	-- 1 un. x-bacon (2 * 24,00 = R$ 48,00)

/****************************************/

-- Cadastrando pedido 02 para o cliente 3 (Carlos Costa).
INSERT INTO tab_orders (cod_order, cod_client, date_order, total_value) 
VALUES (2, 3, '2024-10-14', 138.00);

-- Inserindo itens do pedido 02.
INSERT INTO tab_orders_item (cod_item_order, cod_order, cod_product, quantity, unit_price) 
VALUES
(3, 2, 2, 2, 24.00),  -- 2 un. x-bacon (2 * 24,00 = R$ 48,00)
(4, 2, 3, 3, 30.00);  -- 3 un. x-tudo (3 * 30,00 = R$ 90,00)
