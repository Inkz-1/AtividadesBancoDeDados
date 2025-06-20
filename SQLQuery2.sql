-- Banco de dados Escola Maupa
CREATE DATABASE Maupa;
USE Maupa;

-- Professores
CREATE TABLE Professores (
    Id INT PRIMARY KEY IDENTITY,
    Nome VARCHAR(100),
    Materia VARCHAR(100)
);

-- Cursos
CREATE TABLE Cursos (
    Id INT PRIMARY KEY IDENTITY,
    Nome VARCHAR(100),
    CargaHoraria INT,
    ProfessorId INT,
    FOREIGN KEY (ProfessorId) REFERENCES Professores(Id)
);

-- Alunos
CREATE TABLE Alunos (
    Id INT PRIMARY KEY IDENTITY,
    Nome VARCHAR(100),
    DataNascimento DATE
);

-- Matrículas
CREATE TABLE Matriculas (
    Id INT PRIMARY KEY IDENTITY,
    AlunoId INT,
    CursoId INT,
    DataMatricula DATE DEFAULT GETDATE(),
    FOREIGN KEY (AlunoId) REFERENCES Alunos(Id),
    FOREIGN KEY (CursoId) REFERENCES Cursos(Id)
);

-- Inserção de dados
INSERT INTO Professores (Nome, Materia) VALUES
('Jailson Souza', 'Banco de dados'),
('Fernanda Souza', 'IA');

INSERT INTO Cursos (Nome, CargaHoraria, ProfessorId) VALUES
('MtSql', 60, 1),
('Introdução a IA', 40, 2);

INSERT INTO Alunos (Nome, DataNascimento) VALUES
('João Pedro', '2006-05-15'),
('AnaJulia', '2005-11-20');

INSERT INTO Matriculas (AlunoId, CursoId) VALUES
(1, 1),
(2, 2);
