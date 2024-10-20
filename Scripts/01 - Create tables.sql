-- tab_clients (Tabela com os dados de clientes)
CREATE TABLE tab_clients (
    cod_client INT PRIMARY KEY,	-- C�digo do cliente (chave prim�ria)
    name VARCHAR(100),			-- Nome do cliente
    address VARCHAR(255),		-- Endere�o do cliente
    phone VARCHAR(16),			-- Telefone do cliente
    email VARCHAR(100)			-- Email do cliente
);

-- tab_orders (Tabela com o cabecalho dos pedidos)
CREATE TABLE tab_orders (
    cod_order INT PRIMARY KEY,		-- C�digo do pedido (chave prim�ria)
    cod_client INT,					-- C�digo do cliente (chave estrangeira)
    date_order DATE,				-- Data do pedido
    total_value DECIMAL(10, 2),		-- Valor total do pedido
    CONSTRAINT FK_tab_orders_clients FOREIGN KEY (cod_client) REFERENCES tab_clients (cod_client)
);

-- tab_item (Tabela com o cadastro de itens)
CREATE TABLE tab_item (
    cod_product INT PRIMARY KEY,	-- C�digo do produto (chave prim�ria)
    name VARCHAR(100),				-- Nome do produto
    description VARCHAR(255),		-- Descri��o do produto
    price DECIMAL(10, 2)			-- Pre�o do produto
);

-- tab_orders_item (Tabela com os itens do pedido)
CREATE TABLE tab_orders_item (
    cod_item_order INT PRIMARY KEY,		-- C�digo do item do pedido (chave prim�ria)
    cod_order INT,						-- C�digo do pedido (chave estrangeira)
    cod_product INT,					-- C�digo do produto (chave estrangeira)
    quantity INT,						-- Quantidade do item no pedido
    unit_price DECIMAL(10, 2),			-- Pre�o unit�rio do item no pedido
    CONSTRAINT FK_tab_orders_item_orders FOREIGN KEY (cod_order) REFERENCES tab_orders (cod_order),
    CONSTRAINT FK_tab_orders_item_item FOREIGN KEY (cod_product) REFERENCES tab_item (cod_product)
);
