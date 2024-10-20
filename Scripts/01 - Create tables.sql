-- tab_clients (Tabela com os dados de clientes)
CREATE TABLE tab_clients (
    cod_client INT PRIMARY KEY,	-- Código do cliente (chave primária)
    name VARCHAR(100),			-- Nome do cliente
    address VARCHAR(255),		-- Endereço do cliente
    phone VARCHAR(16),			-- Telefone do cliente
    email VARCHAR(100)			-- Email do cliente
);

-- tab_orders (Tabela com o cabecalho dos pedidos)
CREATE TABLE tab_orders (
    cod_order INT PRIMARY KEY,		-- Código do pedido (chave primária)
    cod_client INT,					-- Código do cliente (chave estrangeira)
    date_order DATE,				-- Data do pedido
    total_value DECIMAL(10, 2),		-- Valor total do pedido
    CONSTRAINT FK_tab_orders_clients FOREIGN KEY (cod_client) REFERENCES tab_clients (cod_client)
);

-- tab_item (Tabela com o cadastro de itens)
CREATE TABLE tab_item (
    cod_product INT PRIMARY KEY,	-- Código do produto (chave primária)
    name VARCHAR(100),				-- Nome do produto
    description VARCHAR(255),		-- Descrição do produto
    price DECIMAL(10, 2)			-- Preço do produto
);

-- tab_orders_item (Tabela com os itens do pedido)
CREATE TABLE tab_orders_item (
    cod_item_order INT PRIMARY KEY,		-- Código do item do pedido (chave primária)
    cod_order INT,						-- Código do pedido (chave estrangeira)
    cod_product INT,					-- Código do produto (chave estrangeira)
    quantity INT,						-- Quantidade do item no pedido
    unit_price DECIMAL(10, 2),			-- Preço unitário do item no pedido
    CONSTRAINT FK_tab_orders_item_orders FOREIGN KEY (cod_order) REFERENCES tab_orders (cod_order),
    CONSTRAINT FK_tab_orders_item_item FOREIGN KEY (cod_product) REFERENCES tab_item (cod_product)
);
