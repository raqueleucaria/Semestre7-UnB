-- -----------     << ESTADO-CIDADE >>     -------------------
-- 
--                    CONSULTAS (DDL)
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
-- CONSULTAS
-- A) Projeção de sigla e nome do estado de sigla SP e DF
-- B) Selecione somente o nome e a sigla das cidades que são dos estados RJ, DF e GO
-- C) Selecione todas as cidades do primeiro estado que você cadastrou mostrando somente o nome da cidade, o nome do estado e sua sigla;
-- D) Selecione somente o nome e a sigla do estado que você cadastrou por último e todas as cidades cadastradas nele, mostrando o seu nome e a quantidade de habitantes em ordem crescente de nome de estado e nome de cidade em ordem decrescente.
-- -----------------------------------------------------------------

-- BASE DE DADOS
USE aula10extra1;

-- CONSULTAS
-- A)
SELECT sigla, nome FROM estado WHERE sigla IN ('SP', 'DF');

-- B)
SELECT CIDADE.cidade, CIDADE.estado
FROM CIDADE
JOIN ESTADO ON CIDADE.estado = ESTADO.sigla
WHERE ESTADO.sigla IN ('RJ', 'DF', 'GO');

-- C)
SELECT CIDADE.cidade, ESTADO.nome AS nome_estado, ESTADO.sigla
FROM CIDADE
JOIN ESTADO ON CIDADE.estado = ESTADO.sigla
WHERE ESTADO.sigla = (SELECT sigla FROM ESTADO ORDER BY sigla LIMIT 1);

-- D)





