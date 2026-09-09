-- ============================================
-- SOLUÇÃO de 01_desafio_criar_banco.md (Partes 2 e 3)
--
-- ⚠️ Isto é a resposta pronta. Só abra depois de tentar criar as tabelas e
-- digitar os INSERTs você mesmo — rodar isto direto pula o aprendizado.
-- Use para: (a) conferir o que você fez, ou (b) resetar do zero se travou.
--
-- Escrito para MySQL, para rodar numa aba de SQL do MySQL Workbench.
-- Veja 00_como_instalar.md para o passo a passo de como instalar e rodar isso.
-- ============================================

-- Rode isto ANTES do resto (cria e "entra" no banco de dados da loja):
CREATE DATABASE IF NOT EXISTS loja;
USE loja;

CREATE TABLE clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(100),
    estado CHAR(2),
    data_nascimento DATE
) ENGINE=InnoDB;

CREATE TABLE produtos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    categoria VARCHAR(50),
    preco DECIMAL(10,2) NOT NULL,
    estoque INT NOT NULL
) ENGINE=InnoDB;

CREATE TABLE pedidos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT NOT NULL,
    data_pedido DATE NOT NULL,
    status VARCHAR(20) NOT NULL, -- 'pendente', 'enviado', 'entregue', 'cancelado'
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
) ENGINE=InnoDB;

CREATE TABLE itens_pedido (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pedido_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
) ENGINE=InnoDB;

-- ============================================
-- DADOS DE EXEMPLO
-- (os IDs são informados manualmente aqui só para ficar previsível nos
-- exercícios; como as colunas são AUTO_INCREMENT, você não precisa informar
-- ID nos seus próprios INSERTs depois — o MySQL gera sozinho)
-- ============================================

INSERT INTO clientes (id, nome, cidade, estado, data_nascimento) VALUES
(1, 'Ana Souza',        'São Paulo',      'SP', '1990-04-12'),
(2, 'Bruno Lima',       'Rio de Janeiro', 'RJ', '1985-11-02'),
(3, 'Carla Mendes',     'Belo Horizonte', 'MG', '1998-01-30'),
(4, 'Diego Alves',      'São Paulo',      'SP', '1979-07-19'),
(5, 'Elisa Torres',     'Curitiba',       'PR', '2001-09-05'),
(6, 'Fabio Nunes',      'Porto Alegre',   'RS', '1992-12-24'),
(7, 'Gabriela Rocha',   'Recife',         'PE', '1988-03-15'),
(8, 'Hugo Martins',     'São Paulo',      'SP', NULL);

INSERT INTO produtos (id, nome, categoria, preco, estoque) VALUES
(1,  'Notebook Pro 15"',      'Eletrônicos', 4500.00, 8),
(2,  'Mouse sem fio',         'Eletrônicos', 79.90,   50),
(3,  'Teclado mecânico',      'Eletrônicos', 320.00,  25),
(4,  'Monitor 24"',           'Eletrônicos', 899.00,  15),
(5,  'Cadeira gamer',         'Móveis',      1200.00, 6),
(6,  'Mesa para escritório',  'Móveis',      750.00,  10),
(7,  'Livro: SQL na prática', 'Livros',      59.90,   40),
(8,  'Livro: Python básico',  'Livros',      49.90,   0),
(9,  'Fone de ouvido',        'Eletrônicos', 199.90,  30),
(10, 'Luminária de mesa',     'Móveis',      89.90,   20),
(11, 'Mochila para notebook', 'Acessórios',  159.00,  12),
(12, 'Suporte para notebook', 'Acessórios',  99.00,   0);

INSERT INTO pedidos (id, cliente_id, data_pedido, status) VALUES
(1, 1, '2026-01-05', 'entregue'),
(2, 2, '2026-01-10', 'entregue'),
(3, 1, '2026-02-02', 'enviado'),
(4, 3, '2026-02-14', 'entregue'),
(5, 4, '2026-03-01', 'cancelado'),
(6, 5, '2026-03-20', 'pendente'),
(7, 2, '2026-04-11', 'entregue'),
(8, 6, '2026-04-18', 'enviado'),
(9, 7, '2026-05-02', 'entregue'),
(10, 1, '2026-05-25', 'pendente');

INSERT INTO itens_pedido (id, pedido_id, produto_id, quantidade, preco_unitario) VALUES
(1,  1, 1, 1, 4500.00),
(2,  1, 2, 2, 79.90),
(3,  2, 7, 3, 59.90),
(4,  3, 4, 1, 899.00),
(5,  3, 9, 1, 199.90),
(6,  4, 5, 1, 1200.00),
(7,  4, 6, 1, 750.00),
(8,  5, 1, 1, 4500.00),
(9,  6, 3, 2, 320.00),
(10, 7, 2, 1, 79.90),
(11, 7, 9, 2, 199.90),
(12, 8, 7, 5, 59.90),
(13, 9, 11, 1, 159.00),
(14, 9, 4, 2, 899.00),
(15, 10, 3, 1, 320.00);
