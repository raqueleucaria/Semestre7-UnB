-- -----------     << Pilates >>     -------------------
-- 
--                 SCRIPT DE DELEÇÃO (DDL)
-- 
-- Data Criacao ...........: 09/12/2023
-- Autor(es) ..............: Mariana Letícia Santos da Cruz, Pedro Augusto Santos Siqueira, Raquel Temóteo Eucaria Pereira da Costa e Vitor Borges dos Santos
-- Banco de Dados .........: MySQL 8.0
-- Banco de Dados(nome) ...: TF_2F_VitorSantos
-- 
--
-- PROJETO => 01 Base de Dados
--         => 26 Tabelas
--         => 2 Usuarios
-- 		   => 02 Papeis
--
-- Ultimas Alteracoes
--   09/12/2023 => Criação do script de criação 
--   11/12/2023 => Ajuste dos atributos

-- -----------------------------------------------------------------
-- BASE DE DADOS
USE TF_2F_VitorSantos;

drop table tem;
drop table cria;
drop table gera;
drop table associa;
drop table contem;
drop table ESPECIALIDADE;

drop table possui;
drop table CURSO;
drop table DESPESA;
drop table RELATORIO;
drop table PONTO_ministra;

drop table PROFESSOR;
drop table CERTIDAO_NEGATIVA;
drop table FUNCIONARIO;
drop table gerafalta;
drop table agendamento_realiza;
drop table AULA;
drop table FALTA;
drop table LAUDO_MEDICO;
drop table RECEITA;
drop table CONTRATO;
drop table PARENTE;
drop table ALUNO;
drop table MODALIDADE;
drop table HORARIO;
drop table plano_saude;

-- Revogar pertencimento aos papéis
REVOKE gerente FROM 'christiane'@'';
REVOKE auxiliar FROM 'auxiliarAdmin1'@'';
REVOKE auxiliar FROM 'auxiliarAdmin2'@'';

-- Excluir usuários
DROP USER 'christiane'@'';
DROP USER 'auxiliarAdmin1'@'';
DROP USER 'auxiliarAdmin2'@'';

-- Excluir papéis
DROP ROLE gerente;
DROP ROLE auxiliar;

FLUSH PRIVILEGES;