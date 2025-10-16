CREATE TABLE pedidos (
id SERIAL PRIMARY KEY, 
cliente_id INT NOT NULL,
data TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

SELECT * FROM pedido_item;


-- 1 insert com 3 pedidos
INSERT INTO pedidos (cliente_id) VALUES (1);

CREATE TABLE pedido_item (
id SERIAL PRIMARY KEY,
pedido_id INT NOT NULL,
produto_id INT NOT NULL,
quantidade INT NOT NULL CHECK (quantidade > 0),
FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

INSERT INTO pedido_item (pedido_id, produto_id, quantidade) VALUES (1, 4, 1), (1, 6, 2);


INSERT INTO pedido_item (pedido_id, produto_id, quantidade) VALUES (3, 4, 1);

-- join 
-- 1º SELECT 
-- 2º colunas das duas tabelas 
-- 3º qual tabela do select (...FROM nomeTabela)
-- 4º qual tipo de join (INNER JOIN, RIGHT JOIN, LEFT JOIN OU FULL JOIN)
-- 5º qual a tabela de junção 
-- 6 º o relacionamento (... ON)
SELECT pedidos.id, clientes.nome FROM pedidos LEFT JOIN clientes
ON pedidos.cliente_id = clientes.id;

-- JOIN ITENS DO PEDIDO

SELECT * FROM pedido_item

-- JOIN PEGANDO NOME DOS PRODUTOS
SELECT pedido_item.pedido_id, STRING_AGG(produtos.nome, ', ') AS produtos FROM pedido_item INNER JOIN produtos
ON pedido_item.produto_id = produtos.id GROUP BY pedido_item.pedido_id;