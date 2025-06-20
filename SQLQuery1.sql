-- Projeto doceria Dulcem
CREATE DATABASE Dulcem;
USE Dulcem;


-- Tabela de Categorias
CREATE TABLE Categorias (
    Id INT PRIMARY KEY IDENTITY,
    Nome VARCHAR(50) NOT NULL
);

-- Tabela de Produtos
CREATE TABLE Produtos (
    Id INT PRIMARY KEY IDENTITY,
    Nome VARCHAR(100) NOT NULL,
    Preco DECIMAL(10, 2) NOT NULL,
    Estoque INT DEFAULT 0,
    CategoriaId INT,
    FOREIGN KEY (CategoriaId) REFERENCES Categorias(Id)
);

-- Tabela de Clientes
CREATE TABLE Clientes (
    Id INT PRIMARY KEY IDENTITY,
    Nome VARCHAR(100),
    Email VARCHAR(100),
    Telefone VARCHAR(20)
);

-- Tabela de Pedidos
CREATE TABLE Pedidos (
    Id INT PRIMARY KEY IDENTITY,
    ClienteId INT,
    DataPedido DATETIME DEFAULT GETDATE(),
    Status NVARCHAR(20) DEFAULT 'Pendente',
    FOREIGN KEY (ClienteId) REFERENCES Clientes(Id)
);

-- Tabela de Itens Pedido
CREATE TABLE ItensPedido (
    Id INT PRIMARY KEY IDENTITY,
    PedidoId INT,
    ProdutoId INT,
    Quantidade INT,
    PrecoUnitario DECIMAL(10,2),
    FOREIGN KEY (PedidoId) REFERENCES Pedidos(Id),
    FOREIGN KEY (ProdutoId) REFERENCES Produtos(Id)
);

-- Inserção de categorias e produtos
INSERT INTO Categorias (Nome) VALUES ('Bolos'), ('Doces'), ('Bebidas');

INSERT INTO Produtos (Nome, Preco, Estoque, CategoriaId) VALUES
('Bolo de Chocolate', 40.00, 10, 1),
('Brigadeiro', 2.50, 100, 2),
('Suco de Laranja', 6.00, 50, 3);