/*﻿-- --------  << Pilates >>  ----------
--
--                    SCRIPT DE CONTROLE (DDL)
--
-- Data Criacao ...........:11/12/2023
-- Autor(es) ..............: Mariana Letícia Santos da Cruz, Pedro Augusto Santos Siqueira, Raquel Temóteo Eucaria Pereira da Costa e Vitor Borges dos Santos
-- Banco de Dados .........: MySQL 8.0
-- Banco de Dados(nome) ...: TF_2F_VitorSantos
--
-- PROJETO => 01 Base de Dados
--         => 26 Tabelas
--		   => 02 Usuarios 
-- 		   => 02 Papeis
-- ---------------------------------------------------------*/

use TF_2F_VitorSantos;

create role gerente;
create role auxiliar;

create user 'christiane'@'' 
	identified by 'chrisgere123';
create user 'gerente2'@'' 
	identified by 'gere123';
create user 'gerente3'@'' 
	identified by 'gere1234';
create user 'auxiliarAdmin1'@'' 
	identified by 'auxadmin1234';
create user 'auxiliarAdmin2'@'' 
	identified by 'auxadmin1234';
create user 'auxiliarAdmin3'@'' 
	identified by 'auxadmin12345';


GRANT CREATE, DROP, ALTER ON TF_2F2_raquelcosta.*
 TO gerente
 WITH GRANT OPTION;
 
GRANT INSERT, DELETE, UPDATE, SELECT ON TF_2F2_raquelcosta.*
 TO gerente
 WITH GRANT OPTION;
 
 GRANT INSERT, DELETE, UPDATE, SELECT ON TF_2F2_raquelcostan.*
 TO auxiliar
 WITH GRANT OPTION;
 
grant gerente to 'christiane'@'';
grant gerente to 'gerente2'@'';
grant gerente to 'gerente3'@'';
grant auxiliar to 'auxiliarAdmin1'@'';
grant auxiliar to 'auxiliarAdmin2'@'';
grant auxiliar to 'auxiliarAdmin3'@'';

FLUSH privileges;