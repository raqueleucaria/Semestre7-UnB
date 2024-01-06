-- -----------     << PILATES FIT CLUB >>     -------------------
-- 
--                    SCRIPT DE CRIACAO (DDL)
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
-- 						Alteracao de alguns atributos VARCHAR para ENUM	
-- 		16/12/2023 => 	Adicao do atributo nomeConvenio na tabela CONVENIO
-- 						Adicao da relacao que vira uma chave estrangeira na tabela CONTRATO vinda da tabela AUXILIARADMINISTRATIVO
-- 		20/12/2023 => 	Alteracao do nome da base de dados
-- 						Criacao da tabela que representa o relacionamento ajuda
--  					Alteracao da tabela telefone 
--
-- PROJETO => 01 Base de Dados
--         => 22 Tabelas
-- 		   => 03 Roles
-- 		   => 09 Usuarios
--
-- -----------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS TF_tema2;

USE TF_tema2;

CREATE TABLE CONVENIO (
    cnpjAgencia VARCHAR(14) NOT NULL,
    dataInicio DATE NOT NULL,
    dataFim DATE NOT NULL,
    statusConvenio ENUM('Ativo', 'Pendente', 'Inativo') NOT NULL,
    nomeConvenio VARCHAR(40) NOT NULL,
    
    CONSTRAINT CONVENIO_PK PRIMARY KEY (cnpjAgencia)
) ENGINE = InnoDB;

CREATE TABLE SESSAO (
    idSessao INTEGER(5) NOT NULL AUTO_INCREMENT,
    horarioInicio TIME  NOT NULL,
    dataSessao DATE NOT NULL,
    statusSessao ENUM('Agendada', 'Concluida', 'Cancelada') NOT NULL,
    
    CONSTRAINT SESSAO_PK PRIMARY KEY (idSessao)
) ENGINE = InnoDB;

CREATE TABLE CONTABANCARIA (
    idContaBancaria INTEGER(2) NOT NULL AUTO_INCREMENT,
    numeroConta VARCHAR(12) NOT NULL,
    agencia INTEGER(5) NOT NULL,
    numeroBanco INTEGER(5) NOT NULL,
    
    CONSTRAINT CONTABANCARIA_PK PRIMARY KEY (idContaBancaria)
) ENGINE = InnoDB;

CREATE TABLE DADOSCLT (
    idDadosClt INTEGER(2) NOT NULL AUTO_INCREMENT,
    nadaConstaJuridico VARCHAR(255) NOT NULL,
    nadaConstaCriminal VARCHAR(255) NOT NULL,
    nadaConstaTrabalhista VARCHAR(255) NOT NULL,
    
    CONSTRAINT DADOSCLT_PK PRIMARY KEY (idDadosClt)
) ENGINE = InnoDB;

CREATE TABLE ALUNO (
    rg VARCHAR(12) NOT NULL,
    justificativaPilates VARCHAR(150),
    cpf  VARCHAR(11) NOT NULL,
    nomeCompleto VARCHAR(40) NOT NULL,
    dataNascimento DATE NOT NULL,
    email VARCHAR(40) NOT NULL,
    estado VARCHAR(30) NOT NULL,
    cidade VARCHAR(30) NOT NULL,
    bairro VARCHAR(30) NOT NULL,
    rua VARCHAR(30) NOT NULL,
    numero INTEGER(3)  NOT NULL,
    cep INTEGER(8)  NOT NULL,
    numeroFaltas INTEGER(3) NOT NULL,
    numeroReposicoes INTEGER(3) NOT NULL,
    
	CONSTRAINT ALUNO_PK PRIMARY KEY (cpf)
) ENGINE = InnoDB;

CREATE TABLE AUXILIARADMINISTRATIVO (
    cpf VARCHAR(11) NOT NULL,
    nomeCompleto VARCHAR(40) NOT NULL,
    dataNascimento DATE NOT NULL,
    email VARCHAR(40) NOT NULL,
    estado VARCHAR(30) NOT NULL,
    cidade VARCHAR(30) NOT NULL,
    bairro VARCHAR(30) NOT NULL,
    rua VARCHAR(30) NOT NULL,
    numero INTEGER(3) NOT NULL,
    cep INTEGER(8) NOT NULL,
    idDadosClt INTEGER(2) NOT NULL,
    salario DECIMAL(6, 2) NOT NULL,
    idContaBancaria INTEGER(2) NOT NULL,
    numeroFaltas INTEGER(3) NOT NULL,
    
    CONSTRAINT AUXILIARADMINISTRATIVO_PK PRIMARY KEY (cpf),
    CONSTRAINT AUXILIARADMINISTRATIVO_DADOSCLT_FK FOREIGN KEY (idDadosClt) REFERENCES DADOSCLT(idDadosClt) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT AUXILIARADMINISTRATIVO_CONTABANCARIA_FK FOREIGN KEY (idContaBancaria) REFERENCES CONTABANCARIA(idContaBancaria) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB;

CREATE TABLE CONTRATO (
    idContrato INTEGER(5) NOT NULL AUTO_INCREMENT,
    dataInicio DATE NOT NULL,
    dataFim DATE NOT NULL,
    multaRescisao DECIMAL(5,2) NOT NULL,
    statusContrato ENUM('Ativo', 'Rescindido', 'Inativo') NOT NULL,
    numeroSessaoSemanal ENUM('2', '3') NOT NULL,
    enviadoPlano ENUM('Enviado', 'Não se aplica', 'Não enviado') NOT NULL,
    tipoContrato ENUM('Plano de saúde', 'Normal') NOT NULL,
    valorMensal DECIMAL(5, 2) NOT NULL,
    cpfAluno VARCHAR(11) NOT NULL,
    cpfAuxiliar VARCHAR(11) NOT NULL,
    
    CONSTRAINT ALUNO_PK PRIMARY KEY (idContrato),
    CONSTRAINT CONTRATO_ALUNO_FK FOREIGN KEY (cpfAluno) REFERENCES ALUNO(cpf) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT CONTRATO_AUXILIARADMINISTRATIVO_FK FOREIGN KEY (cpfAuxiliar) REFERENCES AUXILIARADMINISTRATIVO(cpf) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB;

CREATE TABLE GUIAPLANO (
    idGuia INTEGER(3) NOT NULL AUTO_INCREMENT,
    cpfAluno VARCHAR(11) NOT NULL,
    numeroCarteirinha VARCHAR(15) NOT NULL,
    validade DATE NOT NULL,
    numeroSessoes INTEGER(3) NOT NULL,
    cnpjAgencia VARCHAR(14) NOT NULL,
    
    CONSTRAINT GUIAPLANO_PK PRIMARY KEY (idGuia),
    CONSTRAINT GUIAPLANO_CONVENIO_FK FOREIGN KEY (cnpjAgencia) REFERENCES CONVENIO(cnpjAgencia) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT GUIAPLANO_ALUNO_FK FOREIGN KEY (cpfAluno) REFERENCES ALUNO(cpf) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB;

CREATE TABLE LAUDOMEDICO (
    idLaudoMedico INTEGER(3) NOT NULL AUTO_INCREMENT,
    dataEmissao DATE NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    cid VARCHAR(5),
    cpfAluno VARCHAR(11) NOT NULL,
    
    CONSTRAINT LAUDOMEDICO_PK PRIMARY KEY (idLaudoMedico),
    CONSTRAINT LAUDOMEDICO_ALUNO_FK FOREIGN KEY (cpfAluno) REFERENCES ALUNO(cpf) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB;

CREATE TABLE RELATORIO (
    idRelatorio INTEGER(5) NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(255) NOT NULL,
    dataCriacao DATE NOT NULL,
    cpfAluno  VARCHAR(11) NOT NULL,
    enviadoPlano ENUM('Enviado', 'Não enviado', 'Não se aplica') NOT NULL,
    
    CONSTRAINT RELATORIO_PK PRIMARY KEY (idRelatorio),
    CONSTRAINT RELATORIO_ALUNO_FK FOREIGN KEY (cpfAluno) REFERENCES ALUNO(cpf) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB;

CREATE TABLE PAGAMENTO (
    formaPagamento ENUM('Dinheiro', 'Pix', 'Cheque') NOT NULL,
    valor DECIMAL(5, 2) NOT NULL,
    proximoPagamento DATE NOT NULL,
    statusPagamento ENUM('Pago', 'Pendente') NOT NULL,
    cpfAluno VARCHAR(11)  NOT NULL,
    idPagamento INTEGER(4) NOT NULL AUTO_INCREMENT,
    tipoPagamento ENUM('Mensal', 'Semestral')  NOT NULL,
    
    CONSTRAINT PAGAMENTO_PK PRIMARY KEY (idPagamento),
    CONSTRAINT PAGAMENTO_ALUNO_FK FOREIGN KEY (cpfAluno) REFERENCES ALUNO(cpf) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB;

CREATE TABLE participa (
    idSessao INTEGER(5) NOT NULL AUTO_INCREMENT,
    cpf VARCHAR(11) NOT NULL,
    
    CONSTRAINT participa_PK PRIMARY KEY (idSessao, cpf),
    CONSTRAINT participa_SESSAO_FK FOREIGN KEY (idSessao) REFERENCES SESSAO(idSessao) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT participa_ALUNO_FK FOREIGN KEY (cpf) REFERENCES ALUNO(cpf) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB;

 CREATE TABLE INSTRUTOR (
    cpf  VARCHAR(11) NOT NULL,
    nomeCompleto VARCHAR(40)  NOT NULL,
    dataNascimento DATE  NOT NULL,
    email VARCHAR(40)  NOT NULL,
    estado VARCHAR(30) NOT NULL,
    cidade VARCHAR(30) NOT NULL,
    bairro VARCHAR(30) NOT NULL,
    rua VARCHAR(30) NOT NULL,
    numero INTEGER(3) NOT NULL,
    cep INTEGER(8) NOT NULL,
    idDadosClt INTEGER(2) NOT NULL,
    numeroCrefito INTEGER(9) NOT NULL,
    numeroEstado INTEGER(2) NOT NULL,
    tipoCrefito VARCHAR(2) NOT NULL,
    sessoesMinistradas INTEGER(5) NOT NULL,
    valorHoraAula DECIMAL(4, 2) NOT NULL,
    idContaBancaria INTEGER(2) NOT NULL,
    numeroFaltas INTEGER(3) NOT NULL,
    
    CONSTRAINT INSTRUTOR_PK PRIMARY KEY (cpf),
    CONSTRAINT INSTRUTOR_DADOSCLT_FK FOREIGN KEY (idDadosClt) REFERENCES DADOSCLT(idDadosClt) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT INSTRUTOR_CONTABANCARIA_FK FOREIGN KEY (idContaBancaria) REFERENCES CONTABANCARIA(idContaBancaria) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB;

CREATE TABLE telefone (
    idTelefone INTEGER(5) NOT NULL AUTO_INCREMENT,
    numero VARCHAR(11) NOT NULL,
    ddd INTEGER(3) NOT NULL,
    descricao VARCHAR(30),
    cpfDono VARCHAR(11) NOT NULL,
    
    CONSTRAINT telefone_PK PRIMARY KEY (idTelefone),
    CONSTRAINT telefone_ALUNO_FK FOREIGN KEY (cpfDono) REFERENCES ALUNO(cpf) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB;

CREATE TABLE especialidade (
    idEspecialidade INTEGER(3) NOT NULL AUTO_INCREMENT,
    especialidade VARCHAR(30) NOT NULL,
    cpfInstrutor  VARCHAR(11) NOT NULL,
    
    CONSTRAINT especialidade_PK PRIMARY KEY (idEspecialidade),
    CONSTRAINT especialidade_INSTRUTOR_FK FOREIGN KEY (cpfInstrutor) REFERENCES INSTRUTOR(cpf) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB;

CREATE TABLE ESTAGIARIO (
    cpf VARCHAR(11) NOT NULL,
    nomeCompleto VARCHAR(40) NOT NULL,
    dataNascimento DATE NOT NULL,
    email VARCHAR(40) NOT NULL,
    estado VARCHAR(30) NOT NULL,
    cidade VARCHAR(30) NOT NULL,
    bairro VARCHAR(30) NOT NULL,
    rua VARCHAR(30) NOT NULL,
    numero INTEGER(3) NOT NULL,
    cep INTEGER(8) NOT NULL,
    bolsaAuxilio DECIMAL(6, 2) NOT NULL,
    idContaBancaria INTEGER(2) NOT NULL,
    numeroFaltas INTEGER(3) NOT NULL,
    
    CONSTRAINT ESTAGIARIO_PK PRIMARY KEY (cpf),
    CONSTRAINT ESTAGIARIO_CONTABANCARIA_FK FOREIGN KEY (idContaBancaria) REFERENCES CONTABANCARIA(idContaBancaria) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB;

CREATE TABLE orienta (
    cpfEstagiario VARCHAR(11) NOT NULL,
    cpfInstrutor VARCHAR(11) NOT NULL,
    dataOrientacao DATE NOT NULL,
    
    CONSTRAINT orienta_INSTRUTOR_FK FOREIGN KEY (cpfInstrutor) REFERENCES INSTRUTOR(cpf) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT orienta_ESTAGIARIO_FK FOREIGN KEY (cpfEstagiario) REFERENCES ESTAGIARIO(cpf) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB;

CREATE TABLE escreve (
    cpfInstrutor VARCHAR(11) NOT NULL,
    idRelatorio INTEGER(5) NOT NULL,
    
    CONSTRAINT escreve_PK PRIMARY KEY (cpfInstrutor, idRelatorio),
    CONSTRAINT escreve_INSTRUTOR_FK FOREIGN KEY (cpfInstrutor) REFERENCES INSTRUTOR(cpf) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT escreve_RELATORIO_FK FOREIGN KEY (idRelatorio) REFERENCES RELATORIO(idRelatorio) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB;

CREATE TABLE leciona (
    cpfInstrutor VARCHAR(11) NOT NULL,
    idSessao INTEGER(5) NOT NULL,
    
    CONSTRAINT leciona_PK PRIMARY KEY (cpfInstrutor, idSessao),
    CONSTRAINT leciona_INSTRUTOR_FK FOREIGN KEY (cpfInstrutor) REFERENCES INSTRUTOR(cpf) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT leciona_SESSAO_FK FOREIGN KEY (idSessao) REFERENCES SESSAO(idSessao) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB;

CREATE TABLE ajuda (
    idSessao INTEGER(5) NOT NULL,
    cpfEstagiario VARCHAR(11) NOT NULL,
    
    CONSTRAINT ajuda_PK PRIMARY KEY (cpfEstagiario, idSessao),
    CONSTRAINT ajuda_ESTAGIARIO_FK FOREIGN KEY (cpfEstagiario) REFERENCES ESTAGIARIO(cpf) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT ajuda_SESSAO_FK FOREIGN KEY (idSessao) REFERENCES SESSAO(idSessao) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB;

CREATE TABLE ATESTADO (
    idAtestado INTEGER(5) NOT NULL AUTO_INCREMENT,
    dataInicio DATE NOT NULL,
    diagnostico VARCHAR(255) NOT NULL,
    cpfInstrutor VARCHAR(11),
    dataFim DATE NOT NULL,
    cpfAluno VARCHAR(11)  ,
    cpfAuxiliar VARCHAR(11),
    cpfEstagiario VARCHAR(11), 
    
	CONSTRAINT ATESTADO_PK PRIMARY KEY (idAtestado),
	CONSTRAINT ATESTADO_INSTRUTOR_FK FOREIGN KEY (cpfInstrutor) REFERENCES INSTRUTOR(cpf) ON DELETE RESTRICT ON UPDATE RESTRICT,
	CONSTRAINT ATESTADO_ALUNO_FK FOREIGN KEY (cpfAluno) REFERENCES ALUNO(cpf) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT ATESTADO_AUXILIARADMINISTRATIVO_FK FOREIGN KEY (cpfAuxiliar) REFERENCES AUXILIARADMINISTRATIVO(cpf) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT ATESTADO_ESTAGIARIO_FK FOREIGN KEY (cpfEstagiario) REFERENCES ESTAGIARIO(cpf) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB;

CREATE TABLE REMUNERACAO (
    idRemuneracao INTEGER(5) NOT NULL AUTO_INCREMENT,
    dataRemuneracao DATE NOT NULL,
    statusRemuneracao ENUM('Recebido', 'Pendente') NOT NULL,
    cpfInstrutor VARCHAR(11),
    cpfEstagiario VARCHAR(11),
    cpfAuxiliar VARCHAR(11),
    
    CONSTRAINT REMUNERACAO_PK PRIMARY KEY (idRemuneracao),
    CONSTRAINT REMUNERACAO_INSTRUTOR_FK FOREIGN KEY (cpfInstrutor) REFERENCES INSTRUTOR(cpf) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT REMUNERACAO_AUXILIARADMINISTRATIVO_FK FOREIGN KEY (cpfAuxiliar) REFERENCES AUXILIARADMINISTRATIVO(cpf) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT REMUNERACAO_ESTAGIARIO_FK FOREIGN KEY (cpfEstagiario) REFERENCES ESTAGIARIO(cpf) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB;
