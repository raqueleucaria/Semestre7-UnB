-- -----------     << Pilates >>     -------------------
-- 
--                 SCRIPT DE CRIACAO (DDL)
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
CREATE DATABASE
  IF NOT EXISTS tema2Pilates;

USE tema2Pilates;

-- TABELAS
CREATE TABLE PESSOA (
    idPessoa INTEGER NOT NULL AUTO_INCREMENT ,
    cpf BIGINT(11) NOT NULL,
    nomeCompleto VARCHAR(50) NOT NULL,
    dataNascimento DATE NOT NULL,
    sexo ENUM('M', 'F') NOT NULL,
    ddiCelular INT(2) NOT NULL,
    dddCelular INT(2) NOT NULL,
    numeroCelular INT(9) NOT NULL,
    email VARCHAR(40) NOT NULL,
    uf CHAR(2) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    cep INT(8) NOT NULL,
    rua INT(2) NOT NULL,
    numero INT(2) NOT NULL,
    complemento VARCHAR(50),
    
    CONSTRAINT PESSOA_PK PRIMARY KEY (idPessoa)
)Engine = InnoDB;

CREATE TABLE ALUNO (
    idAluno INTEGER NOT NULL AUTO_INCREMENT,
    nivel ENUM('Iniciante', 'Intermediário','Avançado') NOT NULL,
    idPessoa INT(2) NOT NULL,
    
    CONSTRAINT ALUNO_PK PRIMARY KEY (idAluno),
    CONSTRAINT PESSOA_ALUNO_FK FOREIGN KEY (idPessoa) REFERENCES PESSOA(idPessoa) ON DELETE RESTRICT ON UPDATE RESTRICT
)Engine = InnoDB;

CREATE TABLE FUNCIONARIO (
    idFuncionario INTEGER NOT NULL AUTO_INCREMENT,
    funcao ENUM('Professor','Auxiliar') NOT NULL,
    pisConfis BIGINT(11) NOT NULL,
    banco VARCHAR(20) NOT NULL,
    conta INT(6) NOT NULL,
    agencia INT(5) NOT NULL,
    idPessoa INT(2) NOT NULL,
    
	CONSTRAINT FUNCIONARIO_PK PRIMARY KEY (idFuncionario),
    CONSTRAINT PESSOA_FUNCIONARIO_FK FOREIGN KEY (idPessoa) REFERENCES PESSOA(idPessoa) ON DELETE RESTRICT ON UPDATE RESTRICT
)Engine = InnoDB;

CREATE TABLE PROFESSOR (
    idProfessor INTEGER NOT NULL AUTO_INCREMENT,
    tipoProfessor ENUM('Fisioterapeuta','Educador Físico','Estagiário') NOT NULL,
    horaAula DECIMAL(4,2) NOT NULL,
    numeroRegistro INT(4),
    ufRegistro CHAR(2) ,
    cursoSuperior ENUM('Fisioterapia','Educação Física') NOT NULL,
    idPessoa INT(2) NOT NULL,
    
    CONSTRAINT PROFESSOR_PK PRIMARY KEY (idProfessor),
    CONSTRAINT PESSOA_PROFESSOR_FK FOREIGN KEY (idPessoa) REFERENCES PESSOA(idPessoa) ON DELETE RESTRICT ON UPDATE RESTRICT
)Engine = InnoDB;

CREATE TABLE SEGURADORA (
    idSeguradora INTEGER NOT NULL AUTO_INCREMENT,
    cnpj BIGINT(14) NOT NULL,
    nomeSeguradora VARCHAR(11) NOT NULL,
    validade DATE NOT NULL,
    tipoCobertura ENUM('Reembolso','Guias') NOT NULL,
    
    CONSTRAINT SEGURADORA_PK PRIMARY KEY (idSeguradora)
)Engine = InnoDB;

CREATE TABLE PACIENTE (
    idPaciente INTEGER NOT NULL AUTO_INCREMENT,
    rg BIGINT(9) NOT NULL,
    carteirinha BIGINT(11) NOT NULL,
    cidPedido INT(3) NOT NULL,
    observacao VARCHAR(40),
    statusProcesso ENUM('Em análise','Aprovado','Rejeitado') NOT NULL,
    qtSessoes INT(2) NOT NULL,
    idSeguradora INT(2) NOT NULL,
    idPessoa INT(2) NOT NULL,
    
    CONSTRAINT PACIENTE_PK PRIMARY KEY (idPaciente),
    CONSTRAINT PESSOA_PACIENTE_FK FOREIGN KEY (idPessoa) REFERENCES PESSOA(idPessoa) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT SEGURADORA_PACIENTE_PK FOREIGN KEY (idSeguradora) REFERENCES SEGURADORA(idSeguradora) ON DELETE RESTRICT ON UPDATE RESTRICT
)Engine = InnoDB;

CREATE TABLE CURSO (
    idCurso INTEGER NOT NULL AUTO_INCREMENT,
    nomeCurso VARCHAR(20) NOT NULL,
    dataConclusao DATE NOT NULL,
    idFuncionario INT(2) NOT NULL,
    
    CONSTRAINT CURSO_PK PRIMARY KEY (idCurso),
    CONSTRAINT FUNCIONARIO_CURSO_PK FOREIGN KEY (idFuncionario) REFERENCES FUNCIONARIO(idFuncionario) ON DELETE RESTRICT ON UPDATE RESTRICT
)Engine = InnoDB;

CREATE TABLE CERTIDAO_NEGATIVA (
    idCertidao INTEGER NOT NULL AUTO_INCREMENT,
    tipoCertidao ENUM('Criminal','Trabalhista','Civel') NOT NULL,
    numeroSelo VARCHAR(8) NOT NULL,
    dataCertidao DATE NOT NULL,
    idFuncionario INT(2) NOT NULL,
    
    CONSTRAINT CERTIDAO_PK PRIMARY KEY (idCertidao),
    CONSTRAINT FUNCIONARIO_CERTIDAOPK FOREIGN KEY (idFuncionario) REFERENCES FUNCIONARIO(idFuncionario) ON DELETE RESTRICT ON UPDATE RESTRICT
)Engine = InnoDB;

CREATE TABLE HORARIO (
    idHorario INTEGER NOT NULL AUTO_INCREMENT,
    diaSemana ENUM('Seg','Ter','Qua','Qui','Sex', 'Sáb') NOT NULL ,
    turno ENUM('Manhã','Tarde','Noite') NOT NULL ,
    horarioInicio TIME NOT NULL ,
    
    CONSTRAINT HORARIO_PK PRIMARY KEY (idHorario)
)Engine = InnoDB;

CREATE TABLE AULA (
    idAula INTEGER NOT NULL AUTO_INCREMENT,
    dataAula DATE NOT NULL,
    duracao TIME NOT NULL,
    horario INT(2) NOT NULL,
    professor INT(2) NOT NULL,
    professor2 INT(2),
    
    CONSTRAINT AULA_PK PRIMARY KEY (idAula),
    CONSTRAINT PROFESSOR_AULA_PK FOREIGN KEY (professor) REFERENCES PROFESSOR(idProfessor) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT PROFESSOR2_AULA_PK FOREIGN KEY (professor2) REFERENCES PROFESSOR(idProfessor) ON DELETE RESTRICT ON UPDATE RESTRICT,
    CONSTRAINT HORARIO_AULA_PK FOREIGN KEY (horario) REFERENCES HORARIO(idHorario) ON DELETE RESTRICT ON UPDATE RESTRICT
)Engine = InnoDB;

CREATE TABLE PARENTE (
    idParente INTEGER NOT NULL AUTO_INCREMENT,
    nomeParente VARCHAR(11) NOT NULL,
    tipoParentesco VARCHAR(11) NOT NULL,
    ddiContato INT(2) NOT NULL,
    dddContato INT(2) NOT NULL,
    numeroContato INT(9) NOT NULL,
    idPaciente INT(2) NOT NULL,
    
    CONSTRAINT PARENTE_PK PRIMARY KEY (idParente),
    CONSTRAINT PACIENTE_PARENTE_PK FOREIGN KEY (idPaciente) REFERENCES PACIENTE(idPaciente) ON DELETE RESTRICT ON UPDATE RESTRICT
)Engine = InnoDB;

CREATE TABLE gera (
    registroFisioterapeuta INT(4) NOT NULL,
    idAula INT(2) NOT NULL,
    idHistorico INT(2) NOT NULL,
    idProfessor INT(2) NOT NULL,
    
    CONSTRAINT GERA_HISTORICO_PK PRIMARY KEY (idAula, idProfessor, idHistorico)
)Engine = InnoDB;

CREATE TABLE HISTORICO (
    idHistorico INTEGER NOT NULL AUTO_INCREMENT,
    laudo ENUM('N','S'),
    observacoes VARCHAR(100) NOT NULL,
    
    CONSTRAINT HISTORICO_PK PRIMARY KEY (idHistorico)
)Engine = InnoDB;

CREATE TABLE CONTRATO (
    idContrato INTEGER NOT NULL AUTO_INCREMENT,
    tipoPlano ENUM('2x Semana','3x Semana','Reembolso','Guias') NOT NULL,
    dataAssinatura DATE NOT NULL,
    dataFim DATE NOT NULL,
    mensalidade DECIMAL(5,2) NOT NULL,
    qtAulas INT(2) NOT NULL,
    idPessoa INT(2) NOT NULL,
    
    CONSTRAINT 	CONTRATO_PK PRIMARY KEY (idContrato)
)Engine = InnoDB;

CREATE TABLE aluno_aula (
    idAluno INT(2) NOT NULL,
    idAula INT(2) NOT NULL,
    
    CONSTRAINT AULA_ALUNO_PK PRIMARY KEY (idAluno, idAula)
)Engine = InnoDB;

CREATE TABLE TREINO_realiza (
    idAluno INT(2) NOT NULL,
    idAula INT(2) NOT NULL,
    
    CONSTRAINT TREINO_REALIZA_PK PRIMARY KEY (idAluno, idAula)
)Engine = InnoDB;

CREATE TABLE geraFalta (
    idFalta INT(2) NOT NULL,
    idAluno INT(2) NOT NULL,
    idAula INT(2) NOT NULL,
    
    CONSTRAINT GERA_FALTA_PK PRIMARY KEY (idFalta, idAluno, idAula)
)Engine = InnoDB;

CREATE TABLE FALTA (
    idFalta INTEGER NOT NULL AUTO_INCREMENT,
    reposicao ENUM('N','S') NOT NULL,
    atestado ENUM('N','S') NOT NULL,
    
    CONSTRAINT FALTA_ALUNO_PK PRIMARY KEY (idFalta)
)Engine = InnoDB;

CREATE TABLE PONTO_ministra (
    idProfessor INT(2) NOT NULL,
    idAula INT(2) NOT NULL,
    
    CONSTRAINT PONTO_MINISTRA_PK PRIMARY KEY (idProfessor, idAula)
)Engine = InnoDB;

CREATE TABLE compoeFolha (
    idPonto INT(2) NOT NULL,
    idProfessor INT(2) NOT NULL,
    idAula INT(2) NOT NULL,
    
    CONSTRAINT COMPOE_FOLHA_PK PRIMARY KEY (idPonto, idProfessor, idAula)
)Engine = InnoDB;

CREATE TABLE FOLHA_PONTO (
    idPonto INTEGER NOT NULL AUTO_INCREMENT ,
    horarioEntrata TIME,
    horarioSaida TIME,
    atestado ENUM('N','S'),
    justificativa VARCHAR(100),
    
     CONSTRAINT FOLHA_PONTO_PK PRIMARY KEY (idPonto)
)Engine = InnoDB;

CREATE TABLE defineDespesa (
    horaTrabalhada TIME NOT NULL,
    idDespesa INT(2) NOT NULL,
    idPonto INT(2) NOT NULL,
    
    CONSTRAINT DEFINE_DESPESA_PK PRIMARY KEY (idDespesa, idPonto)
)Engine = InnoDB;
 
CREATE TABLE RECEITA (
    idReceita INTEGER NOT NULL AUTO_INCREMENT,
    dataVencimento DATE NOT NULL,
    dataPagamento DATE NOT NULL,
    valorAula DECIMAL(6,2) NOT NULL,
    desconto DECIMAL(4,2),
    tipoPagamento ENUM('Cheque', 'Pix', 'Dinheiro') NOT NULL,
    idContrato INT(2) NOT NULL,
    
    CONSTRAINT RECEITA_PK PRIMARY KEY (idReceita),
	CONSTRAINT CONTRATO_RECEITA_FK FOREIGN KEY (idContrato) REFERENCES CONTRATO(idContrato) ON DELETE RESTRICT ON UPDATE RESTRICT
)Engine = InnoDB;

CREATE TABLE DESPESA (
    idDespesa INTEGER NOT NULL AUTO_INCREMENT,
    tipoDespesa ENUM('Salário','Bonificação','Transporte','Curso','Outro') NOT NULL,
    dataDespesa DATE NOT NULL,
    idFuncionario INT(2) NOT NULL,
    horaTrabalhada TIME,
    
    CONSTRAINT DESPESA_PK PRIMARY KEY (idDespesa),
	CONSTRAINT FUNCIONARIO_DESPESA_PK FOREIGN KEY (idFuncionario) REFERENCES FUNCIONARIO(idFuncionario) ON DELETE RESTRICT ON UPDATE RESTRICT 
)Engine = InnoDB;
