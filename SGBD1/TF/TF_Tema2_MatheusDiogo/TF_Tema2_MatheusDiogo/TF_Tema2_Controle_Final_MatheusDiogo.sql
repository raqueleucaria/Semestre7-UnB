-- -----------     << PILATES FIT CLUB >>     -------------------
-- 
--                    SCRIPT DE CONTROLE
-- 
-- Data Criacao ...........: 03/12/2023
-- Autor(es) ..............: Guilherme Bessa, Johnny Lopes, Julia Souza, Leonardo Borges, Lucas Soares, Mariana Cruz, Maria Ferreira, Matheus Diogo, Paulo Borba, Pedro Barbosa, Pedro Morais, Pedro Rocha, Pedro Santana, Pedro Siqueira, Philipe Barros, Rafael Rodrigues, Raquel Costa, Ricardo Maciel, Rodrigo Bezerra, Valderson Junior, Vitor Santos, Vinicius Santos, Wesley Carvalho e Wildemberg Junior
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: TF_tema2
-- 
-- Data Ultima Alteracao ..:
-- 			16/12/2023  => 	Adicao dos usuarios pablo, wallace e debora 
--
-- PROJETO => 01 Base de Dados
--         => 22 Tabelas
-- 		   => 03 Roles
-- 		   => 09 Usuarios
--
-- -----------------------------------------------------------------

USE TF_tema2;

CREATE ROLE superAdmin;
CREATE ROLE administracao;
CREATE ROLE instrutores;

GRANT ALL PRIVILEGES ON * TO superAdmin;

GRANT SELECT, INSERT, UPDATE, DELETE ON * TO administracao;

GRANT SELECT ON RELATORIO TO instrutores;
GRANT SELECT ON escreve TO instrutores;
GRANT SELECT ON participa TO instrutores;
GRANT SELECT ON SESSAO TO instrutores;
GRANT SELECT ON leciona TO instrutores;
GRANT SELECT ON ALUNO TO instrutores;
GRANT SELECT ON LAUDOMEDICO TO instrutores;
GRANT SELECT ON orienta TO instrutores;
GRANT SELECT ON ATESTADO TO instrutores;

CREATE USER claudia IDENTIFIED BY 'admin123';
CREATE USER guilherme IDENTIFIED BY 'guilherme12345';
CREATE USER pablo IDENTIFIED BY 'pedroga420';

CREATE USER rafael IDENTIFIED BY 'rafael1523';
CREATE USER christiane IDENTIFIED BY 'cris43234';
CREATE USER wallace IDENTIFIED BY 'flamengo03';

CREATE USER lucas IDENTIFIED BY 'lukinhas23';
CREATE USER juliana IDENTIFIED BY 'jujuba2012';
CREATE USER debora IDENTIFIED BY 'doradora022';

GRANT superAdmin TO claudia, guilherme, pablo;
GRANT administracao TO rafael, christiane, wallace;
GRANT instrutores TO lucas, juliana, debora;
