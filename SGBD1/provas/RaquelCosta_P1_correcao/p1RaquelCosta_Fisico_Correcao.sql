-- ------------------- < CAESB > -----------------------------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 09/12/2023
-- Autor(es) ..............: Raquel Temóteo Eucaria Pereira da Costa
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: RaquelCosta_P1
--
-- PROJETO => 01 Base de Dados
--         => 03 Tabelas
-- 
-- Ultimas Alteracoes
--   09/12/2023 => Criação do script Físico (somente tabela GERENTE)
--              => Adição da tabela ESPECIALIDADE e PLANTONISTA
--
-- ---------------------------------------------------------

-- BASE DE DADOS
CREATE DATABASE
  IF NOT EXISTS RaquelCosta_P1;

USE RaquelCosta_P1;


-- CREATE TABLE GERENTE (
--    cpf BIGINT(11) NOT NULL,
--    idGerente INT(2) NOT NULL,
--    nomeCompleto VARCHAR(50) NOT NULL,
--    dataNascimento DATE NOT NULL,
--    dataGerencia DATE NOT NULL,
--    cidade VARCHAR(60) NOT NULL,
--    uf CHAR(2) NOT NULL,
--    numero INT(2) NOT NULL,
--    complemento VARCHAR(100), 
    
--    CONSTRAINT PLANTONISTA_PK PRIMARY KEY (cpf)
-- );


CREATE TABLE ESPECIALIDADE (
    idEspecialidade INTEGER NOT NULL AUTO_INCREMENT,
    nomeEspecialidade VARCHAR(30) NOT NULL,
    
    CONSTRAINT ESPECIALIDADE_PK PRIMARY KEY (idEspecialidade)
);


CREATE TABLE PLANTONISTA (
    cpf BIGINT(11) NOT NULL,
    IdPlantonista INT(2) NOT NULL,
    nomeCompleto VARCHAR(50) NOT NULL,
    dataNascimento DATE NOT NULL,
    idEspecialidade INT(2) NOT NULL,
    cpfGerente BIGINT(11) NOT NULL,
    
    CONSTRAINT PLANTONISTA_PK PRIMARY KEY (cpf),
    CONSTRAINT ESPECIALIDADE_FK FOREIGN KEY (idEspecialidade) REFERENCES ESPECIALIDADE(idEspecialidade) ON DELETE CASCADE ON UPDATE RESTRICT,
    CONSTRAINT GERENTE_FK FOREIGN KEY (cpfGerente) REFERENCES GERENTE(cpf) ON DELETE CASCADE  ON UPDATE RESTRICT
);




 