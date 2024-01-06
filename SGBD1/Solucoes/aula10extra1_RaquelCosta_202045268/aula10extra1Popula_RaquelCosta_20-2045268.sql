-- -----------     << ESTADO CIDADE >>     -------------------
-- 
--                    SCRIPT DE INSERCAO (DML)
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
USE aula10extra1;

-- INSERCOES
INSERT INTO ESTADO (sigla, nome) VALUES
  ('DF', 'Distrito Federal'),
  ('GO', 'Goiás'),
  ('SP', 'São Paulo'),
  ('RJ', 'Rio de Janeiro');

  
INSERT INTO CIDADE (cidade, estado, qtdeHabitante) VALUES
  ('Brasília', 'DF', 230310),
  ('Campinas', 'SP', 1138000),
  ('São Paulo', 'SP', 12330000),
  ('Presidente Prudente', 'SP', 230371),
  ('Goiânia', 'GO', 1420000),
  ('Rio de Janeiro', 'RJ', 12330000),
  ('Taguatinga', 'DF', 208177);
  

