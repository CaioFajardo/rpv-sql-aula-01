CREATE DATABASE db_Livraria;

SHOW DATABASES;

USE db_livraria;

SELECT DATABASE();

DROP DATABASE IF EXISTS db_livraria;

# Banco de Dados Família

CREATE DATABASE db_Familia;

USE db_Familia;

CREATE TABLE Pai (
ID_Pai SMALLINT PRIMARY KEY,
Nome_Pai VARCHAR(50)
) ENGINE=InnoDB;

CREATE TABLE Filho (
ID_Filho SMALLINT AUTO_INCREMENT PRIMARY KEY,
Nome_Filho VARCHAR(50),
ID_Pai SMALLINT,
CONSTRAINT fk_id_pai FOREIGN KEY(ID_Pai)
REFERENCES Pai(ID_Pai)
ON DELETE CASCADE
ON UPDATE CASCADE
) Engine=InnoDB;

INSERT INTO Pai
VALUES (1,"João"),(2,"Mário"),(3,"Renato"),(4,"Emerson"),(5,"André");

INSERT INTO Filho (Nome_Filho, ID_Pai)
VALUES ("João",1),("Mário",1),("Renato",3),("Emerson",4),("André",3);

SELECT * FROM Pai;

SELECT * FROM Filho;

SELECT P.ID_Pai, P.Nome_Pai, F.ID_Filho, F.Nome_Filho
FROM Filho F
INNER JOIN Pai P
ON F.ID_Pai = P.ID_Pai;

SET SQL_SAFE_UPDATES=0;

DELETE FROM Filho
WHERE Nome_Filho="Renato";

SELECT Nome_Pai, Nome_Filho
FROM Filho
INNER JOIN Pai
ON Filho.ID_Pai;

DELETE FROM Pai
WHERE Nome_Pai="Renato";

SELECT Nome_Pai, Nome_Filho
FROM Filho
INNER JOIN Pai
ON Filho.ID_Pai=Pai.ID_Pai;

SELECT * FROM Filho;

# Exercício 01

/* 
Criar um banco de dados e 3 tabelas.
Escolha o tema de sua preferência.
*/

CREATE DATABASE db_exercise01;

USE db_exercise01;

CREATE TABLE Pais (
ID_Pais SMALLINT PRIMARY KEY,
Nome_Pais VARCHAR(50)
) ENGINE=InnoDB;

CREATE TABLE Estado (
ID_Estado SMALLINT PRIMARY KEY,
Nome_Estado VARCHAR(50),
ID_Pais SMALLINT,
CONSTRAINT fk_id_pais FOREIGN KEY(ID_Pais)
REFERENCES Pais(ID_Pais)
ON DELETE CASCADE
ON UPDATE CASCADE
) ENGINE=InnoDB

CREATE TABLE Cidade (
ID_Cidade SMALLINT PRIMARY KEY,
Nome_Cidade VARCHAR(50),
ID_Estado SMALLINT,
CONSTRAINT fk_id_estado FOREIGN KEY(ID_Estado)
REFERENCES Estado(ID_Estado)
ON DELETE CASCADE
ON UPDATE CASCADE
) ENGINE=InnoDB

INSERT INTO Pais
VALUES (1,"Brasil")

INSERT INTO Estado
VALUES (1,"MG"),(2,"SP"),(3,"RJ");

INSERT INTO Cidade
VALUES (1,"Cataguases"),(3,"Rio de Janeiro"),(2,"São Paulo"),(1,"Leopoldina");

SELECT * FROM Pais;

SELECT * FROM Estado;

SELECT * FROM Cidade;

SELECT P.ID_Pais, P.Nome_Pais, E.ID_Estado, E.Nome_Estado, C.ID_Cidade, C.Nome_Cidade
FROM Cidade C
INNER JOIN Estado E, Pais P
ON C.ID_Cidade = E.ID_Estado, E.ID_Estado = C.ID_Cidade;
