#

CREATE DATABASE db_Livraria;

SHOW DATABASES;

USE db_livraria;

SELECT DATABASE();

DROP DATABASE IF EXISTS db_livraria;

CREATE DATABASE db_Familia;

# Banco de Dados Família

USE db_Familia;

CREATE TABLE Pai (
ID_PAI SMALLINT PRIMARY KEY,
NOME_Pai VARCHAR(50)
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