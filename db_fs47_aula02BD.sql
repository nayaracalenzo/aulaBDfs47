CREATE TABLE clientes ( 
id SERIAL PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
email VARCHAR(50) UNIQUE NOT NULL, 
senha VARCHAR(10) NOT NULL
);

-- LEITURA DE DADOS (SELECT)
SELECT * FROM clientes;

-- ADICIONANDO COLUNA
ALTER TABLE clientes ADD COLUMN telefone VARCHAR(11);

-- EXCLUINDO COLUNA
ALTER TABLE clientes DROP COLUMN telefone;

-- ALTERANDO CONSTRAINT (REGRA)
ALTER TABLE clientes ALTER COLUMN telefone SET NOT NULL;

-- ALTERANDO TIPO DE DADO
ALTER TABLE clientes ALTER COLUMN telefone TYPE VARCHAR(12);

-- RENOMEAR COLUNA
ALTER TABLE clientes RENAME COLUMN nome TO nome_completo;

-- DELETAR TABELA 
DROP TABLE clientes;


-- LINGUAGEM DE MANIPULAÇÃO DE DADOS (DML)

-- INSERINDO DADOS
INSERT INTO clientes (nome, email, senha, telefone) VALUES 
('Mateus', 'mateus2@teste.com', 'admin123', '85912345678'), 
('Mota', 'mota2@teste.com', 'admin', '85999999999');

INSERT INTO clientes (nome, email, senha, telefone) VALUES
('João Silva', 'joao.silva@email.com', 'senha123', '11999998888'),
('Maria Souza', 'maria.souza@email.com', 'abc123456', NULL),
('Carlos Lima', 'carlos.lima@email.com', 'car123lim', '21987654321'),
('Ana Oliveira', 'ana.oliveira@email.com', 'anaol123', NULL),
('Pedro Rocha', 'pedro.rocha@email.com', 'pedro321', '11988887777'),
('Julia Mendes', 'julia.mendes@email.com', 'jul456men', NULL),
('Fernanda Reis', 'fernanda.reis@email.com', 'fern321', '31999990000'),
('Ricardo Alves', 'ricardo.alves@email.com', 'ricardo1', NULL),
('Bruna Costa', 'bruna.costa@email.com', 'bru654321', '41987654321'),
('Lucas Martins', 'lucas.martins@email.com', 'luc123456', NULL);


-- SELECT COM FILTRO (WHERE)
SELECT * FROM clientes WHERE nome = 'Maria';

-- SELECT COM FILTRO POR BUSCA (LIKE) 
-- % depois -> começa com
-- % antes -> termina com
-- %antesEdepois -> começa ou termina com 
SELECT * FROM clientes WHERE nome LIKE '%M%';

-- CRIE UMA TABELA DE PRODUTOS PASSANDO OS ATRIBUTOS 
-- id, nome, codigo, valor unitario
-- nenhum atributo pode ser nulo
-- codigo é unico

CREATE TABLE produtos (
id SERIAL PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
codigo VARCHAR(10) UNIQUE NOT NULL,
valor_unitario DECIMAL(6,2) NOT NULL
);

-- CRIE 1 INSERT COM 3 MEDICAMENTOS 

INSERT INTO produtos (nome, codigo, valor_unitario) VALUES 
('dipirona', '001', '10.00'),
('mounjaro', '002', '50.00'),
('paracetamol', '003', '8.00');

SELECT * FROM produtos; 

UPDATE produtos SET codigo = '010' WHERE id = 1;

UPDATE produtos SET valor_unitario = 10.00;

-- Dá erro pois viola a regra de valor único para email
UPDATE clientes SET email = 'nayara@teste.com.br';

DELETE FROM produtos WHERE nome = 'dipirona';

-- consulta de uma coluna da tabela
SELECT nome FROM clientes;

-- Select com duas condições 
SELECT * FROM clientes WHERE nome = 'Mota' AND email = 'mota2@teste.com' ;

-- renomeando uma coluna (AS)
SELECT COUNT(*) AS clientes FROM clientes;

INSERT INTO produtos (nome, codigo, valor_unitario) VALUES 
('balança', '004', 100.00),
('cloridrato de ciclobenzaprina', '005', 15.00 ),
('shampoo Dove', '100', 25.00);

--SOMANDO TODOS DA COLUNA valor_unitario
SELECT SUM(valor_unitario) FROM produtos;

--SOMANDO COM FILTRO
SELECT SUM(valor_unitario) FROM produtos WHERE nome IN ('shampoo Dove', 'balança');

-- SELECT COM MÉDIA 
SELECT AVG(valor_unitario) AS media_valor_unitario FROM produtos;

-- SELECT MAX 
SELECT nome, valor_unitario FROM produtos WHERE valor_unitario =
(SELECT MAX(valor_unitario) FROM produtos);


-- SELECT COM ORDENAÇÃO E LIMITE DE LINHAS
SELECT nome, valor_unitario FROM produtos ORDER BY valor_unitario DESC LIMIT 1;


ALTER TABLE produtos ADD COLUMN categoria VARCHAR(20);

ALTER TABLE produtos DROP COLUMN categoria;

SELECT * FROM produtos;

-- ALTERAR O CAMPO CATEGORIA PASSANDO MEDICAMENTO, COSMETICO, UTILITARIO

UPDATE produtos SET categoria = 'medicamento' WHERE id IN (2,3,5);

UPDATE produtos SET categoria = 'cosmetico' WHERE id = 6;

UPDATE produtos SET categoria = 'utilitario' WHERE id = 4;

-- faça uma consulta contando quantos itens tem em cada categoria (group by)