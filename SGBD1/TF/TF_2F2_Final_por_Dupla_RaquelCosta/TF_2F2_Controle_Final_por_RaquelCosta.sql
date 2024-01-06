/*﻿-- --------  << Pilates >>  ----------
--
--                    SCRIPT DE CONTROLE (DDL)
--
-- Data Criacao ...........:11/12/2023
-- Autor(es) ..............: Mariana Letícia Santos da Cruz e Raquel Temóteo Eucaria Pereira da Costa
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF_2F2_raquelcosta
--
-- PROJETO => 01 Base de Dados
--         => 26 Tabelas
--		   => 02 Usuarios 
-- 		   => 02 Papeis
-- ---------------------------------------------------------*/

use TF_2F2_raquelcosta;

create role gerente;
create role auxiliar;

create user 'christiane'@'' 
	identified by 'chrisgere123';
create user 'auxiliarAdmin1'@'' 
	identified by 'auxadmin1234';
create user 'auxiliarAdmin2'@'' 
	identified by 'auxadmin1234';


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
grant auxiliar to 'auxiliarAdmin1'@'';
grant auxiliar to 'auxiliarAdmin2'@'';

FLUSH privileges;

