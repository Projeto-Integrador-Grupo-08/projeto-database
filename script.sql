CREATE DATABASE feedback;

USE feedback;

CREATE TABLE pessoas (
	id int primary key auto_increment,
    nome varchar(45) not null,
    sobrenome varchar(45) not null,
    cpf varchar(11) not null,
    data_nascimento DATE not null,
    telefone varchar(18) not null,
    login varchar(45) not null,
    email varchar(45) not null,
    senha varchar(20) not null,
    id_endereco int not null
);

ALTER TABLE pessoas ADD CONSTRAINT fk_pessoas_endereco
FOREIGN KEY (id_endereco) REFERENCES endereco (id);

CREATE TABLE empresas (
	id int primary key auto_increment,
    razao_social varchar(80) not null,
    nome_fantasia varchar(80) not null,
    cnpj varchar(14) not null,
    atividade varchar(45) not null,
    email varchar(45) not null,
    telefone varchar(18) not null,
    login varchar(45) not null,
    senha varchar(20) not null,
    logo varchar(400) not null,
    id_endereco int not null
);

ALTER TABLE empresas ADD CONSTRAINT fk_empresas_endereco
FOREIGN KEY (id_endereco) REFERENCES endereco (id);


CREATE TABLE endereco (
	id int primary key auto_increment,
    tipo varchar(30) not null,
    logradouro varchar(120) not null,
    numero int not null,
    cep varchar(8) not null,
    cidade varchar(45) not null,
    estado varchar(2) not null
);

CREATE TABLE enquete (
	id int primary key auto_increment,
    numero int not null,
    descricao varchar(120) not null,
    id_empresa int not null
);

ALTER TABLE enquete ADD CONSTRAINT fk_enquete_empresa
FOREIGN KEY (id_empresa) REFERENCES empresas (id);

CREATE TABLE perguntas (
	id int primary key auto_increment,
    numero int not null,
    descricao varchar(120) not null,
    id_enquete int not null
);

ALTER TABLE pergunta ADD CONSTRAINT fk_pergunta_enquete
FOREIGN KEY (id_enquete) REFERENCES enquete (id);

CREATE TABLE respostas (
	id int primary key auto_increment,
    numero int not null,
    descricao varchar(120) not null,
    id_pergunta int not null
);

ALTER TABLE respostas ADD CONSTRAINT fk_resposta_pergunta
FOREIGN KEY (id_pergunta) REFERENCES perguntas (id);

CREATE TABLE resultados (
	id int primary key AUTO_INCREMENT,
    id_resposta int not null,
    id_pessoa int not null
);

ALTER TABLE resultados ADD CONSTRAINT fk_resultado_resposta
FOREIGN KEY (id_resposta) REFERENCES respostas (id);

ALTER TABLE resultados ADD CONSTRAINT fk_resultado_pessoa
FOREIGN KEY (id_pessoa) REFERENCES pessoas (id);

    


    
