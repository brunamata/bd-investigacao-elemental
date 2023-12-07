create table universidade(
	nome_completo varchar(128) not null,
	sigla varchar(8),
	constraint pk_universidade primary key(nome_completo)
);

create table funcionario(
	cpf varchar(11) not null,
	cargo varchar(30) not null,
	nome varchar(255),
	endereco varchar(255),
	telefone varchar(20),
	tipo_sanguineo varchar(3),
	constraint pk_funcionario primary key(cpf),
	constraint ck_cargo check( upper(cargo) in ('ASTRONAUTA', 'COORDENADOR', 'CIENTISTA', 'SUPERVISOR'))
);

create table formacao(
	universidade varchar(128) not null,
	funcionario varchar(11) not null,
	data_formacao date not null,
	grau varchar(30) not null,
	curso varchar(60) not null,
	constraint pk_formacao primary key(universidade, funcionario, data_formacao),
	constraint fk_universidade foreign key(universidade) references universidade(nome_completo),
	constraint fk_funcionario foreign key(funcionario) references funcionario(cpf)
);

create table coordenador(
	cpf varchar(11) not null,
	constraint pk_coordenador primary key(cpf),
	constraint fk_coordenador foreign key(cpf) references funcionario(cpf) on delete cascade
);

create table ferramentas(
	coordenador varchar(11) not null,
	ferramenta varchar(30) not null,
	constraint pk_ferramentas primary key(coordenador, ferramenta),
	constraint fk_ferramentas foreign key(coordenador) references coordenador(cpf) on delete cascade
);

CREATE TABLE NAVE (
	NUMERO_CHASSI VARCHAR(15) PRIMARY KEY,
	CAPACIDADE_COMBUSTIVEL INT DEFAULT 100
);


CREATE TABLE COMPONENTES (
NAVE VARCHAR(15),
	COMPONENTE VARCHAR(50),

    CONSTRAINT PK_COMP PRIMARY KEY (NAVE, COMPONENTE),
	CONSTRAINT FK_COMP FOREIGN KEY (NAVE) REFERENCES NAVE(NUMERO_CHASSI) ON DELETE CASCADE
);

create table astronauta(
	cpf varchar(11) not null,
	numero_habilitacao varchar(9),
	nave varchar(15),
	constraint pk_astronauta primary key(cpf),
	constraint fk_astronauta foreign key(cpf) references funcionario(cpf) on delete cascade,
	constraint fk_nave foreign key(nave) references nave(numero_chassi) on delete set null 
);

CREATE TABLE SISTEMA_PLANETARIO (
ESTRELA_PRINCIPAL VARCHAR(30) PRIMARY KEY,
DISTANCIA DECIMAL(15, 5)
);

CREATE TABLE PLANETA (
	COORDENADA VARCHAR(50) PRIMARY KEY,
	NOME VARCHAR(30) NOT NULL,
	TIPO VARCHAR(10) NOT NULL,
	SISTEMA VARCHAR(30) NOT NULL,
	NUMERO_LUAS INT DEFAULT 0,
	CHECK (UPPER(TIPO) IN ('GASOSO', 'SOLIDO', 'LIQUIDO', 'MISTO')),
	FOREIGN KEY (SISTEMA) REFERENCES SISTEMA_PLANETARIO(ESTRELA_PRINCIPAL)
);

CREATE TABLE LUA (
	
	COORDENADA VARCHAR(50),
	NOME VARCHAR(30),
    
	PRIMARY KEY (COORDENADA, NOME),
	FOREIGN KEY (COORDENADA) REFERENCES PLANETA ON DELETE CASCADE
);

CREATE TABLE ESTAÇÃO_ESPACIAL (
	PLANETA VARCHAR(50) ,
	NUMERO INT ,
	NOME_ESTAÇÃO VARCHAR(30),
	
	CONSTRAINT PK_PLANETA PRIMARY KEY (PLANETA, NUMERO),
	FOREIGN KEY (PLANETA) REFERENCES PLANETA 
);

CREATE TABLE VIAGEM (
    DATA_PARTIDA DATE NOT NULL,
    PLANETA_DESTINO VARCHAR(50) NOT NULL,
    ESTAÇÃO_VIAGEM INT NOT NULL,
    NAVE VARCHAR(30) NOT NULL,
	COORDENADOR VARCHAR(50) NOT NULL,

CONSTRAINT PK_VIAGEM PRIMARY KEY (DATA_PARTIDA, PLANETA_DESTINO, ESTAÇÃO_VIAGEM),  
CONSTRAINT FK_VIAGEM FOREIGN KEY (PLANETA_DESTINO, ESTAÇÃO_VIAGEM) REFERENCES ESTAÇÃO_ESPACIAL(PLANETA, NUMERO),
CONSTRAINT FK_COORD FOREIGN KEY (COORDENADOR) REFERENCES COORDENADOR(CPF), 
CONSTRAINT FK_NAVE FOREIGN KEY (NAVE) REFERENCES NAVE(NUMERO_CHASSI)
);

CREATE TABLE ENGENHEIRO (
   num_registro char(3) not null,
   especializacao varchar(30) not null,
   CONSTRAINT PK_ENGENHEIRO PRIMARY KEY (num_registro)
);

CREATE TABLE EQUIPAMENTO_EXPLORACAO(
   num_patrimonio char(3) not null,
   nome varchar(50) not null,
   data_fabricacao date,
   funcao varchar(100) not null,
   CONSTRAINT PK_EQUIPAMENTOEXPLORACAO PRIMARY KEY (num_patrimonio)
);

CREATE TABLE MANUTENCAO_EQUIPAMENTO(
   engenheiro char(3) not null,
   equipamento char(3) not null,
   CONSTRAINT PK_MANUTENCAOEQUIPAMENTO PRIMARY KEY (engenheiro, equipamento),
   CONSTRAINT FK_MANUTENCAOEQUIP_ENGENHEIRO FOREIGN KEY (engenheiro) REFERENCES ENGENHEIRO(num_registro),
   CONSTRAINT FK_MANUTENCAOEQUIP_EQUIPAMENTO FOREIGN KEY (equipamento) REFERENCES EQUIPAMENTO_EXPLORACAO(num_patrimonio)
);

CREATE TABLE AMOSTRA (
   num_amostra char(3) not null,
   planeta varchar(50) not null,
   coord_geografica varchar(10) unique not null,
   descricao varchar(100),
   CONSTRAINT PK_AMOSTRA PRIMARY KEY (num_amostra, planeta),
   CONSTRAINT FK_AMOSTRA_PLANETA FOREIGN KEY (planeta) REFERENCES PLANETA(coordenada)
);

CREATE TABLE EXPLORACAO_AMOSTRA (
   amostra char(3) not null,
   planeta  VARCHAR(50) not null,
   equipamento char(3) not null,
   CONSTRAINT PK_EXPLORACAOAMOSTRA PRIMARY KEY (amostra, planeta, equipamento),
   CONSTRAINT FK_EXPLORACAOAMOSTRA_AMOSTRA FOREIGN KEY (amostra, planeta) REFERENCES AMOSTRA(num_amostra, planeta),
   CONSTRAINT FK_EXPLORACAOAMOSTRA_EQUIPAMENTO FOREIGN KEY (equipamento) REFERENCES EQUIPAMENTO_EXPLORACAO(num_patrimonio)
);

CREATE TABLE INSTRUMENTO_PESQUISA(
	num_patrimonio  int          not null,
	finalidade      varchar(50)  not null,
	nome            varchar(30)  not null,

constraint      pk_intrumento_de_pesquisa primary key(num_patrimonio)
);

CREATE TABLE CIENTISTA(
	cpf     varchar(11)  not null,
	atuacao varchar(50)  not null,
	
	constraint pk_cientista primary key(cpf),
	constraint fk_cientista_funcionario foreign key(cpf) references FUNCIONARIO(cpf) on delete cascade
);

CREATE TABLE SUPERVISOR(
	cpf              varchar(11) not null,
	anos_experiencia int         not null,
	
	constraint pk_supervisor primary key(cpf),
	constraint fk_supervisor_funcionario foreign key(cpf) references FUNCIONARIO(cpf) on delete cascade
);

CREATE TABLE ELEMENTO_QUIMICO(
	num_atomico     int         not null,
	estado          varchar(10) not null,
	radioatividade  varchar(20)         ,
	nome            varchar(20) unique  ,
	classificacao   varchar(10)         ,

	
	constraint pk_elemento_quimico primary key(num_atomico),
	constraint ck_estado check(upper(estado) in ('SOLIDO', 'GASOSO', 'LIQUIDO')),
	constraint ck_classificacao check(upper(classificacao) in ('METAL', 'SEMIMETAL', 'AMETAL'))
);	

CREATE TABLE PESQUISA(
	codigo           varchar(11) not null,
	area             varchar(20) not null,
	amostra          char(3)     not null,
	planeta_amostra  varchar(50) not null,
	cientista        varchar(11) not null,
	supervisor       varchar(11) not null,

	constraint pk_pesquisa primary key(codigo),
	constraint fk_pesquisa_amostra foreign key(amostra, planeta_amostra) references AMOSTRA(num_amostra, planeta),
	constraint fk_pesquisa_supervisor foreign key(supervisor) references SUPERVISOR(cpf),
	constraint fk_pesquisa_cientista foreign key(cientista) references CIENTISTA(cpf)
);

CREATE TABLE UTILIZADOS(
	instrumento_de_pesquisa int         not null,
	pesquisa               varchar(11) not null,
	
	constraint pk_utilizados primary key(instrumento_de_pesquisa, pesquisa),
	constraint fk_utilizado_instrumento foreign key(instrumento_de_pesquisa) references INSTRUMENTO_PESQUISA(num_patrimonio),
	constraint fk_utilizado_pesquisa foreign key(pesquisa) references PESQUISA(codigo)
);

CREATE TABLE DESCOBERTA(
	pesquisa         varchar(11) not null,
	elemento_quimico int not null,
	
	constraint pk_descoberta primary key(pesquisa, elemento_quimico),
	constraint fk_descoberta_pesquisa foreign key(pesquisa) references pesquisa(codigo),
	constraint fk_descoberta_elemento_quimico foreign key(elemento_quimico) references ELEMENTO_QUIMICO(num_atomico)
);





