-- -----------     << Pilates >>     -------------------
-- 
--                 SCRIPT DE INSERCAO (DML)
-- 
-- Data Criacao ...........: 30/11/2023
-- Autor(es) ..............: Raquel Temóteo Eucaria Pereira da Costa
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: tema2Pilates
-- 
-- Data Ultima Alteracao ..: 04/12/2023
--
-- PROJETO => 01 Base de Dados
--         => 24 Tabelas
-- 
-- -----------------------------------------------------------------

-- BASE DE DADOS
USE tema2Pilates;
-- INSERCOES
INSERT INTO PESSOA (cpf, nomeCompleto, dataNascimento, sexo, ddiCelular, dddCelular, numeroCelular, email, uf, cidade, bairro, cep, rua, numero, complemento)
VALUES 
    (12345678901, 'João Silva', '1990-01-01', 'M', 55, 61, 987654321, 'joao@gmail.com', 'DF', 'Brasília', 'Sul', 12345678, 1, 123, 'Residencial Copacabana Apt 101'),
    (98765432109, 'Maria Oliveira', '1985-05-15', 'F', 55, 61, 987654322, 'maria@gmail.com', 'DF', 'Águas Claras', 'Norte', 54321098, 2, 456, 'Le Ciel 1105 B'),
    (11122334455, 'Carlos Santos', '1995-09-20', 'M', 55, 61, 987654323, 'carlos@gmail.com', 'DF', 'Águas Claras', 'Sul', 98765432, 3, 789, 'Casa 2'),
    (55566677788, 'Ana Souza', '1980-03-10', 'F', 55, 61, 987654324, 'ana@gmail.com', 'DF', 'Águas Claras', 'Norte', 87654321, 4, 321, 'Fundos'),
    (99988877766, 'Pedro Costa', '2000-11-05', 'M', 55, 61, 987654325, 'pedro@gmail.com', 'DF', 'Águas Claras', 'Sul', 13579246, 5, 654, 'Cobertura 2101'),
    (33344455566, 'Fernanda Lima', '1988-07-25', 'F', 55, 61, 987654326, 'fernanda@gmail.com', 'DF', 'Taguatinga', 'Norte', 65432109, 6, 987, 'Apartamento 502'),
    (77788899900, 'Ricardo Oliveira', '1975-02-12', 'M', 55, 61, 987654327, 'ricardo@gmail.com', 'DF', 'Taguatinga', 'Sul', 54321098, 7, 654, 'Casa 3'),
    (11122233344, 'Camila Martins', '1992-10-18', 'F', 55, 61, 987654328, 'camila@gmail.com', 'DF', 'Ceilândia', 'Norte', 98765432, 8, 321, 'Bloco B'),
    (44455566677, 'Lucas Santos', '1983-12-05', 'M', 55, 61, 987654329, 'lucas@gmail.com', 'DF', 'Ceilândia', 'Sul', 87654321, 9, 789, 'Kitnet 105'),
    (88899900011, 'Aline Costa', '1998-04-30', 'F', 55, 61, 987654330, 'aline@gmail.com', 'DF', 'Taguatinga', 'Norte', 13579246, 10, 654, 'Cobertura 2302'),
	(11122233399, 'Eva Oliveira', '1953-08-12', 'F', 55, 61, 987654331, 'eva@gmail.com', 'DF', 'Brasília', 'Norte', 12345000, 11, 111, 'Condomínio x Apt 301'),
    (77788899922, 'Manoel Santos', '1949-04-28', 'M', 55, 61, 987654332, 'manoel@gmail.com', 'DF', 'Taguatinga', 'Sul', 54321987, 12, 222, 'Casa 15');

INSERT INTO ALUNO (nivel, idPessoa)
VALUES 
    ('Iniciante', 1),
    ('Intermediário', 2),
    ('Avançado', 3),
    ('Iniciante', 4),
    ('Intermediário', 5),
	('Iniciante', 11),
    ('Iniciante', 12);

INSERT INTO FUNCIONARIO (funcao, pisConfis, banco, conta, agencia, idPessoa)
VALUES 
    ('Professor', 12345678901, 'Banco A', 123456, 98765, 6),
    ('Professor', 98765432109, 'Banco B', 654321, 56789, 9),
    ('Professor', 11122334455, 'Banco C', 987654, 43210, 10),
    ('Auxiliar', 55566677788, 'Banco D', 456789, 87654, 8);

INSERT INTO PROFESSOR (tipoProfessor, horaAula, numeroRegistro, ufRegistro, cursoSuperior, idPessoa)
VALUES 
    ('Fisioterapeuta', 20.5, 1234, 'DF', 'Fisioterapia', 6),
    ('Educador Físico', 20.5, 5678, 'DF', 'Educação Física', 9),
    ('Estagiário', 18.0, NULL, NULL, 'Fisioterapia', 10);

INSERT INTO SEGURADORA (cnpj, nomeSeguradora, validade, tipoCobertura)
VALUES 
    (12345678901234, 'Seguro A', '2023-12-31', 'Reembolso'),
    (98765432109876, 'Seguro B', '2023-12-31', 'Guias'),
    (11112222333344, 'Seguro C', '2023-12-31', 'Reembolso'),
    (55556666777788, 'Seguro D', '2023-12-31', 'Guias'),
    (99998888777766, 'Seguro E', '2023-12-31', 'Reembolso');

INSERT INTO PACIENTE (rg, carteirinha, cidPedido, observacao, statusProcesso, qtSessoes, idSeguradora, idPessoa)
VALUES 
    (987654321, 12345678901, 123, 'Idosa', 'Em análise', 10, 1, 11),
    (876543210, 98765432109, 456, 'Idosa', 'Aprovado', 15, 2, 12),
    (765432109, 11122334455, 789, 'Grávida', 'Em análise', 8, 3, 2),
    (654321098, 55566677788, 101, 'Observação 3', 'Aprovado', 12, 4, 4),
    (543210987, 99988877766, 112, 'Sem observações', 'Aprovado', 20, 5, 5);

INSERT INTO CURSO (nomeCurso, dataConclusao, idFuncionario)
VALUES 
    ('Pilates', '2018-12-15', 1),
    ('Pilates Avançado', '2019-07-30', 1),
    ('Gravity Pilates', '2020-01-10', 1),
    ('Columpio wall', '2020-03-20', 1),
	('Pilates', '2015-12-15', 2),
	('Pilates Avançado', '2016-07-30', 2),
    ('Gravity Pilates', '2021-01-10', 2),
    ('Columpio wall', '2021-02-20', 2),
    ('Pilates', '2022-12-15', 3),
    ('Pilates Avançado', '2023-07-30', 3),
    ('Curso E', '2023-03-05', 4);

INSERT INTO CERTIDAO_NEGATIVA (tipoCertidao, numeroSelo, dataCertidao, idFuncionario)
VALUES 
    ('Criminal', 'ABC12345', '2022-12-01', 1),
    ('Trabalhista', 'DEF67890', '2022-11-20', 2),
    ('Civel', 'GHI54321', '2022-12-05', 3),
    ('Criminal', 'JKL98765', '2022-11-25', 4),
    ('Trabalhista', 'MNO12345', '2022-12-10', 3);

INSERT INTO HORARIO (diaSemana, turno, horarioInicio)
VALUES 
    ('Seg', 'Manhã', '08:00:00'),
    ('Ter', 'Tarde', '14:00:00'),
    ('Qua', 'Noite', '19:00:00'),
    ('Qui', 'Manhã', '10:30:00'),
    ('Sex', 'Tarde', '16:30:00');

INSERT INTO AULA (dataAula, duracao, horario, professor, professor2)
VALUES 
    ('2022-12-01', '00:55:00', 1, 1, NULL),
    ('2022-12-02', '00:55:00', 2, 1, 3),
    ('2022-12-03', '00:55:00', 3, 2, NULL),
    ('2022-12-04', '00:55:00', 4, 2, 3),
    ('2022-12-05', '00:55:00', 1, 2, NULL),
    ('2022-12-06', '00:55:00', 3, 1, NULL),
    ('2022-12-06', '00:55:00', 4, 1, 3);

INSERT INTO PARENTE (nomeParente, tipoParentesco, ddiContato, dddContato, numeroContato, idPaciente)
VALUES 
    ('Parente A', 'Marido', 55, 11, 123456789, 3),
    ('Parente B', 'Mãe', 55, 11, 987654321, 3),
    ('Parente C', 'Filho', 55, 11, 111223344,1),
    ('Parente D', 'Filha', 55, 11, 555666777, 1),
	('Parente E', 'Filha', 55, 11, 111223344, 2),
    ('Parente F', 'Filha', 55, 11, 555666777, 2);

INSERT INTO HISTORICO (laudo, observacoes)
VALUES 
    ('S', 'Observações sobre o histórico A'),
    ('N', 'Sem observações no histórico B'),
    ('S', 'Observações sobre o histórico C'),
    ('N', 'Sem observações no histórico D'),
    ('S', 'Observações sobre o histórico E');

INSERT INTO GERA (registroFisioterapeuta, idAula, idHistorico, idProfessor)
VALUES 
    (1234, 1, 1, 1),
    (5678, 2, 2, 2),
    (1234, 3, 3, 1),
    (5678, 5, 4, 2),
    (1234, 4, 5, 1);


INSERT INTO CONTRATO (tipoPlano, dataAssinatura, dataFim, mensalidade, qtAulas, idPessoa)
VALUES 
    ('2x Semana', '2022-12-01', '2023-02-28', 150.00, 8, 1),
    ('3x Semana', '2022-11-15', '2023-01-31', 200.00, 12, 2),
    ('Reembolso', '2023-01-01', '2023-03-31', 180.00, 10, 3),
    ('Guias', '2023-02-10', '2023-04-30', 160.00, 8, 4),
    ('Guias', '2023-03-05', '2023-05-31', 190.00, 16, 5),
    ('Reembolso', '2023-02-10', '2023-04-30', 160.00, 8, 11),
    ('Guias', '2023-03-05', '2023-05-31', 190.00, 16, 12);

INSERT INTO ALUNO_AULA (idAluno, idAula)
VALUES 
    (1, 1),
    (1, 2),
    (1, 3),
    (1, 4),
    (2, 1),
    (2, 2),
    (2, 3),
    (2, 4),
    (2, 5),
    (2, 11),
    (2, 12),
    (4, 1),
    (4, 2),
    (4, 3);

INSERT INTO TREINO_REALIZA (idAluno, idAula)
VALUES 
    (1, 1),
    (1, 2),
    (1, 3),
    (1, 4),
    (2, 1),
    (2, 2),
    (2, 3),
    (2, 4),
    (2, 5),
    (2, 11),
    (2, 12),
    (4, 1),
    (4, 2),
    (4, 3);

INSERT INTO GERAFALTA (idFalta, idAluno, idAula)
VALUES 
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 1),
    (4, 4, 2),
    (5, 3, 4);

INSERT INTO FALTA (reposicao, atestado)
VALUES 
    ('N', 'S'),
    ('S', 'N'),
    ('N', 'S'),
    ('S', 'N'),
    ('N', 'S');

INSERT INTO PONTO_MINISTRA (idProfessor, idAula)
VALUES 
    (1, 1),
    (1, 2),
    (3, 2),
    (2, 3),
    (2, 4);
    

INSERT INTO compoeFolha (idPonto, idProfessor, idAula)
VALUES 
    (1, 1, 1),
    (2, 1, 2),
    (3, 3, 2),
    (4, 2, 3),
    (5, 2, 4);

INSERT INTO FOLHA_PONTO (horarioEntrata, horarioSaida, atestado, justificativa)
VALUES 
    ('08:00:00', '10:00:00', NULL, NULL),
    ('14:00:00', '15:00:00', NULL, NULL),
    (NULL, NULL, 'N', 'Passou mal com enxaqueca'),
    ('18:50:00', '20:30:00', NULL, NULL),
    ('06:30:00', '08:45:00', NULL, NULL);

INSERT INTO defineDespesa (horaTrabalhada, idDespesa, idPonto)
VALUES 
    ('02:00:00', 1, 1),
    ('01:00:00', 2, 2),
    ('00:00:00', 3, 3),
    ('01:40:00', 4, 4),
    ('02:15:00', 5, 5);


INSERT INTO RECEITA (dataVencimento, dataPagamento, valorAula, desconto, tipoPagamento, idContrato)
VALUES 
    ('2022-12-05', '2022-12-05', 150.00, NULL, 'Cheque', 1),
    ('2022-11-25', '2022-11-25', 200.00, 10.00, 'Cheque', 2),
    ('2022-12-10', '2022-12-10', 180.00, NULL, 'Pix', 3),
    ('2023-02-20', '2023-02-20', 160.00, 5.00, 'Cheque', 4),
    ('2023-03-05', '2023-03-05', 190.00, 15.00, 'Pix', 5);

INSERT INTO DESPESA (tipoDespesa, dataDespesa, idFuncionario, horaTrabalhada)
VALUES 
    ('Salário', '2022-12-01', 1, '02:00:00'),
    ('Curso', '2022-11-20', 2, '01:30:00'),
    ('Transporte', '2022-12-05', 3, '02:30:00'),
    ('Bonificação', '2022-11-25', 4, '01:00:00'),
    ('Outro', '2022-12-10', 4, '02:15:00');

