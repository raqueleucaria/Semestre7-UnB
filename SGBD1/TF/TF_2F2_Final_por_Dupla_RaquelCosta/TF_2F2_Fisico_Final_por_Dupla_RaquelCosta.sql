-- -----------     << Pilates >>     -------------------
-- 
--                 SCRIPT DE CRIACAO (DDL)
-- 
-- Data Criacao ...........: 09/12/2023
-- Autor(es) ..............: Mariana Letícia Santos da Cruz e Raquel Temóteo Eucaria Pereira da Costa
-- Banco de Dados .........: MySQL
-- Banco de Dados(nome) ...: tema2
-- 
--
-- PROJETO => 01 Base de Dados
--         => 27 Tabelas
-- 
-- Ultimas Alteracoes
--   09/12/2023 => Criação do script de criação 
--   11/12/2023 => Ajuste dos atributos

-- -----------------------------------------------------------------

create database if not exists TF_2F2_raquelcosta;
-- BASE DE DADOS
USE TF_2F2_raquelcosta;

-- INSERCOES
CREATE TABLE PLANO_SAUDE (
    idPlanoSaude INTEGER AUTO_INCREMENT,
    validade DATE NOT NULL,
    cnpj BIGINT(14) NOT NULL,
    tipoCobertura varchar(9) NOT NULL,
    nomePlano varchar(50) NOT NULL,
    
    CONSTRAINT PLANO_SAUDE_PK PRIMARY KEY (idPlanoSaude)
)Engine = InnoDB;

CREATE TABLE HORARIO (
	idHorario INTEGER AUTO_INCREMENT,
    diaSemana ENUM('segunda,terça', 'quarta', 'quinta', 'sexta', 'sabado', 'domingo') NOT NULL,
    horarioInicio time NOT NULL,
    
    CONSTRAINT HORARIO_PK PRIMARY KEY (idHorario)
)Engine = InnoDB;

CREATE TABLE MODALIDADE (
    idModalidade INTEGER AUTO_INCREMENT,
    tipoModalidade varchar(255) NOT NULL,
    
    CONSTRAINT MODALIDADE_PK PRIMARY KEY (idModalidade)
)Engine = InnoDB;

CREATE TABLE ALUNO (
    idAluno INT(5) NOT NULL UNIQUE,
    rg INT(7) NOT NULL UNIQUE,
    nivel enum('iniciante', 'intermediario', 'avancado') NOT NULL,
    idPessoa INTEGER AUTO_INCREMENT,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    nomeCompleto VARCHAR(50) NOT NULL,
    sexo ENUM('F','M'),
    ddiContato INT(2) NOT NULL,
    numeroContato INT(9) NOT NULL,
    dddContato INT(2) NOT NULL,
    email VARCHAR(255) NOT NULL,
    dataNascimento DATE NOT NULL,
    uf VARCHAR(2) NOT NULL,
    complemento VARCHAR(200),
    cidade VARCHAR(50) NOT NULL,
    numero INT(3),
    cep INT(8) NOT NULL,
    rua INT(3) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    idPlanoSaude int(2),
    statusProcesso enum('recusado', 'aprovado', 'processando'),
    carteiraConvenio VARCHAR(255),
    qtSessoes INT(3),
    
    CONSTRAINT ALUNO_PK PRIMARY KEY (idPessoa),
    CONSTRAINT PLANO_SAUDE_FK FOREIGN KEY (idPlanoSaude) REFERENCES PLANO_SAUDE(idPlanoSaude) ON DELETE RESTRICT ON UPDATE RESTRICT
)Engine = InnoDB;

CREATE TABLE PARENTE (
    idParente INTEGER AUTO_INCREMENT,
    nomeParente VARCHAR(50) NOT NULL,
    tipoParentesco VARCHAR(10) NOT NULL,
    ddiContato INT(2) NOT NULL,
    dddContato INT(2) NOT NULL,
    numeroContato INT(9) NOT NULL,
    idPessoa INT(5) NOT NULL,
    
    CONSTRAINT PARENTE_PK PRIMARY KEY (idParente),
    CONSTRAINT ALUNO_PARENTE_FK FOREIGN KEY (idPessoa) REFERENCES ALUNO(idPessoa) ON DELETE RESTRICT ON UPDATE RESTRICT
)Engine = InnoDB;

CREATE TABLE CONTRATO (
    idContrato INTEGER AUTO_INCREMENT,
    mensalidade FLOAT(7,2) NOT NULL,
    dataAssinatura DATE NOT NULL,
    dataFim DATE NOT NULL,
    tipoPlano INT(1) NOT NULL,
--    qtAulas INT(3) NOT NULL,
--    categoria enum('2', '3'),
    idPessoa INT(5),
    
    CONSTRAINT CONTRATO_PK PRIMARY KEY (idContrato),
    CONSTRAINT ALUNO_CONTRATO_FK FOREIGN KEY (idPessoa) REFERENCES ALUNO(idPessoa) ON DELETE RESTRICT ON UPDATE RESTRICT
)Engine = InnoDB;

CREATE TABLE RECEITA (
    idReceita INTEGER AUTO_INCREMENT,
    tipoPagamento ENUM('cheque', 'pix') NOT NULL,
    dataPagamento DATE NOT NULL,
    desconto FLOAT(7,2),
    valorAula FLOAT(7,2) NOT NULL,
    dataVencimento DATE NOT NULL,
    idContrato INT(4) NOT NULL,
    
    CONSTRAINT RECEITA_PK PRIMARY KEY (idReceita),
    CONSTRAINT CONTRATO_RECEITA_FK FOREIGN KEY (idContrato) REFERENCES CONTRATO(idContrato) ON DELETE RESTRICT ON UPDATE RESTRICT
)Engine = InnoDB;

CREATE TABLE LAUDO_MEDICO (
    idLaudo INTEGER AUTO_INCREMENT,
    cidPedido INT(3),
    documento VARCHAR(100),
    idPessoa INT(5),
    
    CONSTRAINT LAUDO_MEDICO_PK PRIMARY KEY (idLaudo),
    CONSTRAINT ALUNO_LAUDO_FK FOREIGN KEY (idPessoa) REFERENCES ALUNO(idPessoa) ON DELETE RESTRICT ON UPDATE RESTRICT
)Engine = InnoDB;

CREATE TABLE FALTA (
    idFalta INTEGER AUTO_INCREMENT,
    atestado VARCHAR(255) NOT NULL,
    reposicao BOOLEAN NOT NULL,
    
    CONSTRAINT FALTA_PK PRIMARY KEY (idFalta)
)Engine = InnoDB;

CREATE TABLE AULA (
    idAula INTEGER AUTO_INCREMENT,
    dataAula DATE NOT NULL,
    idHorario int(4) NOT NULL,
    
	CONSTRAINT AULA_PK PRIMARY KEY (idAula),
	CONSTRAINT HORARIO_AULA_FK FOREIGN KEY (idHorario) REFERENCES HORARIO(idHorario) ON DELETE RESTRICT ON UPDATE RESTRICT
)Engine = InnoDB;

CREATE TABLE AGENDAMENTO_realiza (
    idAula int(9) NOT NULL,
    idPessoa INT(5) NOT NULL,
    
    CONSTRAINT AGENDAMENTO_PK PRIMARY KEY (idAula),
	CONSTRAINT AULA_AGENDAMENTO_FK FOREIGN KEY (idAula) REFERENCES AULA(idAula) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT ALUNO_AGENDAMENTO_FK FOREIGN KEY (idPessoa) REFERENCES ALUNO(idPessoa) ON DELETE RESTRICT ON UPDATE RESTRICT
)Engine = InnoDB;

CREATE TABLE geraFalta (
    idFalta INT(5) NOT NULL,
	idAula int(9) NOT NULL,
    idPessoa INT(5) NOT NULL,
    
    CONSTRAINT GERA_FALTA_PK PRIMARY KEY (idFalta),
    CONSTRAINT FALTA_GF_FK FOREIGN KEY (idFalta) REFERENCES FALTA(idFalta) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT AULA_GF_FK FOREIGN KEY (idAula) REFERENCES AULA(idAula) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT ALUNO_GF_FK FOREIGN KEY (idPessoa) REFERENCES ALUNO(idPessoa) ON DELETE RESTRICT ON UPDATE RESTRICT
)Engine = InnoDB;

CREATE TABLE FUNCIONARIO (
    idFuncionario int(5) NOT NULL UNIQUE,
    funcao VARCHAR(50) NOT NULL,
    pisConfis VARCHAR(11) ,
    banco VARCHAR(30) NOT NULL,
    conta VARCHAR(20) NOT NULL,
    agencia VARCHAR(5) NOT NULL,
    escolaridade VARCHAR(30) NOT NULL,
    idPessoa INTEGER AUTO_INCREMENT,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    nomeCompleto VARCHAR(50) NOT NULL,
    sexo ENUM('F','M'),
    ddiContato INT(2) NOT NULL,
    numeroContato INT(9) NOT NULL,
    dddContato INT(2) NOT NULL,
    email VARCHAR(255) NOT NULL,
    dataNascimento DATE NOT NULL,
    uf VARCHAR(2) NOT NULL,
    complemento VARCHAR(200),
    cidade VARCHAR(50) NOT NULL,
    numero INT(3),
    cep INT(8) NOT NULL,
    rua INT(3) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    
    CONSTRAINT FUNCIONARIO_PK PRIMARY KEY (idPessoa)
)Engine = InnoDB;

CREATE TABLE CERTIDAO_NEGATIVA (
    idCertidao INTEGER AUTO_INCREMENT,
    tipoCertidao VARCHAR(10) NOT NULL,
    dataCertidao DATE NOT NULL,
    numeroSelo INT NOT NULL,
    
    CONSTRAINT CERTIDAO_PK PRIMARY KEY (idCertidao)
)Engine = InnoDB;

CREATE TABLE PROFESSOR (
    idProfessor INTEGER,
    ufRegistro VARCHAR(2) NOT NULL,
    numeroRegistro VARCHAR(6) NOT NULL,
    valorHoraAula float(7,2) NOT NULL,
    tipoProfessor ENUM('estágio', 'efetivo') NOT NULL,
    cursoSuperior VARCHAR(255) NOT NULL,
    idPessoa int(5) not null,
    idFuncionario int(5) not null,
    
    CONSTRAINT PROFESSOR_PK PRIMARY KEY (idPessoa),
    CONSTRAINT PESSOA_FUNCIONARIO_FK FOREIGN KEY (idFuncionario) REFERENCES FUNCIONARIO(idPessoa) ON DELETE RESTRICT ON UPDATE RESTRICT
)Engine = InnoDB;



CREATE TABLE PONTO_ministra (
    idPonto INTEGER AUTO_INCREMENT,
    horarioEntrata TIME NOT NULL,
    horarioSaida TIME NOT NULL,
    atestado VARCHAR(255) NOT NULL,
    justificativa VARCHAR(255) NOT NULL,
    idAula int(9) NOT NULL,
    idProfessor int(5) NOT NULL,
    idPessoa int(5) not null,
    CONSTRAINT PONTO_PK PRIMARY KEY (idPonto),
    CONSTRAINT AULA_PONTO_FK FOREIGN KEY (idAula) REFERENCES AULA(idAula) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT PROFESSOR_PONTO_FK FOREIGN KEY (idPessoa) REFERENCES PROFESSOR(idPessoa) ON DELETE RESTRICT ON UPDATE RESTRICT
)Engine = InnoDB;


CREATE TABLE RELATORIO (
    idRelatorio INTEGER AUTO_INCREMENT,
    observacoes VARCHAR(255) NOT NULL,
    laudoFisioterapeuta VARCHAR(255),
    
    CONSTRAINT RELATORIO_PK PRIMARY KEY (idRelatorio)
)Engine = InnoDB;

CREATE TABLE DESPESA (
    idDespesa INTEGER AUTO_INCREMENT,
    tipoDespesa VARCHAR(255) NOT NULL,
    dataDespesa DATE NOT NULL,
    valorPagamento FLOAT(7,2) NOT NULL,
    
    CONSTRAINT DESPESA_PK PRIMARY KEY (idDespesa)
)Engine = InnoDB;

CREATE TABLE CURSO (
    idCurso INTEGER AUTO_INCREMENT,
    nomeCurso VARCHAR(255) NOT NULL,
    dataConclusao DATE NOT NULL,
    
    CONSTRAINT CURSO_PK PRIMARY KEY (idCurso)
)Engine = InnoDB;

CREATE TABLE possui (
    idPessoa int(5) NOT NULL,
    idCurso INT(5) NOT NULL,
    
    CONSTRAINT FUNCIONARIO_POSSUI_FK FOREIGN KEY (idPessoa) REFERENCES FUNCIONARIO(idPessoa) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT CURSO_POSSUI_FK FOREIGN KEY (idCurso) REFERENCES CURSO(idCurso) ON DELETE RESTRICT ON UPDATE RESTRICT
)Engine = InnoDB;


CREATE TABLE ESPECIALIDADE (
    idEspecialidade INTEGER AUTO_INCREMENT,
    nomeEspecialidade VARCHAR(255) NOT NULL,
    
    CONSTRAINT ESPECIALIDADE_PK PRIMARY KEY (idEspecialidade)
)Engine = InnoDB;

CREATE TABLE contem (
    idModalidade int(5),
    idAula int(9),
    
	CONSTRAINT MODALIDADE_CONTEM_FK FOREIGN KEY (idModalidade) REFERENCES MODALIDADE(idModalidade) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT AULA_CONTEM_FK FOREIGN KEY (idAula) REFERENCES AULA(idAula) ON DELETE RESTRICT ON UPDATE RESTRICT
)Engine = InnoDB;

CREATE TABLE associa (
    idDespesa INT(5) NOT NULL,
    idPessoa int(5) NOT NULL,
    
    CONSTRAINT associa_FK_idDespesa FOREIGN KEY (idDespesa) references DESPESA(idDespesa),
    CONSTRAINT associa_FK_idPessoa FOREIGN KEY (idPessoa) references FUNCIONARIO(idPessoa)
)Engine = InnoDB;

CREATE TABLE gera (
    idAula int(9) NOT NULL,
    idRelatorio INT(5) NOT NULL,
    
	CONSTRAINT AULA_GERA_FK FOREIGN KEY (idAula) REFERENCES AULA(idAula) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT RELATORIO_GERA_FK FOREIGN KEY (idRelatorio) REFERENCES RELATORIO(idRelatorio) ON DELETE RESTRICT ON UPDATE RESTRICT
)Engine = InnoDB;

CREATE TABLE apresenta (
    idPessoa int(5) NOT NULL,
    idCertidao INT(5) NOT NULL,
    
	CONSTRAINT PESSOA_APRESENTA_FK FOREIGN KEY (idPessoa) REFERENCES ALUNO(idPessoa) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT CERTIDAO_APRESENTA_FK FOREIGN KEY (idCertidao) REFERENCES CERTIDAO_NEGATIVA(idCertidao) ON DELETE RESTRICT ON UPDATE RESTRICT
)Engine = InnoDB;

CREATE TABLE cria (
    idDespesa INT(5) NOT NULL,
    idPonto int(5) NOT NULL,
    
	CONSTRAINT PONTO_CRIA_FK_idDespesa FOREIGN KEY (idDespesa) REFERENCES DESPESA(idDespesa) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT PONTO_CRIA_FK_idPonto FOREIGN KEY (idPonto) REFERENCES PONTO_ministra(idPonto) ON DELETE RESTRICT ON UPDATE RESTRICT
)Engine = InnoDB;

CREATE TABLE tem (
    idPessoa int(5) NOT NULL,
    idEspecialidade INT(5) NOT NULL,
    
	CONSTRAINT PROFESSOR_TEM_FK FOREIGN KEY (idPessoa) REFERENCES PROFESSOR(idPessoa) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT ESPECIALIDADE_TEM_FK FOREIGN KEY (idEspecialidade) REFERENCES ESPECIALIDADE(idEspecialidade) ON DELETE RESTRICT ON UPDATE RESTRICT
)Engine = InnoDB;
