-- -----------     << ESTADO-CIDADE >>     -------------------
-- 
--                    SCRIPT DE CRIACAO (DDL)
-- 
-- Data Criacao ...........: 22/11/2023
-- Autor(es) ..............: Raquel Temóte Eucaria Pereira da Costa
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: Exercício Extra 1 da Aula 10
-- 
-- Data Ultima Alteracao ..: 
--
-- PROJETO => 01 Base de Dados
--         => 02 Tabelas
-- 
-- -----------------------------------------------------------------

-- BASE DE DADOS
CREATE DATABASE
  IF NOT EXISTS aula10extra1;

USE aula10extra1;

-- TABELAS
CREATE TABLE ESTADO (
    sigla VARCHAR(2) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    
    CONSTRAINT ESTADO_PK PRIMARY KEY (sigla)
)Engine = InnoDB;

CREATE TABLE CIDADE (
	codigo INTEGER NOT NULL AUTO_INCREMENT,
    cidade VARCHAR(255) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    qtdeHabitante INTEGER NOT NULL,
    
    CONSTRAINT CIDADE_PK PRIMARY KEY (codigo),
	CONSTRAINT CIDADE_ESTADO_UK UNIQUE (estado, cidade),
    CONSTRAINT CIDADE_ESTADO_FK FOREIGN KEY (estado) REFERENCES ESTADO (sigla)
)Engine = InnoDB;
