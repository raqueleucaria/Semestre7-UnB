-- -----------     << PILATES FIT CLUB >>     -------------------
-- 
--                    SCRIPT APAGA
-- 
-- Data Criacao ...........: 03/12/2023
-- Autor(es) ..............: Guilherme Bessa, Johnny Lopes, Julia Souza, Leonardo Borges, Lucas Soares, Mariana Cruz, Maria Ferreira, Matheus Diogo, Paulo Borba, Pedro Barbosa, Pedro Morais, Pedro Rocha, Pedro Santana, Pedro Siqueira, Philipe Barros, Rafael Rodrigues, Raquel Costa, Ricardo Maciel, Rodrigo Bezerra, Valderson Junior, Vitor Santos, Vinicius Santos, Wesley Carvalho e Wildemberg Junior
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: TF_tema2
-- 
-- Data Ultima Alteracao ..:
-- 			10/12/2023 	=> 	Alteracao no nome da base de dados
-- 					 	 	Alteracao da quantidade de tabelas para 21
-- 					 	 		Adicao do drop das tabelas CONTRATO, REMUNERACAO, CONVENIO e orienta
-- 					 	 	Substituicao do drop da tabela PLANOSAUDE para GUIAPLANO
-- 							Adicao dos drops de ROLE e USER	
-- 			16/12/2023  => 	Alteracao da ordem de DROP's nas tabelas	
-- 			20/12/2023 	=> 	Adicao do DROP da tabela ajuda	
--
-- PROJETO => 01 Base de Dados
--         => 22 Tabelas
-- 		   => 03 Roles
-- 		   => 09 Usuarios
--
-- -----------------------------------------------------------------

USE TF_tema2;

DROP TABLE ATESTADO;
DROP TABLE REMUNERACAO;
DROP TABLE escreve;
DROP TABLE ajuda;
DROP TABLE leciona;
DROP TABLE orienta;
DROP TABLE participa;
DROP TABLE telefone;
DROP TABLE especialidade;
DROP TABLE ESTAGIARIO;
DROP TABLE INSTRUTOR;
DROP TABLE PAGAMENTO;
DROP TABLE RELATORIO;
DROP TABLE LAUDOMEDICO;
DROP TABLE GUIAPLANO;
DROP TABLE CONTRATO;
DROP TABLE AUXILIARADMINISTRATIVO;
DROP TABLE ALUNO;
DROP TABLE DADOSCLT;
DROP TABLE CONTABANCARIA;
DROP TABLE SESSAO;
DROP TABLE CONVENIO;

DROP ROLE superAdmin;
DROP ROLE administracao;
DROP ROLE instrutores;

DROP USER claudia;
DROP USER guilherme;
DROP USER pablo;
DROP USER rafael;
DROP USER christiane;
DROP USER wallace;
DROP USER lucas;
DROP USER juliana;
DROP USER debora;
