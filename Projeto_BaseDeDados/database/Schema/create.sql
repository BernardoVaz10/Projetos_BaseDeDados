-- CREATE database proj01;


DROP TABLE IF EXISTS utilizador, questao, sessao, resposta, administracao, feedback, tag, categoria, subcategoria, pesquisa;

-- Criação da tabela "Utilizador"
CREATE TABLE Utilizador (
    ID_utilizador INT PRIMARY KEY auto_increment,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(100),
    data_nascimento DATE,
    genero VARCHAR(10),
    password VARCHAR(100),
    nacionalidade VARCHAR(50),
    admin BOOLEAN
);

-- Criação da tabela "Subcategoria"
CREATE TABLE Subcategoria (
    ID_subcategoria INT PRIMARY KEY auto_increment,
    nome_subcategoria VARCHAR(50)
);

-- Criação da tabela "Categoria"
CREATE TABLE Categoria (
    ID_categoria INT PRIMARY KEY auto_increment,
    nome_categoria VARCHAR(50),
    ID_subcategoria INT
);

-- Criação da tabela "Questao"
CREATE TABLE Questao (
    ID_questao INT PRIMARY KEY auto_increment,
    texto_questao TEXT,
    idioma VARCHAR(50),
    data_entrada DATE,
    data_ultima_atualizacao DATE,
    ID_categoria INT,
    ID_utilizador INT
);

-- Criação da tabela "Resposta"
CREATE TABLE Resposta (
    ID_resposta INT PRIMARY KEY auto_increment,
    texto_resposta TEXT,
    data_aprovacao DATE,
    estado VARCHAR(50),
    ID_questao INT,
    ID_utilizador INT
);

-- Criação da tabela "Sessao"
CREATE TABLE Sessao (
    ID_sessao INT PRIMARY KEY auto_increment,
    token_identificador VARCHAR(100),
    data_hora_inicio DATETIME,
    data_hora_fim DATETIME,
    IP VARCHAR(50),
    tipo_dispositivo VARCHAR(50),
    ID_utilizador INT
);

-- Criação da tabela "Administracao"
CREATE TABLE Administracao (
    ID_sessao INT PRIMARY KEY auto_increment,
    admin BOOLEAN,
    ID_utilizador INT
);

-- Criação da tabela "Feedback"
CREATE TABLE Feedback (
    ID_utilizador INT auto_increment,
    ID_sessao INT,
    ID_resposta INT,
    classificacao INT,
    PRIMARY KEY (ID_utilizador, ID_resposta)
);

-- Criação da tabela "Tag"
CREATE TABLE Tag (
    ID_tag INT PRIMARY KEY auto_increment,
    nome VARCHAR(50)
);

-- Criação da tabela "Pesquisa"
CREATE TABLE Pesquisa (
    Tipo_pesquisa VARCHAR(50) PRIMARY KEY,
    ID_questao INT,
    ID_resposta INT,
    ID_categoria INT,
    ID_utilizador INT
);

-- Chaves Estrangeiras
ALTER TABLE Categoria ADD CONSTRAINT categoria_subID
    FOREIGN KEY (ID_subcategoria) REFERENCES Subcategoria(ID_subcategoria)
    ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE Questao ADD CONSTRAINT questao_cat
    FOREIGN KEY (ID_categoria) REFERENCES Categoria(ID_categoria)
    ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE Questao ADD CONSTRAINT questao_utilizadorID
    FOREIGN KEY (ID_utilizador) REFERENCES Utilizador(ID_utilizador)
    ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE Resposta ADD CONSTRAINT resposta_questaoID
    FOREIGN KEY (ID_questao) REFERENCES Questao(ID_questao)
    ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE Resposta ADD CONSTRAINT resposta_utilizadorID
    FOREIGN KEY (ID_utilizador) REFERENCES Utilizador(ID_utilizador)
    ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE Sessao ADD CONSTRAINT sessao_utilizadorID
    FOREIGN KEY (ID_utilizador) REFERENCES Utilizador(ID_utilizador)
    ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE Administracao ADD CONSTRAINT administracao_utilizadorID
    FOREIGN KEY (ID_utilizador) REFERENCES Utilizador(ID_utilizador)
    ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE Administracao ADD CONSTRAINT administracao_sessaoID
    FOREIGN KEY (ID_sessao) REFERENCES Sessao(ID_sessao)
    ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE Feedback ADD CONSTRAINT feedback_utilizadorID
    FOREIGN KEY (ID_utilizador) REFERENCES Utilizador(ID_utilizador)
    ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE Feedback ADD CONSTRAINT feedback_sessaoID
    FOREIGN KEY (ID_sessao) REFERENCES Sessao(ID_sessao)
    ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE Feedback ADD CONSTRAINT feedback_respostaID
    FOREIGN KEY (ID_resposta) REFERENCES Resposta(ID_resposta)
    ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE Pesquisa ADD CONSTRAINT pesquisa_utilizadorID
    FOREIGN KEY (ID_utilizador) REFERENCES Utilizador(ID_utilizador)
    ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE Pesquisa ADD CONSTRAINT pesquisa_questaoID
    FOREIGN KEY (ID_questao) REFERENCES Questao(ID_questao)
    ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE Pesquisa ADD CONSTRAINT pesquisa_respostaID
    FOREIGN KEY (ID_resposta) REFERENCES Resposta(ID_resposta)
    ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE Pesquisa ADD CONSTRAINT pesquisa_categoriaID
    FOREIGN KEY (ID_categoria) REFERENCES Categoria(ID_categoria)
    ON DELETE NO ACTION ON UPDATE NO ACTION;
