-- -----------     << Pilates >>     -------------------
-- 
--                 SCRIPT POPULA (DDL)
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
--   17/12/2023 => Ajuste de tipos
--   18/12/2013 => Adicionando tuplas

-- -----------------------------------------------------------------
-- BASE DE DADOS
USE TF_2F_VitorSantos;

-- INSERCOES
INSERT INTO PLANO_SAUDE (validade, cnpj, tipoCobertura, nomePlano) VALUES
('2025-01-01', 12345678901234, 'Reembolso', 'Amil Master'),
('2025-02-01', 98765432109876, 'Guias', 'Unimed Essencial'),
('2026-03-01', 11223344556677, 'Reembolso', 'Bradesco Saúde Premium'),
('2026-04-01', 22334455667788, 'Reembolso', 'Golden Cross Excelência'),
('2025-05-01', 33445566778899, 'Guias', 'SulAmérica Executivo'),
('2025-12-31', 22345678901234, 'Reembolso', 'Amil Platinum'),
('2026-12-31', 28765432109876, 'Guias', 'Unimed Plus'),
('2026-12-31', 55555555555555, 'Reembolso', 'Bradesco Saúde Top'),
('2027-12-31', 44444444444444, 'Guias', 'Golden Cross Standard'),
('2027-12-31', 99999999999999, 'Reembolso', 'SulAmérica Prestige');

INSERT INTO HORARIO (diaSemana, horarioInicio) VALUES
('segunda', '08:00:00'),
('terça', '10:00:00'),
('quarta', '14:00:00'),
('quinta', '16:00:00'),
('sexta', '19:00:00'),
('segunda', '09:00:00'),
('terça', '09:00:00'),
('quarta', '10:00:00'),
('quinta', '08:00:00'),
('sexta', '07:00:00');

INSERT INTO MODALIDADE (tipoModalidade) VALUES
('Alongamento'),
('Aerobica'),
('Yoga'),
('Pilates para idosos'),
('Pilates para gravidas'),
('Pilates classico'),
('Grafity pilates'),
('Pilates com reformer'),
('Pilates com columpiowall'),
('Pilates solo');

INSERT INTO ALUNO (idAluno, rg, nivel, cpf, nomeCompleto, sexo, ddiContato, numeroContato, dddContato, email, dataNascimento, uf, complemento, cidade, numero, cep, rua, bairro, idPlanoSaude, statusProcesso, carteiraConvenio, qtSessoes)
VALUES
(1, 1234567, 'iniciante', '12345678901', 'João Silva', 'M', 55, 987654321, 11, 'joao@email.com', '1990-05-15', 'DF', 'Apto 202', 'Águas Claras', 234, '23456789', 'Rua das Flores', 'Jardim Novo',NULL, NULL, NULL, NULL),
(2, 7654321, 'intermediario', '98765432109', 'Maria Oliveira', 'F', 55, 123456789, 11, 'maria@email.com', '1985-10-20', 'DF', 'Casa 30', 'Águas Claras', 876, '87654321', 'Avenida das Palmeiras', 'Vila Nova', NULL, NULL, NULL, NULL),
(3, 9876543, 'avancado', '98765432101', 'Carlos Santos', 'M', 55, 555555555, 11, 'carlos@email.com', '1982-03-08', 'DF', 'Bloco B', 'Águas Claras', 543, '54321098', 'Avenida Afonso Pena', 'Belo Horizonte', NULL, NULL, NULL, NULL),
(4, 8765432, 'iniciante', '12345678902', 'Ana Oliveira', 'F', 55, 999999999, 11, 'ana@email.com', '1995-12-01', 'DF', 'Casa 5', 'Águas Claras', 654, '65432109', 'Rua Barão de Jaguara', 'Campinas', 4, 'aprovado', 'GHI012', 25),
(5, 2345678, 'intermediario', '98765432103', 'Lucas Pereira', 'M', 55, 777777777, 11, 'lucas@email.com', '1988-07-17', 'DF', 'Apartamento 15', 'Águas Claras', 876, '87654321', 'Avenida Borges de Medeiros', 'Porto Alegre', 5, 'processando', 'JKL345', 35),
(6, 2234567, 'iniciante', '33345678901', 'João Carvalho', 'M', 55, 337654321, 11, 'joaoC@email.com', '1962-05-15', 'DF', 'Apto 202', 'Águas Claras', 123, '12345678', 'Avenida Paulista', 'São Paulo',1, 'processando', 'ABC123', 20),
(7, 2654321, 'intermediario', '33765432109', 'Maria Silva', 'F', 55, 333456789, 11, 'mariaS@email.com', '1959-10-20', 'DF', 'Casa 20', 'Águas Claras', 987, '98765432', 'Rua Copacabana', 'Rio de Janeiro', 2, 'aprovado', 'XYZ456', 30),
(8, 2876543, 'avancado', '33765432101', 'Carlos dos Santos', 'M', 55, 335555555, 11, 'carlosS@email.com', '1961-03-08', 'DF', 'Bloco B', 'Águas Claras', 543, '54321098', 'Avenida Afonso Pena', 'Belo Horizonte', 3, 'aprovado', 'DEF789', 40),
(9, 2765432, 'iniciante', '33345678902', 'Ana Pereira', 'F', 55, 339999999, 11, 'anaP@email.com', '1959-12-01', 'DF', 'Casa 5', 'Águas Claras', 654, '65432109', 'Rua Barão de Jaguara', 'Campinas', 4, 'recusado', 'GHI012', 25),
(10, 3345678, 'intermediario', '33765432103', 'Lucas Carlos', 'M', 55, 337777777, 11, 'lucasC@email.com', '1960-07-17', 'DF', 'Apartamento 15', 'Águas Claras', 876, '87654321', 'Avenida Borges de Medeiros', 'Porto Alegre', 5, 'processando', 'JKL345', 35);


INSERT INTO PARENTE (nomeParente, tipoParentesco, ddiContato, dddContato, numeroContato, idPessoa) VALUES
('José Silva', 'filho', 55, 11, 123456789, 6),
('Ana Oliveira', 'filha', 55, 11, 987654321, 6),
('Roberto Santos', 'sobrinho', 55, 11, 555555555, 7),
('Clara Santos', 'neta', 55, 11, 999999999, 7),
('Lucia Oliveira', 'neta', 55, 11, 777777777, 8),
('José Carlos', 'filho', 55, 11, 123456789, 8),
('Ana Clara', 'filha', 55, 11, 987654321, 9),
('Roberto Carlos', 'sobrinho', 55, 11, 555555555, 9),
('Clara Roberta', 'filha', 55, 11, 999999999, 10),
('Lucia Luciana', 'sobrinha', 55, 11, 777777777, 10);

INSERT INTO CONTRATO (mensalidade, dataAssinatura, dataFim, tipoPlano, idPessoa) VALUES
(150.00, '2023-01-10', '2023-06-10', 1, 1),
(120.00, '2023-02-15', '2023-07-15', 2, 2),
(200.00, '2023-03-20', '2023-08-20', 1, 3),
(100.00, '2023-04-25', '2023-09-25', 2, 4),
(180.00, '2023-05-30', '2023-10-30', 1, 5),
(150.00, '2023-01-10', '2023-06-10', 1, 6),
(120.00, '2023-02-15', '2023-07-15', 2, 7),
(200.00, '2023-03-20', '2023-08-20', 1, 8),
(100.00, '2023-04-25', '2023-09-25', 2, 9),
(180.00, '2023-05-30', '2023-10-30', 1, 10);

INSERT INTO RECEITA (tipoPagamento, dataPagamento, desconto, valorAula, dataVencimento, idContrato) VALUES
('cheque', '2023-01-10', 10.00, 20.00, '2023-01-15', 1),
('pix', '2023-02-15', NULL, 25.00, '2023-02-20', 2),
('cheque', '2023-03-20', 15.00, 30.00, '2023-03-25', 3),
('pix', '2023-04-25', NULL, 18.00, '2023-04-30', 4),
('cheque', '2023-05-30', 20.00, 35.00, '2023-05-31', 5),
('cheque', '2023-01-10', 10.00, 20.00, '2023-01-15', 6),
('pix', '2023-02-15', NULL, 25.00, '2023-02-20', 7),
('cheque', '2023-03-20', 15.00, 30.00, '2023-03-25', 8),
('pix', '2023-04-25', NULL, 18.00, '2023-04-30', 9),
('cheque', '2023-05-30', 20.00, 35.00, '2023-05-31', 10);

INSERT INTO LAUDO_MEDICO (cidPedido, documento, idPessoa) VALUES
(123, 'laudo1.pdf', 1),
(456, 'laudo2.pdf', 2),
(789, 'laudo3.pdf', 3),
(234, 'laudo4.pdf', 4),
(567, 'laudo5.pdf', 5),
(124, 'laudo6.pdf', 6),
(455, 'laudo7.pdf', 7),
(783, 'laudo8.pdf', 8),
(230, 'laudo9.pdf', 9),
(560, 'laudo10.pdf', 10);

INSERT INTO FALTA (atestado, reposicao) VALUES
('Atestado1.pdf', TRUE),
('Atestado2.pdf', FALSE),
('Atestado3.pdf', TRUE),
('Atestado4.pdf', FALSE),
('Atestado5.pdf', TRUE),
('Atestado6.pdf', TRUE),
('Atestado7.pdf', FALSE),
('Atestado8.pdf', TRUE),
('Atestado9.pdf', FALSE),
('Atestado10.pdf', TRUE);

INSERT INTO AULA (dataAula, idHorario) VALUES
('2023-01-10', 1),
('2023-02-15', 2),
('2023-03-20', 3),
('2023-04-25', 4),
('2023-05-30', 5),
('2023-01-10', 6),
('2023-02-15', 7),
('2023-03-20', 8),
('2023-04-25', 9),
('2023-05-30', 10);

INSERT INTO AGENDAMENTO_realiza (idAula, idPessoa) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(3, 3),
(3, 10),
(3, 7),
(3, 2),
(4, 4),
(4, 5),
(4, 7),
(4, 8),
(5, 3),
(5, 4),
(5, 5),
(5, 6),
(5, 7),
(5, 8),
(5, 9),
(5, 10),
(6, 6),
(6, 4),
(6, 3),
(6, 2),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

INSERT INTO geraFalta (idFalta, idAula, idPessoa) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 2, 4),
(5, 3, 2),
(6, 4, 7),
(7, 5, 10),
(8, 5, 9),
(9, 5, 3),
(10, 6, 4);


INSERT INTO FUNCIONARIO (idFuncionario, funcao, banco, conta, agencia, escolaridade, cpf, nomeCompleto, sexo, ddiContato, numeroContato, dddContato, email, dataNascimento, uf, cidade, cep, numero, rua, bairro) VALUES
(1, 'Recepcionista', 'Banco do Brasil', '98765-4', '5432', 'Ensino Médio', '23456789002', 'Alice Silva', 'F', 55, 98765432, 11, 'alice@email.com', '1992-08-12', 'DF', 'Águas Claras', '71900000', 321, 'Rua das Flores', 'Águas Claras Sul'),
(2, 'Professor', 'Banco Bradesco', '45678-9', '9876', 'Ensino Superior', '34767890123', 'Daniel Oliveira', 'M', 55, 12345679, 11, 'daniel@email.com', '1980-05-25', 'DF', 'Taguatinga', '72100000', 123, 'Avenida Central', 'Taguatinga Norte'),
(3, 'Limpeza', 'Caixa Econômica Federal', '98765-4', '7654', 'Ensino Fundamental', '45878901234', 'Marcos Santos', 'M', 55, 55555555, 11, 'marcos@email.com', '1985-12-03', 'DF', 'Samambaia', '72300000', 789, 'Quadra 102', 'Samambaia Sul'),
(4, 'Gerente', 'Banco do Brasil', '12345-6', '4321', 'Ensino Superior', '56989012345', 'Beatriz Oliveira', 'F', 55, 99999999, 11, 'beatriz@email.com', '1988-02-20', 'DF', 'Asa Sul', '70000000', 321, 'Quadra 102', 'Asa Sul'),
(5, 'Professor', 'Banco Santander', '54321-0', '1234', 'Ensino Superior', '67877123456', 'Rodrigo Pereira', 'M', 55, 77777777, 11, 'rodrigo@email.com', '1991-07-17', 'DF', 'Asa Norte', '70800000', 654, 'Quadra 308', 'Asa Norte'),
(6, 'Recepcionista', 'Banco do Brasil', '23456-7', '8901', 'Ensino Médio', '78881234567', 'Alice Costa', 'F', 55, 22765432, 11, 'aliceC@email.com', '1992-08-17', 'DF', 'Águas Claras', '71900000', 321, 'Rua das Flores', 'Águas Claras Sul'),
(7, 'Professor', 'Banco Bradesco', '56789-0', '2345', 'Ensino Superior', '89012388678', 'Daniel Costa', 'M', 55, 22346789, 11, 'danielC@email.com', '1980-05-28', 'DF', 'Taguatinga', '72100000', 123, 'Avenida Central', 'Taguatinga Norte'),
(8, 'Limpeza', 'Caixa Econômica Federal', '89012-3', '4567', 'Ensino Fundamental', '90123056789', 'Marcos Costa', 'M', 55, 22555555, 11, 'marcosC@email.com', '1985-08-01', 'DF', 'Samambaia', '72300000', 789, 'Quadra 102', 'Samambaia Sul'),
(9, 'Gerente', 'Banco do Brasil', '67890-1', '9876', 'Ensino Superior', '01234568890', 'Beatriz Costa', 'F', 55, 22999999, 11, 'beatrizC@email.com', '1988-02-24', 'DF', 'Asa Sul', '70000000', 321, 'Quadra 102', 'Asa Sul'),
(10, 'Professor', 'Banco Santander', '01234-5', '6789', 'Ensino Superior', '12345878901', 'Rodrigo da Costa', 'M', 55, 22777777, 11, 'rodrigoC@email.com', '1991-08-17', 'DF', 'Asa Norte', '70800000', 654, 'Quadra 308', 'Asa Norte'),
(11, 'Professor', 'Banco do Brasil', '12345-6', '1234', 'Ensino Superior', '23456789512', 'Fernanda Lima', 'F', 55, 11111111, 11, 'fernanda@email.com', '1987-03-14', 'DF', 'Águas Claras', '71900000', 456, 'Rua das Flores', 'Águas Claras Sul'),
(12, 'Professor', 'Banco Safra', '45678-9', '5678', 'Ensino Superior', '34567866123', 'Gustavo Santos', 'M', 55, 22222222, 11, 'gustavo@email.com', '1983-11-30', 'DF', 'Taguatinga', '72100000', 789, 'Avenida Central', 'Taguatinga Norte'),
(13, 'Professor', 'Banco BTG Pactual', '98765-4', '3456', 'Ensino Superior', '45578901234', 'Helena Oliveira', 'F', 55, 33333333, 11, 'helena@email.com', '1990-05-22', 'DF', 'Samambaia', '72300000', 987, 'Quadra 102', 'Samambaia Sul'),
(14, 'Professor', 'Banco Inter', '54321-0', '4567', 'Ensino Superior', '56789012775', 'Igor Costa', 'M', 55, 44444444, 11, 'igor@email.com', '1986-07-08', 'DF', 'Asa Sul', '70000000', 321, 'Quadra 102', 'Asa Sul'),
(15, 'Professor', 'Banco Santander', '01234-5', '5678', 'Ensino Superior', '67330123456', 'Júlia Santos', 'F', 55, 55555555, 11, 'julia@email.com', '1989-02-12', 'DF', 'Asa Norte', '70800000', 654, 'Quadra 308', 'Asa Norte'),
(16, 'Professor', 'Banco Safra', '66666-6', '7890', 'Ensino Superior', '78551234567', 'Kevin Costa', 'M', 55, 66666666, 11, 'kevin@email.com', '1994-09-05', 'DF', 'Águas Claras', '71900000', 456, 'Rua das Flores', 'Águas Claras Sul');


INSERT INTO CERTIDAO_NEGATIVA (tipoCertidao, dataCertidao, numeroSelo, idFuncionario) VALUES
('Negativa de Débitos Cível', '2023-06-01', 'A1B2C3D4E5F6G7H8I0K1L2M4O5P6', 1),
('Negativa de Antecedentes Criminais', '2023-06-01', 'aBcDeFgH1234h53hbf567JkLmN', 1),
('Negativa de FGTS', '2023-06-01', '12345678', 1),
('Negativa de Débitos Cível', '2023-06-01', 'D4E5F6G7H8I9J0K1L2M3N4P67777', 2),
('Negativa de Antecedentes Criminais', '2023-06-01', '5678iJkLmN9aBcDe34hvye53hbf', 2),
('Negativa de FGTS', '2023-06-01', '23456789', 2),
('Negativa de Débitos Cível', '2023-06-01', 'H8I9J0K1L2M3N4O5P6aBD4E5F6G7', 3),
('Negativa de Antecedentes Criminais', '2023-06-01', 'LmN9aBcDeFgH123y3hbf5678iJk', 3),
('Negativa de FGTS', '2023-06-01', '34567891', 3),
('Negativa de Débitos Cível', '2023-06-01', 'JKL876HGTF430POI32LKO43PLM', 4),
('Negativa de Antecedentes Criminais', '2023-06-01', 'KJH876GBVF4KJHG2G56NHN34HB', 4),
('Negativa de FGTS', '2023-06-01', '87654321', 4),
('Negativa de Débitos Cível', '2023-06-01', 'NOPQ96MNOP438JKL876TF4AC32R', 5),
('Negativa de Antecedentes Criminais', '2023-06-01', 'D4E5F6VY2B3H78IJ1C2A3L4HBF', 5),
('Negativa de FGTS', '2023-06-01', '56789012', 5),
('Negativa de Débitos Cível', '2023-06-01', 'I9J0K1L2MN8H7JB53X1N2M3O4P', 6),
('Negativa de Antecedentes Criminais', '2023-06-01', 'MN9ABCDEF5VFIJKL5678IJKLMN', 6),
('Negativa de FGTS', '2023-06-01', '67890123', 6),
('Negativa de Débitos Cível', '2023-06-01', 'K1L2M3N4OP67098HGTF21KJHGVCX', 7),
('Negativa de Antecedentes Criminais', '2023-06-01', 'NJKL876GBVF4MNHG2G56NHN34HB', 7),
('Negativa de FGTS', '2023-06-01', '76543210', 7),
('Negativa de Débitos Cível', '2023-06-01', 'JKL876HGTF430P9OUN2LKO43PLM', 8),
('Negativa de Antecedentes Criminais', '2023-06-01', 'JN9BCVD45VY53HBFIJKL5678IJK', 8),
('Negativa de FGTS', '2023-06-01', '54325632', 8),
('Negativa de Débitos Cível', '2023-06-01', 'WRFN2LKO43PLMI9J0KM3P876HGTF4', 9),
('Negativa de Antecedentes Criminais', '2023-06-01', 'NMN9ABCDEF5GHBFIJKL5678IJKL', 9),
('Negativa de FGTS', '2023-06-01', '54326789', 9),
('Negativa de Débitos Cível', '2023-06-01', 'N2M3O4P67KJLH6HGTAQ3L876HGTF4', 10),
('Negativa de Antecedentes Criminais', '2023-06-01', 'HGF5GHVY53HBF678IJKLMN9ABCDEF', 10),
('Negativa de FGTS', '2023-06-01', '56209744', 10),
('Negativa de Débitos Cível', '2023-06-01', '876HGTF430JKL8OI3UWRF43PLM9OP0', 11),
('Negativa de Antecedentes Criminais', '2023-06-01', 'JKL876GBVF43PLM2G56NHN3ABCDEF', 11),
('Negativa de FGTS', '2023-06-01', '54321098', 11),
('Negativa de Débitos Cível', '2023-06-01', 'D4E5F6G7HVY2B3HJ6B5V32M3O4P', 12),
('Negativa de Antecedentes Criminais', '2023-06-01', 'MN9ABCDEF5GHVYJKL5678IJKLMNHJ', 12),
('Negativa de FGTS', '2023-06-01', '11225678', 12),
('Negativa de Débitos Cível', '2023-06-01', 'JKL876HGTF430POI3UWRF43PLMI9J0', 13),
('Negativa de Antecedentes Criminais', '2023-06-01', 'IJ1C2A3L4HBNGBVF43PLMKJNHG2G', 13),
('Negativa de FGTS', '2023-06-01', '543200', 13),
('Negativa de Débitos Cível', '2023-06-01', 'HGF5GHVY53HBFIJKL567PLMI9J0K1', 14),
('Negativa de Antecedentes Criminais', '2023-06-01', '2M3NOP876HGTF4L876HGTF4JN9BCV', 14),
('Negativa de FGTS', '2023-06-01', '32177897', 14),
('Negativa de Débitos Cível', '2023-06-01', 'A2B3C4D5JKL876HGTF430I3N2LKO43', 15),
('Negativa de Antecedentes Criminais', '2023-06-01', 'JKL876GBVF43PLG2G56NHN34HBKJL', 15),
('Negativa de FGTS', '2023-06-01', '87654320', 15),
('Negativa de Débitos Cível', '2023-06-01', '876HGTF430JKL8OI32O43PLMI9J0K', 16),
('Negativa de Antecedentes Criminais', '2023-06-01', 'NJHG2G56NHN3ABCDEF5GHVY53HBFI', 16),
('Negativa de FGTS', '2023-06-01', '54321098', 16);


INSERT INTO PROFESSOR (ufRegistro, numeroRegistro, valorHoraAula, tipoProfessor, cursoSuperior, idPessoa, idFuncionario) VALUES
('DF', '123456', 50.00, 'efetivo', 'Fisioterapia', 2, 2),
('DF', '654321', 60.00, 'estágio', 'Fisioterapia', 5, 5),
('MG', '987654', 55.00, 'efetivo', 'Fisioterapia', 7, 7),
('SP', '543210', 65.00, 'estágio', 'Fisioterapia', 10, 10),
('DF', '876543', 70.00, 'efetivo', 'Educação Física', 11, 11),
('BA', '135792', 55.00, 'efetivo', 'Educação Física', 12, 12),
('DF', '246810', 60.00, 'efetivo', 'Fisioterapia', 13, 13),
('GO', '112233', 75.00, 'efetivo', 'Educação Física', 14, 14),
('GO', '334455', 65.00, 'estágio', 'Fisioterapia', 15, 15),
('DF', '556677', 70.00, 'efetivo', 'Educação Física', 16, 16);


INSERT INTO PONTO_ministra (horarioEntrata, horarioSaida, atestado, justificativa, idAula, idProfessor, idPessoa) VALUES
('07:50:00', '10:00:00', null, null, 1, 1, 2),
('07:45:00', '10:00:00', null, null, 1, 2, 5),
('08:00:00', '10:00:00', null, null, 2, 3, 7),
('08:00:00', '10:00:00', null, null, 2, 4, 10),
('08:00:00', '10:00:00', null, null, 3, 5, 11),
('08:00:00', '10:00:00', null, null, 4, 6, 12),
('08:00:00', '10:00:00', null, null, 5, 7, 13),
('08:00:00', '10:00:00', null, null, 5, 9, 15),
('08:00:00', '10:00:00', null, null, 6, 8, 14),
('08:00:00', '10:00:00', null, null, 7, 10, 16),
('08:00:00', '10:00:00', null, null, 8, 1, 2),
('08:00:00', '10:00:00', null, null, 9, 3, 7),
('08:00:00', '10:00:00', null, null, 10, 3, 7),
('00:00:00', '00:00:00', 'Atestado2.pdf', 'Atraso por motivo pessoal', 5, 5, 11),
('00:00:00', '00:00:00', 'Atestado2.pdf', 'Atraso justificado', 7, 1, 2);

INSERT INTO RELATORIO (observacoes, laudoFisioterapeuta) VALUES
('Bom progresso durante as sessões.', 'Laudo1.pdf'),
('Necessidade de ajustes nos exercícios.', 'Laudo2.pdf'),
('Recuperação rápida e eficaz.', 'Laudo3.pdf'),
('Cliente demonstra comprometimento.', 'Laudo4.pdf'),
('Melhoria na flexibilidade e resistência.', 'Laudo5.pdf'),
('Excelente evolução do paciente.', 'Laudo6.pdf'),
('Problemas musculares persistem, recomenda-se mais sessões.', NULL),
('Cliente ausente nas últimas sessões.', NULL),
('Recuperação lenta, considerar ajustes no plano de tratamento.', 'Laudo7.pdf'),
('Melhora significativa nas dores nas costas.', NULL);


INSERT INTO DESPESA (tipoDespesa, dataDespesa, valorPagamento) VALUES
('Salário', '2023-01-10', 3.200),
('Salário', '2023-02-15', 3.700),
('Salário', '2023-03-20', 3.100),
('Salário', '2023-04-25', 3.000),
('Salário', '2023-06-01', 3.000),
('Salário', '2023-06-01', 3.000),
('Transporte', '2023-06-01', 350),
('Transporte', '2023-06-01', 350),
('Transporte', '2023-06-01', 350),
('Curso', '2023-06-20', 600);

INSERT INTO CURSO (nomeCurso, dataConclusao) VALUES
('Curso de Marketing Digital', '2022-12-15'),
('Curso de Gestão Financeira', '2023-01-20'),
('Curso de Liderança', '2023-02-25'),
('Curso de Programação Web', '2023-03-30'),
('Curso de Inglês Avançado', '2023-04-30'),
('Curso de Atendimento ao Cliente', '2023-06-15'),
('Curso Avançado de Relacionamento com o Cliente', '2023-07-20'),
('Curso de Comunicação Eficaz para Atendimento', '2023-08-25'),
('Treinamento em Experiência do Cliente', '2023-09-30'),
('Curso Prático de Suporte ao Cliente Online', '2023-10-30');

INSERT INTO possui (idPessoa, idCurso) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

INSERT INTO ESPECIALIDADE (nomeEspecialidade) VALUES
('Fisioterapia Esportiva'),
('Nutrição Esportiva'),
('Psicologia do Esporte'),
('Treinamento Funcional'),
('Reabilitação Muscular'),
('Pilates Clássico'),
('Pilates Gravity'),
('Pilates de Solo'),
('Pilates com Columpio wall'),
('Pilates para Gestantes');


INSERT INTO contem (idModalidade, idAula) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

INSERT INTO associa (idDespesa, idPessoa) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 1),
(7, 2),
(8, 3),
(9, 4),
(10, 5);

INSERT INTO gera (idAula, idRelatorio) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 1),
(7, 2),
(8, 3),
(9, 4),
(10, 5);

INSERT INTO cria (idDespesa, idPonto) VALUES
(1, 1),
(1, 11),
(1, 15),
(2, 2),
(3, 3),
(3, 12),
(3, 13),
(4, 4),
(5, 14),
(6, 6);

INSERT INTO tem (idProfessor, idEspecialidade) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);
