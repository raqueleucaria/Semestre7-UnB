-- -----------     << PILATES FIT CLUB >>     -------------------
-- 
--                    SCRIPT POPULA
-- 
-- Data Criacao ...........: 03/12/2023
-- Autor(es) ..............: Guilherme Bessa, Johnny Lopes, Julia Souza, Leonardo Borges, Lucas Soares, Mariana Cruz, Maria Ferreira, Matheus Diogo, Paulo Borba, Pedro Barbosa, Pedro Morais, Pedro Rocha, Pedro Santana, Pedro Siqueira, Philipe Barros, Rafael Rodrigues, Raquel Costa, Ricardo Maciel, Rodrigo Bezerra, Valderson Junior, Vitor Santos, Vinicius Santos, Wesley Carvalho e Wildemberg Junior
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: TF_tema2
-- 
-- Data Ultima Alteracao ..:
-- 		10/12/2023 	=> 	Alteracao no nome da base de dados
-- 					 	Alteracao da quantidade de tabelas para 21
-- 					 		Adicao das tabelas CONTRATO, REMUNERACAO, CONVENIO e orienta
-- 					 	Alteracao da tabela PLANOSAUDE para GUIAPLANO
-- 						Alteracao nos dados populados em todas as tabelas
-- 		16/12/2023  => 	Adicao do atributo nomesConvenio na tabela CONVENIO
-- 						Adicao da chave estrangeira na tabela CONTRATO
-- 						Adicao de novas tuplas em todas as tabelas
-- 		20/12/2023 	=> 	Adicao do script de popular a tabela ajuda
--  					Alteracao do script da tabela telefone para se adequar aos novos atributos
--
-- PROJETO => 01 Base de Dados
--         => 22 Tabelas
-- 		   => 03 Roles
-- 		   => 09 Usuarios
--
-- -----------------------------------------------------------------

USE TF_tema2;

INSERT INTO CONVENIO (cnpjAgencia, dataInicio, dataFim, statusConvenio, nomeConvenio)
VALUES
    ('42189985000195', '2023-01-01', '2023-12-31', 'Ativo', 'Unimed'),
    ('58459595000128', '2024-01-01', '2025-01-01', 'Pendente', 'Hapvida'),
    ('27487222000137', '2023-03-10', '2024-03-10', 'Ativo', 'Bradesco'),
    ('19040537000103', '2021-09-01', '2022-09-01', 'Inativo', 'Alice'),
    ('93737587000105', '2023-06-20', '2024-06-20', 'Ativo', 'Amil'),
    ('07072103000106', '2022-01-01', '2022-12-31', 'Ativo', 'Blue'),
    ('34045673000180', '2022-03-01', '2023-03-01', 'Pendente', 'Allianz'),
    ('06749470000139', '2021-06-15', '2022-06-15', 'Inativo', 'Sami'),
    ('25001505000100', '2023-02-10', '2024-02-10', 'Ativo', 'Caixa'),
    ('17831028000173', '2023-09-01', '2024-09-01', 'Pendente', 'SulAmerica');
    
INSERT INTO SESSAO (horarioInicio, dataSessao, statusSessao)
VALUES
    ('10:00:00', '2023-12-30', 'Agendada'),
    ('14:00:00', '2023-02-20', 'Concluida'),
    ('15:00:00', '2023-03-10', 'Cancelada'),
    ('16:00:00', '2023-12-24', 'Agendada'),
    ('10:00:00', '2023-05-12', 'Concluida'),
    ('14:30:00', '2023-08-15', 'Agendada'),
    ('17:00:00', '2023-07-05', 'Concluida'),
    ('11:00:00', '2023-09-22', 'Cancelada'),
    ('15:30:00', '2023-11-10', 'Agendada'),
    ('13:00:00', '2023-10-01', 'Concluida');

INSERT INTO CONTABANCARIA (numeroConta, agencia, numeroBanco)
VALUES
    ('872587205682', 27151, 45905),
    ('481814276255', 79566, 56990),
    ('571302167407', 38581, 40535),
    ('993031080854', 44730, 99260),
    ('374071628960', 72967, 49264),
    ('199187523948', 11111, 98765),
    ('625482108756', 22222, 54321),
    ('901769977847', 33333, 87654),
    ('410856465961', 44444, 23456),
    ('674577382748', 55555, 65432),
    ('614665959772', 12345, 67890),
    ('902302443661', 54321, 98765),
    ('903303097591', 98765, 43210),
    ('584331606371', 13579, 24680),
    ('467007693002', 99999, 11111),
    ('542006733955', 54321, 12345),
    ('449587664994', 98765, 54321),
    ('604420173032', 12345, 98765),
    ('940368890205', 56789, 54321),
    ('828455892560', 34567, 98765),
    ('889525156391', 87654, 12345),
    ('150128725507', 43210, 56789),
    ('141655060041', 65432, 87654),
    ('141767095871', 23456, 76543),
    ('130997201553', 87654, 23456);

INSERT INTO DADOSCLT (nadaConstaJuridico, nadaConstaCriminal, nadaConstaTrabalhista)
VALUES
    ('Regular', 'Sem registros', 'Sem pendências'),
    ('Sem restrições', 'Nada consta', 'Nada consta'),
    ('Em ordem', 'Sem ocorrências', 'Nada consta'),
    ('Nada consta', 'Regular', 'Sem débitos'),
    ('Sem pendências', 'Nada consta', 'Regular'),
    ('Sem pendências jurídicas', 'Sem registros criminais', 'Sem problemas trabalhistas'),
    ('Regularizado judicialmente', 'Nada consta', 'Sem histórico trabalhista'),
    ('Em dia com obrigações legais', 'Sem antecedentes criminais', 'Sem questões trabalhistas'),
    ('Sem problemas jurídicos', 'Nada consta', 'Regularizado'),
    ('Sem processos judiciais', 'Limpo', 'Condição regular');

INSERT INTO ALUNO (rg, justificativaPilates, cpf, nomeCompleto, dataNascimento, email, estado, cidade, bairro, rua, numero, cep, numeroFaltas, numeroReposicoes)
VALUES
    ('509472394', 'Sem justificativa', '08879889117', 'Vinicius Fábio', '1990-05-20', 'vinicius.fabio@email.com', 'DF', 'Brasília', 'Asa Sul', 'Quadra 402', 123, '70000000', 5, 2),
    ('347477033', 'Dor nas costas', '71277155135', 'Maria Souza', '1985-12-15', 'maria.souza@email.com', 'DF', 'Brasília', 'Asa Norte', 'Quadra 102', 456, '70100000', 3, 1),
    ('167338006', 'Melhora da Postura', '32963805152', 'Carlos Oliveira', '1995-08-10', 'carlos.oliveira@email.com', 'DF', 'Brasília', 'Taguatinga', 'Avenida Principal', 789, '72100000', 8, 3),
    ('343391375', 'Melhora da Postura', '12911547101', 'Fernanda Santos', '1988-04-25', 'fernanda.santos@email.com', 'DF', 'Brasília', 'Lago Sul', 'Rua dos Lagos', 101, '71600000', 2, 0),
    ('183165871', 'Dor nas costas', '55793154140', 'Pedro Lima', '1992-11-30', 'pedro.lima@email.com', 'DF', 'Brasília', 'Sudoeste', 'Quadra 305', 222, '70600000', 6, 2),
    ('472892861', 'Alívio do Estressea', '33134334054', 'Amanda Oliveira', '1993-09-18', 'amanda.oliveira@email.com', 'DF', 'Brasília', 'Sudoeste', 'Quadra 305', 789, '70600000', 4, 1),
    ('171802780', 'Lesão no joelho', '53091107043', 'Lucas Santos', '1991-06-12', 'lucas.santos@email.com', 'DF', 'Brasília', 'Lago Norte', 'Quadra 104', 456, '70800000', 6, 2),
    ('345678912', 'Dor nas costas', '12345678901', 'Fernanda Lima', '1994-03-05', 'fernanda.lima@email.com', 'DF', 'Brasília', 'Taguatinga', 'Avenida Central', 567, '72300000', 5, 2),
    ('987654321', 'Reabilitação pós-cirúrgica', '11223344556', 'Rafael Oliveira', '1992-08-28', 'rafael.oliveira@email.com', 'DF', 'Brasília', 'Asa Sul', 'Quadra 502', 789, '70200000', 2, 0),
    ('567890123', 'Prevenção de lesões', '99887766554', 'Isabela Martins', '1996-12-10', 'isabela.martins@email.com', 'DF', 'Brasília', 'Lago Sul', 'Rua das Flores', 321, '71500000', 7, 3),
    ('110780838', 'Alívio do Estressea', '37392018000', 'Maria Silva', '1990-03-15', 'maria.silva@email.com', 'DF', 'Brasília', 'Asa Sul', 'Quadra 102', 123, 70000000, 2, 5),
    ('135930303', 'Prevenção de lesões', '13579962094', 'João Oliveira', '1985-07-22', 'joao.oliveira@email.com', 'DF', 'Brasília', 'Asa Norte', 'Quadra 402', 456, 70020000, 3, 7),
    ('500540834', 'Problemas de saúde', '49896796017', 'Camila Santos', '1992-12-10', 'camila.santos@email.com', 'DF', 'Brasília', 'Lago Sul', 'Quadra 104', 789, 70030000, 1, 8),
    ('306857522', 'Motivos pessoais', '00805042059', 'Roberto Costa', '1988-06-28', 'roberto.costa@email.com', 'DF', 'Brasília', 'Lago Norte', 'Quadra 206', 101, 70040000, 0, 6),
    ('133035074', 'Falta de interesse', '98603891010', 'Carolina Pereira', '1995-03-17', 'carolina.pereira@email.com', 'DF', 'Brasília', 'Sudoeste', 'Quadra 308', 202, 70050000, 4, 9);
    
    INSERT INTO AUXILIARADMINISTRATIVO (cpf, nomeCompleto, dataNascimento, email, estado, cidade, bairro, rua, numero, cep, idDadosClt, salario, idContaBancaria, numeroFaltas)
VALUES
    ('16007657000', 'Maria Oliveira', '1990-03-15', 'maria.oliveira@email.com', 'DF', 'Brasília', 'Asa Sul', 'Quadra 102', 456, '70000000', 1, 4500.00, 1, 0),
    ('25521666010', 'João Silva', '1985-06-20', 'joao.silva@email.com', 'DF', 'Brasília', 'Asa Norte', 'Quadra 202', 789, '70100000', 2, 4000.00, 2, 1),
    ('87082386001', 'Lucia Santos', '1992-09-25', 'lucia.santos@email.com', 'DF', 'Brasília', 'Taguatinga', 'Avenida Principal', 123, '72100000', 3, 3800.00, 3, 2),
    ('62812720050', 'Rafael Lima', '1988-12-10', 'rafael.lima@email.com', 'DF', 'Brasília', 'Lago Sul', 'Rua dos Lagos', 567, '71600000', 4, 4200.00, 4, 0),
    ('07566897080', 'Amanda Oliveira', '1995-05-03', 'amanda.oliveira@email.com', 'DF', 'Brasília', 'Sudoeste', 'Quadra 305', 890, '70600000', 5, 4700.00, 5, 1),
    ('11443428051', 'Ana Souza', '1990-05-15', 'ana.souza@email.com', 'DF', 'Brasília', 'Asa Norte', 'Quadra 102', 123, 70000000, 6, 4500.00, 11, 0),
    ('99092653039', 'Pedro Oliveira', '1985-08-22', 'pedro.oliveira@email.com', 'DF', 'Brasília', 'Asa Sul', 'Quadra 402', 456, 70020000, 7, 3800.00, 12, 2),
    ('99682019010', 'Camila Santos', '1992-12-10', 'camila.santos@email.com', 'DF', 'Brasília', 'Sudoeste', 'Quadra 104', 789, 70030000, 8, 5000.00, 13, 1),
    ('22600380000', 'Roberto Costa', '1988-06-28', 'roberto.costa@email.com', 'DF', 'Brasília', 'Lago Sul', 'Quadra 206', 101, 70040000, 9, 4200.00, 14, 0),
    ('28372590044', 'Carolina Pereira', '1995-03-17', 'carolina.pereira@email.com', 'DF', 'Brasília', 'Lago Norte', 'Quadra 308', 202, 70050000, 10, 4800.00, 15, 3);

INSERT INTO CONTRATO (dataInicio, dataFim, multaRescisao, statusContrato, numeroSessaoSemanal, enviadoPlano, tipoContrato, valorMensal, cpfAluno, cpfAuxiliar)
VALUES
    ('2022-01-15', '2022-12-31', 50.00, 'Ativo', '3', 'Não se aplica', 'Normal', 350.00, '08879889117', '16007657000'),
    ('2022-02-20', '2023-02-19', 30.00, 'Rescindido', '2', 'Não se aplica', 'Normal', 300.00, '71277155135', '25521666010'),
    ('2022-03-10', '2023-03-09', 40.00, 'Ativo', '3', 'Enviado', 'Plano de saúde', 0, '32963805152', '25521666010'),
    ('2022-04-05', '2023-04-04', 60.00, 'Inativo', '2', 'Não enviado', 'Plano de saúde', 0, '12911547101', '25521666010'),
    ('2022-05-12', '2023-05-11', 45.00, 'Ativo', '3', 'Enviado', 'Plano de saúde', 0, '55793154140', '25521666010'),
    ('2022-05-12', '2023-05-11', 45.00, 'Ativo', '3', 'Enviado', 'Plano de saúde', 0, '33134334054', '87082386001'),
    ('2022-05-12', '2023-05-11', 45.00, 'Ativo', '3', 'Enviado', 'Plano de saúde', 0, '53091107043', '87082386001'),
    ('2022-06-01', '2023-05-31', 55.00, 'Ativo', '3', 'Não se aplica', 'Normal', 350.00, '12345678901', '16007657000'),
    ('2022-06-05', '2023-06-04', 35.00, 'Ativo', '2', 'Não se aplica', 'Normal', 300.00, '11223344556', '07566897080'),
    ('2022-06-10', '2023-06-09', 50.00, 'Ativo', '3', 'Não se aplica', 'Normal', 350.00, '99887766554', '87082386001'),
    ('2022-01-01', '2022-12-31', 100.00, 'Ativo', '3', 'Enviado', 'Plano de saúde', 150.00, '37392018000', '07566897080'),
    ('2022-02-01', '2022-12-01', 80.50, 'Rescindido', '2', 'Não enviado', 'Plano de saúde', 200.00, '13579962094', '16007657000'),
    ('2022-03-01', '2023-03-01', 120.75, 'Ativo', '3', 'Enviado', 'Plano de saúde', 180.00, '49896796017', '07566897080'),
    ('2022-04-01', '2022-09-30', 60.25, 'Inativo', '2', 'Enviado', 'Plano de saúde', 175.00, '00805042059', '25521666010'),
    ('2022-05-01', '2023-05-01', 90.00, 'Ativo', '3', 'Enviado', 'Plano de saúde', 160.00, '98603891010', '16007657000');

INSERT INTO GUIAPLANO (cpfAluno, numeroCarteirinha, validade, numeroSessoes, cnpjAgencia)
VALUES
    ('32963805152', '123456789012345', '2023-12-31', 10, '42189985000195'),
    ('12911547101', '987654321098765', '2023-11-30', 8, '42189985000195'),
    ('55793154140', '567890123456789', '2023-10-31', 12, '42189985000195'),
    ('33134334054', '345678901234567', '2023-09-30', 15, '42189985000195'),
    ('53091107043', '890123456789012', '2023-08-31', 20, '19040537000103'),
    ('37392018000', '971054802096808', '2023-12-31', 10, '25001505000100'),
    ('13579962094', '655578364461552', '2024-01-15', 15, '17831028000173'),
    ('49896796017', '182059442895801', '2023-05-20', 12, '06749470000139'),
    ('00805042059', '784668129337827', '2022-09-30', 8, '17831028000173'),
    ('98603891010', '940250076578202', '2024-06-30', 20, '06749470000139');

-- Inserir dados na tabela LAUDOMEDICO
INSERT INTO LAUDOMEDICO (dataEmissao, descricao, cid, cpfAluno)
VALUES
    ('2022-01-15', 'Apto para atividades físicas', NULL, '08879889117'),
    ('2022-02-20', 'Dor lombar baixa', 'M54.5', '71277155135'),
    ('2022-03-10', 'Dor torso lombar', 'M54.4', '12345678901'),
    ('2022-04-05', 'Terapia física', 'Z50.0', '11223344556'),
    ('2022-05-12', 'Adequado para atividades físicas', NULL, '99887766554'),
    ('2023-01-15', 'Aptidão para atividades físicas regulares', 'Z00.0', '37392018000'),
    ('2022-11-20', 'Recomendação para evitar atividades de impacto', 'S83.5', '13579962094'),
    ('2023-02-25', 'Necessidade de acompanhamento médico regular', 'Z00.8', '49896796017'),
    ('2022-09-10', 'Liberado para todas as atividades físicas', NULL, '00805042059'),
    ('2023-04-05', 'Recomendação de fisioterapia para melhorar a postura', 'M54.2', '98603891010');

INSERT INTO RELATORIO (descricao, dataCriacao, cpfAluno, enviadoPlano)
VALUES
    ('Relatório de Progresso', '2022-06-15', '08879889117', 'Não se aplica'),
    ('Relatório de Avaliação', '2022-06-15', '71277155135', 'Não se aplica'),
    ('Relatório Mensal', '2022-06-15', '32963805152', 'Enviado'),
    ('Acompanhamento Trimestral', '2022-06-15', '12911547101', 'Enviado'),
    ('Registro de Sessões', '2022-06-15', '55793154140', 'Não enviado'),
    ('Avaliação Semestral', '2022-06-15', '33134334054', 'Enviado'),
    ('Avaliação de Progresso', '2022-06-15', '53091107043', 'Enviado'),
    ('Acompanhamento Trimestral', '2022-06-15', '12345678901', 'Não se aplica'),
    ('Relatório Pós-Cirúrgico', '2022-06-15', '11223344556', 'Não se aplica'),
    ('Registro de Prevenção', '2022-06-15', '99887766554', 'Não se aplica');

INSERT INTO PAGAMENTO (formaPagamento, valor, proximoPagamento, statusPagamento, cpfAluno, idPagamento, tipoPagamento)
VALUES
    ('Dinheiro', 120.00, '2022-07-01', 'Pago', '08879889117', 1, 'Mensal'),
    ('Pix', 100.00, '2022-07-01', 'Pago', '71277155135', 2, 'Mensal'),
    ('Cheque', 150.00, '2022-07-01', 'Pendente', '32963805152', 3, 'Mensal'),
    ('Pix', 200.00, '2022-07-01', 'Pago', '12911547101', 4, 'Mensal'),
    ('Dinheiro', 180.00, '2022-07-01', 'Pendente', '55793154140', 5, 'Mensal'),
    ('Pix', 160.00, '2022-07-01', 'Pago', '33134334054', 6, 'Mensal'),
    ('Cheque', 140.00, '2022-07-01', 'Pendente', '53091107043', 7, 'Mensal'),
    ('Pix', 130.00, '2022-07-01', 'Pago', '12345678901', 8, 'Mensal'),
    ('Dinheiro', 170.00, '2022-07-01', 'Pago', '11223344556', 9, 'Mensal'),
    ('Pix', 190.00, '2022-07-01', 'Pendente', '99887766554', 10, 'Mensal');

INSERT INTO participa (idSessao, cpf)
VALUES
    (1, '08879889117'),
    (1, '71277155135'),
    (2, '32963805152'),
    (2, '12911547101'),
    (3, '55793154140'),
    (3, '33134334054'),
    (4, '53091107043'),
    (4, '12345678901'),
    (5, '11223344556'),
    (5, '99887766554');

INSERT INTO INSTRUTOR (cpf, nomeCompleto, dataNascimento, email, estado, cidade, bairro, rua, numero, cep, idDadosClt, numeroCrefito, numeroEstado, tipoCrefito, sessoesMinistradas, valorHoraAula, idContaBancaria, numeroFaltas)
VALUES
    ('10052672000', 'João Silva', '1980-03-15', 'joao.silva@email.com', 'DF', 'Brasília', 'Asa Sul', 'Quadra 402', 123, '70000000', 1, '987654321', 15, 'FT', 50, 50.00, 1, 2),
    ('91887222014', 'Juliana Oliveira', '1975-08-22', 'juliana.oliveira@email.com', 'DF', 'Brasília', 'Asa Norte', 'Quadra 102', 456, '70100000', 2, '876543210', 10, 'FT', 30, 45.00, 2, 1),
    ('57533629078', 'Carlos Santos', '1985-12-10', 'carlos.santos@email.com', 'DF', 'Brasília', 'Taguatinga', 'Avenida Principal', 789, '72100000', 3, '765432109', 8, 'FT', 40, 55.00, 3, 3),
    ('67595329027', 'Fernanda Lima', '1982-05-28', 'fernanda.lima@email.com', 'DF', 'Brasília', 'Lago Sul', 'Rua dos Lagos', 101, '71600000', 4, '654321098', 12, 'FT', 25, 60.00, 4, 1),
    ('02765143005', 'Lucas Oliveira', '1990-09-18', 'lucas.oliveira@email.com', 'DF', 'Brasília', 'Sudoeste', 'Quadra 305', 222, '70600000', 5, '543210987', 20, 'FT', 35, 48.00, 5, 2),
    ('80929209079', 'Fernanda Oliveira', '1985-05-15', 'fernanda@email.com', 'DF', 'Brasília', 'Asa Sul', 'Quadra 301', 25, 70000000, 1, 123456789, 53, 'FT', 500, 80.00, 16, 0),
    ('59970934090', 'Ricardo Silva', '1978-10-22', 'ricardo@email.com', 'DF', 'Brasília', 'Asa Norte', 'Quadra 202', 10, 70200000, 2, 987654321, 53, 'FT', 450, 75.00, 17, 2),
    ('24971534008', 'Gabriela Santos', '1982-03-08', 'gabriela@email.com', 'DF', 'Brasília', 'Lago Sul', 'QL 28', 30, 71680000, 3, 654321987, 53, 'FT', 550, 90.00, 18, 1),
    ('56596764052', 'Marcelo Oliveira', '1975-12-17', 'marcelo@email.com', 'DF', 'Brasília', 'Sudoeste', 'SQSW 105', 15, 70680000, 4, 789123654, 53, 'FT', 600, 10.00, 19, 0),
    ('42558559001', 'Isabel Martins', '1988-07-29', 'isabel@email.com', 'DF', 'Brasília', 'Cruzeiro', 'SMCR Quadra 503', 28, 70660000, 5, 456789123, 53, 'FT', 480, 70.00, 20, 1);

INSERT INTO telefone (numero, ddd, descricao, cpfDono)
VALUES
    ('998765432', 55, 'Celular Principal', '08879889117'),
    ('987654321', 55, 'Celular do parente: Joao', '71277155135'),
    ('976543210', 55, 'Celular do namorado: Igor', '32963805152'),
    ('965432109', 55, 'Celular bom', '12911547101'),
    ('954321098', 55, 'Celular ruim', '12911547101'),
    ('921775834', 55, NULL, '08879889117'),
    ('926814725', 55, NULL, '71277155135'),
    ('921482112', 55, NULL, '32963805152'),
    ('922202759', 55, NULL, '12911547101'),
    ('931766331', 55, 'Segundo celular', '12911547101');

INSERT INTO especialidade (especialidade, cpfInstrutor)
VALUES
    ('Pilates Clássico', '10052672000'),
    ('Pilates Contemporâneo', '91887222014'),
    ('Pilates Funcional', '57533629078'),
    ('Pilates Solo', '67595329027'),
    ('Pilates Studio', '02765143005'),
    ('Reabilitação em Pilates', '10052672000'),
    ('Pilates em Aparelhos', '91887222014'),
    ('Pilates de Solo ', '57533629078'),
    ('Pilates Solo', '67595329027'),
    ('Pilates Studio', '02765143005');

INSERT INTO ESTAGIARIO (cpf, nomeCompleto, dataNascimento, email, estado, cidade, bairro, rua, numero, cep, bolsaAuxilio, idContaBancaria, numeroFaltas)
VALUES
    ('50909924015', 'Lucas Oliveira', '1998-02-10', 'lucas.oliveira@email.com', 'DF', 'Brasília', 'Asa Sul', 'Quadra 402', 123, '70000000', 1500.00, 6, 2),
    ('30984449086', 'Fernanda Lima', '1997-05-18', 'fernanda.lima@email.com', 'DF', 'Brasília', 'Asa Norte', 'Quadra 102', 456, '70100000', 1300.00, 7, 1),
    ('68974939029', 'João Silva', '1999-08-25', 'joao.silva@email.com', 'DF', 'Brasília', 'Taguatinga', 'Avenida Principal', 789, '72100000', 1200.00, 8, 3),
    ('48779371027', 'Maria Oliveira', '1996-11-30', 'maria.oliveira@email.com', 'DF', 'Brasília', 'Lago Sul', 'Rua dos Lagos', 101, '71600000', 1400.00, 9, 1),
    ('73341766006', 'Carlos Santos', '1995-04-05', 'carlos.santos@email.com', 'DF', 'Brasília', 'Sudoeste', 'Quadra 305', 222, '70600000', 1200.00, 10, 2),
    ('15193741002', 'Ana Silva', '1998-03-15', 'ana.silva@email.com', 'DF', 'Brasília', 'Asa Sul', 'Quadra 103', 123, 70000000, 1500.00, 1, 2),
    ('83493642032', 'Carlos Santos', '1997-06-22', 'carlos.santos@email.com', 'DF', 'Brasília', 'Asa Norte', 'Quadra 202', 456, 70200000, 1300.00, 2, 1),
    ('72957946033', 'Mariana Oliveira', '1999-11-10', 'mariana.oliveira@email.com', 'DF', 'Brasília', 'Lago Sul', 'Quadra 408', 789, 70400000, 1200.00, 3, 0),
    ('93377042008', 'Lucas Pereira', '2000-04-05', 'lucas.pereira@email.com', 'DF', 'Brasília', 'Guará', 'QE 28', 1011, 71000000, 1400.00, 4, 2),
    ('52006243047', 'Juliana Costa', '1998-09-18', 'juliana.costa@email.com', 'DF', 'Brasília', 'Sudoeste', 'Quadra 105', 1213, 70600000, 1600.00, 5, 1);

INSERT INTO orienta (cpfEstagiario, cpfInstrutor, dataOrientacao)
VALUES
    ('50909924015', '10052672000', '2023-01-15'),
    ('30984449086', '91887222014', '2023-02-20'),
    ('68974939029', '57533629078', '2023-03-10'),
    ('48779371027', '67595329027', '2023-04-05'),
    ('73341766006', '02765143005', '2023-05-12'),
    ('52006243047', '42558559001', '2023-01-10'),
    ('93377042008', '42558559001', '2023-02-15'),
    ('72957946033', '67595329027', '2023-03-20'),
    ('83493642032', '80929209079', '2023-04-25'),
    ('15193741002', '80929209079', '2023-05-30');
    
INSERT INTO escreve (cpfInstrutor, idRelatorio)
VALUES
    ('10052672000', 1),
    ('91887222014', 2),
    ('57533629078', 3),
    ('67595329027', 4),
    ('02765143005', 5),
    ('42558559001', 6),
    ('56596764052', 7),
    ('91887222014', 8),
    ('59970934090', 9),
    ('67595329027', 10);

INSERT INTO leciona (cpfInstrutor, idSessao)
VALUES
    ('10052672000', 1),
    ('91887222014', 2),
    ('57533629078', 3),
    ('67595329027', 4),
    ('02765143005', 5),
    ('67595329027', 6),
    ('59970934090', 7),
    ('91887222014', 8),
    ('56596764052', 9),
    ('42558559001', 10);
    
INSERT INTO ajuda (idSessao, cpfEstagiario) 
VALUES
	(1, '50909924015'),
	(2, '30984449086'),
	(3, '30984449086'),
	(4, '50909924015'),
	(5, '50909924015'),
	(6, '68974939029'),
	(7, '48779371027'),
	(8, '93377042008'),
	(9, '72957946033'),
	(10, '48779371027');

INSERT INTO ATESTADO (dataInicio, diagnostico, cpfInstrutor, dataFim, cpfAluno, cpfAuxiliar, cpfEstagiario)
VALUES
    ('2023-01-10', 'Dor nas costas', NULL, '2023-02-10', NULL, '99682019010', NULL),
    ('2023-03-05', 'Reabilitação pós-cirúrgica', NULL, '2023-03-20', NULL, '25521666010', NULL),
    ('2023-04-15', 'Lesão no joelho', NULL, '2023-05-15', NULL, '87082386001', NULL),
    ('2023-06-01', 'Alívio do Estresse', NULL, '2023-06-15', NULL, NULL, '50909924015'),
    ('2023-07-10', 'Dor nas costas', '02765143005', '2023-08-10', NULL, NULL, NULL),
    ('2023-01-01', 'Dor nas costas', NULL, '2023-01-15',  NULL, '25521666010',  NULL),
    ('2023-02-01', 'Lesão no joelho', NULL, '2023-02-15', '12345678901',  NULL,  NULL),
    ('2023-03-01', 'Dor no pescoço', NULL, '2023-03-15',  NULL,  NULL, '30984449086'),
    ('2023-04-01', 'Tendinite', '91887222014', '2023-04-15',  NULL,  NULL,  NULL),
    ('2023-05-01', 'Hérnia de disco', NULL, '2023-05-15',  NULL,  NULL, '50909924015');

INSERT INTO REMUNERACAO (dataRemuneracao, statusRemuneracao, cpfInstrutor, cpfEstagiario, cpfAuxiliar)
VALUES
    ('2023-01-15', 'Recebido', NULL, '73341766006', NULL),
    ('2023-03-10', 'Pendente', NULL, NULL, '25521666010'),
    ('2023-04-30', 'Recebido', NULL, '30984449086', NULL),
    ('2023-06-05', 'Recebido', NULL, '73341766006', NULL),
    ('2023-07-20', 'Pendente', '67595329027', NULL, NULL),
    ('2023-01-05', 'Recebido', '02765143005', NULL, NULL),
    ('2023-02-05', 'Pendente', NULL, '73341766006', NULL),
    ('2023-03-05', 'Recebido', NULL, NULL, '62812720050'),
    ('2023-04-05', 'Pendente', '02765143005', NULL, NULL),
    ('2023-05-05', 'Recebido', NULL, '93377042008', NULL);
