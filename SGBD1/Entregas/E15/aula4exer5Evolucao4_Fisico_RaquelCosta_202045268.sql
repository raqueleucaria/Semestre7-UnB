/* aula4exer5Evolucao4_Logico_RaquelCosta_202045268: */

CREATE TABLE MEDICO (
    numero inteiro(2),
    unidadeFederativa literal(2),
    nomeCompletoMedico literal(100),
    PRIMARY KEY (numero, unidadeFederativa)
);

CREATE TABLE CONSULTA_atende (
    idConsulta inteiro PRIMARY KEY,
    dataConsulta data,
    nomeCompletoPaciente literal,
    fk_PACIENTE_cpf inteito(11),
    fk_MEDICO_numero inteiro(6),
    fk_MEDICO_unidadeFederativa literal(2)
);

CREATE TABLE PACIENTE (
    cpf inteito(11) PRIMARY KEY,
    nomeCompletoPaciente literal(100),
    dataNascimento data,
    sexo literal(1),
    estado literal(2),
    complemento literal(200),
    numero inteiro(5),
    cidade literal(3),
    bairro literal(20),
    cep inteiro(8)
);

CREATE TABLE RECEITA (
    dataEmissao data,
    FK_CONSULTA_atende_idConsulta inteiro
);

CREATE TABLE MEDICAMENTO (
    nome literal,
    principioAtivo literal,
    PRIMARY KEY (nome, principioAtivo)
);

CREATE TABLE ESPECIALIZACAO (
    especialidade literal(50) PRIMARY KEY
);

CREATE TABLE telefone (
    telefone inteiro,
    fk_PACIENTE_cpf inteiro
);

CREATE TABLE tem (
    fk_ESPECIALIZACAO_especialidade literal(50),
    fk_MEDICO_numero inteiro(6),
    fk_MEDICO_unidadeFederativa literal(2)
);

CREATE TABLE possui (
    fk_MEDICAMENTO_nome literal,
    fk_MEDICAMENTO_principioAtivo literal
);
 
ALTER TABLE MEDICO ADD CONSTRAINT FK_MEDICO_1
    FOREIGN KEY (FK_crm_crm_PK???)
    REFERENCES ??? (???)
    ON DELETE SET NULL;
 
ALTER TABLE CONSULTA_atende ADD CONSTRAINT FK_CONSULTA_atende_2
    FOREIGN KEY (fk_PACIENTE_cpf, fk_MEDICO_numero???, fk_MEDICO_unidadeFederativa???)
    REFERENCES PACIENTE (cpf, ???, ???);
 
ALTER TABLE PACIENTE ADD CONSTRAINT FK_PACIENTE_2
    FOREIGN KEY (FK_telefone_telefone_PK???)
    REFERENCES ??? (???)
    ON DELETE NO ACTION;
 
ALTER TABLE RECEITA ADD CONSTRAINT FK_RECEITA_1
    FOREIGN KEY (FK_CONSULTA_atende_idConsulta)
    REFERENCES CONSULTA_atende (idConsulta)
    ON DELETE CASCADE;
 
ALTER TABLE telefone ADD CONSTRAINT FK_telefone_1
    FOREIGN KEY (fk_PACIENTE_cpf???)
    REFERENCES ??? (???);
 
ALTER TABLE tem ADD CONSTRAINT FK_tem_1
    FOREIGN KEY (fk_ESPECIALIZACAO_especialidade)
    REFERENCES ESPECIALIZACAO (especialidade)
    ON DELETE RESTRICT;
 
ALTER TABLE tem ADD CONSTRAINT FK_tem_2
    FOREIGN KEY (fk_MEDICO_unidadeFederativa???, fk_MEDICO_numero???)
    REFERENCES ??? (???);
 
ALTER TABLE possui ADD CONSTRAINT FK_possui_1
    FOREIGN KEY (fk_MEDICAMENTO_nome, fk_MEDICAMENTO_principioAtivo)
    REFERENCES MEDICAMENTO (nome, principioAtivo)
    ON DELETE SET NULL;