-- -------- < Clínica Médico - V4 > --------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 22/10/2023
-- Autor(es) ..............: Wesley Lira Carvalho
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula4exer5Evolucao4
--
-- PROJETO => 01 Base de Dados
--         => 11 Tabelas
-- 
-- Ultimas Alteracoes
--   22/10/2023 => Criação de nova tabela.
--
-- ---------------------------------------------------------

CREATE DATABASE IF NOT EXISTS aula4exer5Evolucao4;

USE aula4exer5Evolucao4;

CREATE TABLE IF NOT EXISTS MEDICO (
    numero INT(8) NOT NULL,
    unidadeFederativa CHAR(2) NOT NULL,
    nomeCompletoMedico VARCHAR(30) NOT NULL,
    
    CONSTRAINT MEDICO_PK PRIMARY KEY (numero, unidadeFederativa)
);

CREATE TABLE IF NOT EXISTS PACIENTE (
    nomeCompletoPaciente VARCHAR(30) NOT NULL,
    dataNascimento DATE NOT NULL,
    numero INT(2) NOT NULL,
    logradouro VARCHAR(100) NOT NULL,
    bairro VARCHAR(60) NOT NULL,
    cidade VARCHAR(30) NOT NULL,
    UF CHAR(2) NOT NULL,
    CEP INT(8) NOT NULL,
    complemento VARCHAR(100) NOT NULL,
    sexo CHAR(1) NOT NULL,

    CONSTRAINT PACIENTE_PK PRIMARY KEY (nomeCompletoPaciente, dataNascimento)
);

CREATE TABLE IF NOT EXISTS CONSULTA (
    dataConsulta TIMESTAMP NOT NULL,
    numero INT(8) NOT NULL,
    unidadeFederativa CHAR(2) NOT NULL,
    nomeCompletoPaciente VARCHAR(30) NOT NULL,
    dataNascimento DATE NOT NULL,

    CONSTRAINT CONSULTA_PK PRIMARY KEY (dataConsulta),
    CONSTRAINT CONSULTA_PACIENTE_FK FOREIGN KEY (nomeCompletoPaciente, dataNascimento)
    REFERENCES PACIENTE (nomeCompletoPaciente, dataNascimento)
    CONSTRAINT CONSULTA_MEDICO_FK FOREIGN KEY (numero, unidadeFederativa)
    REFERENCES MEDICO (numero, unidadeFederativa)
);

CREATE TABLE IF NOT EXISTS RECEITA (
    idReceita INT NOT NULL PRIMARY KEY,
    dataConsulta TIMESTAMP NOT NULL,
    medicamento VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS ESPECIALIZACAO (
    idEspecialidade INT NOT NULL,
    especialidade VARCHAR(30) NOT NULL,

    CONSTRAINT ESPECIALIZACAO_PK PRIMARY KEY (idEspecialidade)
);

CREATE TABLE IF NOT EXISTS MEDICAMENTO (
    idMedicamento INT NOT NULL,
    nome VARCHAR(30) NOT NULL,
    principioAtivo VARCHAR(30) NOT NULL,

    CONSTRAINT MEDICAMENTO_PK PRIMARY KEY (idMedicamento)
);

CREATE TABLE IF NOT EXISTS telefone (
    telefone INT NOT NULL,
    nomeCompletoPaciente VARCHAR(30) NOT NULL,
    dataNascimento DATE NOT NULL,
    telefone BIGINT(14),

    CONSTRAINT telefone_PK PRIMARY KEY (telefone),
    CONSTRAINT telefone_PACIENTE_FK FOREIGN KEY (nomeCompletoPaciente, dataNascimento)
    REFERENCES PACIENTE (nomeCompletoPaciente, dataNascimento)
);

CREATE TABLE IF NOT EXISTS possui (
    numero INT(8) NOT NULL,
    unidadeFederativa CHAR(2) NOT NULL,
    idEspecialidade INT NOT NULL,

    CONSTRAINT possui_PK PRIMARY KEY (numero, unidadeFederativa, idEspecialidade),
    CONSTRAINT possui_MEDICO_FK FOREIGN KEY (numero, unidadeFederativa)
    REFERENCES MEDICO (numero, unidadeFederativa),
    CONSTRAINT possui_ESPECIALIZACAO_FK FOREIGN KEY (idEspecialidade)
    REFERENCES ESPECIALIZACAO (idEspecialidade)
);

CREATE TABLE IF NOT EXISTS tem (
    idReceita INT NOT NULL,
    idMedicamento INT NOT NULL,

    CONSTRAINT tem_PK PRIMARY KEY (idReceita, idMedicamento),
    CONSTRAINT tem_RECEITA_FK FOREIGN KEY (idReceita)
    REFERENCES RECEITA (idReceita),
    CONSTRAINT tem_MEDICAMENTO_FK FOREIGN KEY (idMedicamento)
    REFERENCES MEDICAMENTO (idMedicamento)
);