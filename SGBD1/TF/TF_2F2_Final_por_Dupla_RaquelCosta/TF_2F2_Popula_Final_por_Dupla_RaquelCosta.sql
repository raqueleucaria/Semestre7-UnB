-- -----------     << Pilates >>     -------------------
-- 
--                 SCRIPT POPULA (DDL)
-- 
-- Data Criacao ...........: 09/12/2023
-- Autor(es) ..............: Mariana Letícia Santos da Cruz e Raquel Temóteo Eucaria Pereira da Costa
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: TF_2F2_raquelcosta
-- 
--
-- PROJETO => 01 Base de Dados
--         => 26 Tabelas
-- 
-- Ultimas Alteracoes
--   09/12/2023 => Criação do script de criação 
--   11/12/2023 => Ajuste dos atributos

-- -----------------------------------------------------------------
-- BASE DE DADOS
USE TF_2F2_raquelcosta;

-- INSERCOES
INSERT INTO PLANO_SAUDE (validade, cnpj, tipoCobertura, nomePlano) VALUES
('2023-01-01', 12345678901234, 'Completa', 'Plano Ouro'),
('2023-02-01', 98765432109876, 'Básica', 'Plano Prata'),
('2023-03-01', 11223344556677, 'Premium', 'Plano Diamante'),
('2023-04-01', 22334455667788, 'Intermediária', 'Plano Bronze'),
('2023-05-01', 33445566778899, 'Completa', 'Plano Safira');

INSERT INTO HORARIO (diaSemana, horarioInicio) VALUES
('segunda', '08:00:00'),
('terça', '10:30:00'),
('quarta', '14:00:00'),
('quinta', '16:45:00'),
('sexta', '19:30:00');

INSERT INTO MODALIDADE (tipoModalidade) VALUES
('Musculação'),
('Aeróbica'),
('Yoga'),
('Pilates'),
('Natação');

INSERT INTO ALUNO (idAluno, idPessoa, rg, nivel, cpf, nomeCompleto, sexo, ddiContato, numeroContato, dddContato, email, dataNascimento, uf, complemento, cidade, numero, cep, rua, bairro, idPlanoSaude, statusProcesso, carteiraConvenio, qtSessoes)
VALUES
(1, 1, 1234567, 'iniciante', '12345678901', 'João Silva', 'M', 55, 987654321, 11, 'joao@email.com', '1990-05-15', 'SP', 'Apto 101', 'São Paulo', 123, 12345678, 123, 'Avenida Paulista',1, 'processando', 'ABC123', 20),
(2, 2, 7654321, 'intermediario', '98765432109', 'Maria Oliveira', 'F', 55, 123456789, 11, 'maria@email.com', '1985-10-20', 'RJ', 'Casa 20', 'Rio de Janeiro', 987, 98765432, 456, 'Rua Copacabana', 2, 'aprovado', 'XYZ456', 30),
(3, 3, 9876543, 'avancado', '98765432101', 'Carlos Santos', 'M', 55, 555555555, 11, 'carlos@email.com', '1982-03-08', 'MG', 'Bloco B', 'Belo Horizonte', 543, 54321098, 789, 'Avenida Afonso Pena', 3, 'aprovado', 'DEF789', 40),
(4, 4, 8765432, 'iniciante', '12345678902', 'Ana Oliveira', 'F', 55, 999999999, 11, 'ana@email.com', '1995-12-01', 'SP', 'Casa 5', 'Campinas', 654, 65432109, 321, 'Rua Barão de Jaguara', 4, 'recusado', 'GHI012', 25),
(5, 5, 2345678, 'intermediario', '98765432103', 'Lucas Pereira', 'M', 55, 777777777, 11, 'lucas@email.com', '1988-07-17', 'RS', 'Apartamento 15', 'Porto Alegre', 876, 87654321, 654, 'Avenida Borges de Medeiros',  5, 'processando', 'JKL345', 35);

INSERT INTO PARENTE (nomeParente, tipoParentesco, ddiContato, dddContato, numeroContato, idPessoa) VALUES
('José Silva', 'pai', 55, 11, 123456789, 1),
('Ana Oliveira', 'mãe', 55, 11, 987654321, 4),
('Roberto Santos', 'irmão', 55, 11, 555555555, 3),
('Clara Santos', 'irmã', 55, 11, 999999999, 5),
('Lucia Oliveira', 'tia', 55, 11, 777777777, 2);

INSERT INTO CONTRATO (mensalidade, dataAssinatura, dataFim, tipoPlano, idPessoa) VALUES
(150.00, '2023-01-10', '2023-06-10', 1, 1),
(120.00, '2023-02-15', '2023-07-15', 2, 2),
(200.00, '2023-03-20', '2023-08-20', 1, 3),
(100.00, '2023-04-25', '2023-09-25', 2, 4),
(180.00, '2023-05-30', '2023-10-30', 1, 5);

INSERT INTO RECEITA (tipoPagamento, dataPagamento, desconto, valorAula, dataVencimento, idContrato) VALUES
('cheque', '2023-01-10', 10.00, 20.00, '2023-01-15', 1),
('pix', '2023-02-15', NULL, 25.00, '2023-02-20', 2),
('cheque', '2023-03-20', 15.00, 30.00, '2023-03-25', 3),
('pix', '2023-04-25', NULL, 18.00, '2023-04-30', 4),
('cheque', '2023-05-30', 20.00, 35.00, '2023-05-31', 5);

INSERT INTO LAUDO_MEDICO (cidPedido, documento, idPessoa) VALUES
(123, 'laudo1.pdf', 1),
(456, 'laudo2.pdf', 2),
(789, 'laudo3.pdf', 3),
(234, 'laudo4.pdf', 4),
(567, 'laudo5.pdf', 5);

INSERT INTO FALTA (atestado, reposicao) VALUES
('Atestado1.pdf', TRUE),
('Atestado2.pdf', FALSE),
('Atestado3.pdf', TRUE),
('Atestado4.pdf', FALSE),
('Atestado5.pdf', TRUE);

INSERT INTO AULA (dataAula, idHorario) VALUES
('2023-01-10', 1),
('2023-02-15', 2),
('2023-03-20', 3),
('2023-04-25', 4),
('2023-05-30', 5);

INSERT INTO AGENDAMENTO_realiza (idAula, idPessoa) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO geraFalta (idFalta, idAula, idPessoa) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- Inserção de dados na tabela FUNCIONARIO
INSERT INTO FUNCIONARIO (idFuncionario, funcao, banco, conta, agencia, escolaridade, cpf, nomeCompleto, sexo, ddiContato, numeroContato, dddContato, email, dataNascimento, uf, cidade, cep, numero, rua, bairro) VALUES
(1, 'Recepcionista', 'Banco A', '12345-6', '7890', 'Ensino Médio', '12345678901', 'Alice Silva', 'F', 55, 987654321, 11, 'alice@email.com', '1992-08-12', 'SP', 'São Paulo', 98765432, 321, 'Rua Augusta', 'Jardins'),
(2, 'Instrutor', 'Banco B', '65432-1', '0987', 'Ensino Superior', '98765432109', 'Daniel Oliveira', 'M', 55, 123456789, 11, 'daniel@email.com', '1980-05-25', 'RJ', 'Rio de Janeiro', 12345678, 123, 'Avenida Copacabana', 'Copacabana'),
(3, 'Limpeza', 'Banco C', '98765-4', '7654', 'Ensino Fundamental', '98765432101', 'Marcos Santos', 'M', 55, 555555555, 11, 'marcos@email.com', '1985-12-03', 'MG', 'Belo Horizonte', 54321098, 789, 'Rua Bahia', 'Centro'),
(4, 'Gerente', 'Banco D', '54321-0', '4321', 'Ensino Superior', '12345678902', 'Beatriz Oliveira', 'F', 55, 999999999, 11, 'beatriz@email.com', '1988-02-20', 'SP', 'Campinas', 65432109, 321, 'Rua Barão de Jaguara', 'Centro'),
(5, 'Instrutor', 'Banco E', '98765-0', '1234', 'Ensino Superior', '98765432103', 'Rodrigo Pereira', 'M', 55, 777777777, 11, 'rodrigo@email.com', '1991-07-17', 'RS', 'Porto Alegre', 87654321, 654, 'Avenida Farrapos', 'Centro');

INSERT INTO CERTIDAO_NEGATIVA (tipoCertidao, dataCertidao, numeroSelo) VALUES
('Negativa de Débitos', '2023-01-01', 123456),
('Negativa de Antecedentes Criminais', '2023-02-01', 789012),
('Negativa de Protesto', '2023-03-01', 345678),
('Negativa de Dívida Ativa', '2023-04-01', 901234),
('Negativa de FGTS', '2023-05-01', 567890);

INSERT INTO PROFESSOR (ufRegistro, numeroRegistro, valorHoraAula, tipoProfessor, cursoSuperior, idPessoa, idFuncionario) VALUES
('SP', '123456', 50.00, 'estágio', 'Educação Física', 1, 1),
('RJ', '654321', 60.00, 'efetivo', 'Dança', 3, 3),
('MG', '987654', 55.00, 'efetivo', 'Nutrição', 4, 4),
('SP', '543210', 65.00, 'estágio', 'Fisioterapia', 5, 5),
('RS', '876543', 70.00, 'efetivo', 'Psicologia', 2, 2);

INSERT INTO PONTO_ministra (horarioEntrata, horarioSaida, atestado, justificativa, idAula, idProfessor, idPessoa) VALUES
('08:00:00', '10:00:00', 'Atestado1.pdf', 'Atraso justificado', 1, 1, 2),
('10:30:00', '12:30:00', 'Atestado2.pdf', 'Compromisso médico', 2, 2, 3),
('14:00:00', '16:00:00', 'Atestado3.pdf', 'Atraso por trânsito', 3, 3, 4),
('16:45:00', '18:45:00', 'Atestado4.pdf', 'Atraso justificado', 4, 4, 5),
('19:30:00', '21:30:00', 'Atestado5.pdf', 'Atraso por motivo pessoal', 5, 5, 1);

INSERT INTO RELATORIO (observacoes, laudoFisioterapeuta) VALUES
('Bom progresso durante as sessões.', 'Laudo1.pdf'),
('Necessidade de ajustes nos exercícios.', 'Laudo2.pdf'),
('Recuperação rápida e eficaz.', 'Laudo3.pdf'),
('Cliente demonstra comprometimento.', 'Laudo4.pdf'),
('Melhoria na flexibilidade e resistência.', 'Laudo5.pdf');

INSERT INTO DESPESA (tipoDespesa, dataDespesa, valorPagamento) VALUES
('Material de escritório', '2023-01-10', 150.00),
('Manutenção de equipamentos', '2023-02-15', 300.00),
('Pagamento de contas', '2023-03-20', 250.00),
('Despesas de viagem', '2023-04-25', 500.00),
('Treinamento de equipe', '2023-05-30', 400.00);

INSERT INTO CURSO (nomeCurso, dataConclusao) VALUES
('Curso de Marketing Digital', '2022-12-15'),
('Curso de Gestão Financeira', '2023-01-20'),
('Curso de Liderança', '2023-02-25'),
('Curso de Programação Web', '2023-03-30'),
('Curso de Inglês Avançado', '2023-04-30');

INSERT INTO possui (idPessoa, idCurso) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO ESPECIALIDADE (nomeEspecialidade) VALUES
('Fisioterapia Esportiva'),
('Nutrição Esportiva'),
('Psicologia do Esporte'),
('Treinamento Funcional'),
('Reabilitação Muscular');

INSERT INTO contem (idModalidade, idAula) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO associa (idDespesa, idPessoa) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO gera (idAula, idRelatorio) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO apresenta (idPessoa, idCertidao) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
INSERT INTO cria (idDespesa, idPonto) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
INSERT INTO tem (idPessoa, idEspecialidade) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
