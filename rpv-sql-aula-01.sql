##################################################################################
# Banco de dados Livraria (teste)
##################################################################################

CREATE DATABASE db_Livraria;

SHOW DATABASES;

USE db_livraria;

SELECT DATABASE();

DROP DATABASE IF EXISTS db_livraria;

##################################################################################
# Banco de Dados Família
##################################################################################

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

DROP TABLE Filho;

DROP TABLE Pai;

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
ON DELETE SET NULL
ON UPDATE CASCADE
) Engine=InnoDB;

SELECT P.ID_Pai, P.Nome_Pai, F.ID_Filho, F.Nome_Filho
FROM Filho F
INNER JOIN Pai P
ON F.ID_Pai = P.ID_Pai;

INSERT INTO Pai
VALUES (1,"João"),(2,"Mário"),(3,"Renato"),(4,"Emerson"),(5,"André");

INSERT INTO Filho (Nome_Filho, ID_Pai)
VALUES ("João",1),("Mário",1),("Renato",3),("Emerson",4),("André",3);

DELETE FROM Pai
WHERE Nome_Pai="Renato";

SELECT * FROM Filho;

DROP TABLE Filho;

Drop TABLE Pai;

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
ON DELETE RESTRICT
) Engine=InnoDB;

INSERT INTO Pai
VALUES (1,"João"),(2,"Mário"),(3,"Renato"),(4,"Emerson"),(5,"André");

INSERT INTO Filho (Nome_Filho, ID_Pai)
VALUES ("João",1),("Mário",1),("Renato",3),("Emerson",4),("André",3);

DELETE FROM Pai
WHERE Nome_Pai = "Renato";

DROP TABLE Filho;

DROP TABLE Pai;

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
ON DELETE NO ACTION
) Engine=InnoDB;

INSERT INTO Pai
VALUES (1,"João"),(2,"Mário"),(3,"Renato"),(4,"Emerson"),(5,"André");

INSERT INTO Filho (Nome_Filho, ID_Pai)
VALUES ("João",1),("Mário",1),("Renato",3),("Emerson",4),("André",3);

DELETE FROM Pai
WHERE Nome_Pai = "Renato";

##################################################################################
# Banco de dados Livraria
##################################################################################

CREATE DATABASE db_Livraria;

USE db_Livraria;

CREATE TABLE IF NOT EXISTS tbl_livro (
ID_Livro SMALLINT AUTO_INCREMENT PRIMARY KEY,
Nome_Livro VARCHAR(70) NOT NULL,
ISBN13 CHAR(13),
ISBN10 CHAR(10),
ID_Categoria SMALLINT,
ID_Autor SMALLINT NOT NULL,
ID_Editora SMALLINT,
Data_Pub DATE NOT NULL,
Preco_Livro DECIMAL(6,2) NOT NULL
) Engine=InnoDB;

CREATE TABLE tbl_autores (
ID_Autor SMALLINT PRIMARY KEY,
Nome_Autor VARCHAR(50) NOT NULL,
Sobrenome_Autor VARCHAR(60) NOT NULL
) Engine=InnoDB;

CREATE TABLE tbl_editoras (
ID_Editora SMALLINT PRIMARY KEY AUTO_INCREMENT,
Nome_Editora VARCHAR(50) NOT NULL
) Engine=InnoDB;

CREATE TABLE tbl_teste_incremento (
Codigo SMALLINT PRIMARY KEY AUTO_INCREMENT,
Nome VARCHAR(20) NOT NULL
) AUTO_INCREMENT = 15;

INSERT INTO tbl_teste_incremento (Nome) VALUES ("Ana");
INSERT INTO tbl_teste_incremento (Nome) VALUES ("Maria");
INSERT INTO tbl_teste_incremento (Nome) VALUES ("Julia");
INSERT INTO tbl_teste_incremento (Nome) VALUES ("Joana");

SELECT * FROM tbl_teste_incremento;

ALTER TABLE tbl_teste_incremento AUTO_INCREMENT = 90;

##################################################################################
# Exercício 01
##################################################################################

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
) ENGINE=InnoDB;

CREATE TABLE Cidade (
ID_Cidade SMALLINT PRIMARY KEY,
Nome_Cidade VARCHAR(50),
ID_Estado SMALLINT,
CONSTRAINT fk_id_estado FOREIGN KEY(ID_Estado)
REFERENCES Estado(ID_Estado)
ON DELETE CASCADE
ON UPDATE CASCADE
) ENGINE=InnoDB;

INSERT INTO Pais
VALUES (1,"Brasil");

INSERT INTO Estado
VALUES (1,"MG",1),(2,"SP",1),(3,"RJ",1);

INSERT INTO Cidade
VALUES (1,"Cataguases",1),(2,"Rio de Janeiro",3),(3,"São Paulo",2),(4,"Leopoldina",1);

SELECT * FROM Pais;

SELECT * FROM Estado;

SELECT * FROM Cidade;

SELECT P.ID_Pais, P.Nome_Pais, E.ID_Estado, E.Nome_Estado, C.ID_Cidade, C.Nome_Cidade
FROM Cidade C
INNER JOIN Estado E ON C.ID_Estado = E.ID_Estado
INNER JOIN PAIS P ON E.ID_Pais = P.ID_PAIS;

##################################################################################
# Exercício 02
##################################################################################

/*
INSERT INTO tbl_teste_incremento (Nome) VALUES ("João");
INSERT INTO tbl_teste_incremento (Nome) VALUES ("Jose");
INSERT INTO tbl_teste_incremento (Nome) VALUES ("Alberto");
INSERT INTO tbl_teste_incremento (Nome) VALUES ("Roberto");

SELECT * FROM tbl_teste_incremento;
*/

CREATE DATABASE db_exercise02;

USE db_exercise02;

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
) ENGINE=InnoDB;

CREATE TABLE Cidade (
ID_Cidade SMALLINT PRIMARY,
Nome_Cidade VARCHAR(50),
ID_Estado SMALLINT,
CONSTRAINT fk_id_estado FOREIGN KEY(ID_Estado)
REFERENCES Estado(ID_Estado)
ON DELETE CASCADE
ON UPDATE CASCADE
) ENGINE=InnoDB;

INSERT INTO Pais (Nome_Pais)
VALUE ("Brasil");

INSERT INTO Estado (Nome_Estado, ID_Pais) VALUES
("MG", 1),
("SP", 1),
("RJ", 1);

INSERT INTO Cidade (Nome_Cidade, ID_Estado) VALUES
("Cataguases", 1),
("Leopoldina", 1),
("São Paulo", 2),
("Rio de Janeiro", 3);

ALTER TABLE Cidade AUTO_INCREMENT = 90;

INSERT INTO Cidade (Nome_Cidade, ID_Estado) VALUES
("Belo Horizonte", 1),
("Campinas", 2);

SELECT P.ID_Pais, P.Nome_Pais, E.ID_Estado, E.Nome_Estado, C.ID_Cidade, C.Nome_Cidade
FROM Cidade C
INNER JOIN Estado E ON C.ID_Estado = E.ID_Estado
INNER JOIN Pais P ON E.ID_Pais = P.ID_Pais;
