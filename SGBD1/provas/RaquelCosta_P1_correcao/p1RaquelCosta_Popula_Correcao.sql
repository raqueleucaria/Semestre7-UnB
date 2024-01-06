-- ------------------- < CAESB > -----------------------------
--
--                    SCRIPT DE POPULA (DDL)
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
--   09/12/2023 => Criação do script Popula (adicionando apenas Gerente)
--              => Adicionando Especialidade e Plantonista
-- ---------------------------------------------------------

-- BASE DE DADOS
USE RaquelCosta_P1;

-- INSERT INTO GERENTE (cpf, idGerente, nomeCompleto, dataNascimento, dataGerencia, cidade, uf, numero, complemento) VALUES
-- (11111111111, 1, 'José Pereira', '1975-04-25', '2010-01-15', 'Plano Piloto', 'DF', 123, 'Apt 101'),
-- (22222222222, 2, 'Marta Oliveira', '1980-09-12', '2015-03-20', 'Taguatinga', 'DF', 456, 'Casa'),
-- (33333333333, 3, 'Fernando Silva', '1978-06-18', '2012-11-10', 'Águas Claras', 'DF', 789, 'Loja 2'),
-- (44444444444, 4, 'Camila Santos', '1985-12-03', '2018-05-05', 'Gama', 'DF', 1011, 'Andar 5'),
-- (55555555555, 5, 'Ricardo Costa', '1990-03-08', '2016-07-30', 'Águas Claras', 'DF', 1213, 'Escritório');

INSERT INTO ESPECIALIDADE (nomeEspecialidade) VALUES
('esgoto'),
('águas pluviais'),
('tubulações'),
('saneamento'),
('ambiental');

INSERT INTO PLANTONISTA (cpf, IdPlantonista, nomeCompleto, dataNascimento, idEspecialidade, cpfGerente) VALUES
(12345678901, 1, 'Maria Silva', '1990-05-15', 1, 11111111111),
(98765432101, 2, 'João Oliveira', '1985-08-22', 2, 33333333333),
(34567890123, 3, 'Carlos Santos', '1982-02-10', 3, 22222222222),
(56789012345, 4, 'Ana Souza', '1995-11-30', 1, 22222222222),
(79556543210, 5, 'Pedro Costa', '1988-07-18', 2, 55555555555),
(09876543210, 6, 'Joana Pereira', '1990-11-15', 2, 44444444444);

