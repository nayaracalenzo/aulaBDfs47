CREATE TABLE autores (
id SERIAL PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
nacionalidade VARCHAR(30) NOT NULL
);

CREATE TABLE livros (
id SERIAL PRIMARY KEY,
isbn INTEGER UNIQUE,
titulo VARCHAR(100) NOT NULL,
ano INTEGER,
editora VARCHAR(30),
autores_id INTEGER,
CONSTRAINT fk_autores FOREIGN KEY (autores_id) REFERENCES autores(id) 
);

SELECT * FROM autores;

INSERT INTO autores (nome, nacionalidade) VALUES 
('Paulo Coelho', 'Brasileiro'), 
('Clarice Lispector', 'Ucrâniana'),
('Mauricio de Sousa', 'Brasileiro');

SELECT nome FROM autores;

SELECT * FROM autores WHERE nacionalidade = 'Brasileiro';

CREATE TABLE genero (
id SERIAL PRIMARY KEY,
nome VARCHAR(30) NOT NULL UNIQUE
);


