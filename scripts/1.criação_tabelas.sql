CREATE TABLE pessoa(
	nome VARCHAR (100) NOT NULL,
	cpf VARCHAR (20),
	senha VARCHAR (32) NOT NULL,
	identidade VARCHAR (32) NOT NULL,
	dataNascimento DATE NOT NULL,
	sexo VARCHAR (10) NOT NULL,
	endereco VARCHAR (100) NOT NULL,
	CONSTRAINT pessoa_pk PRIMARY KEY (cpf)
);

CREATE TABLE responsavel(
	cpf VARCHAR (20),
	enderecoTrabalho VARCHAR (100),
	CONSTRAINT responsavel_pk PRIMARY KEY(cpf),
	CONSTRAINT responsavel_fk FOREIGN KEY (cpf)	REFERENCES pessoa(cpf)
);

CREATE TABLE aluno(
	cpf VARCHAR (20),
	matricula VARCHAR (32) UNIQUE NOT NULL,
	RE REAL,
	nomeMae VARCHAR (100), 
	nomePai VARCHAR (100),
	CONSTRAINT re_positivo CHECK(RE>=0),
	CONSTRAINT aluno_pk PRIMARY KEY (cpf),
	CONSTRAINT aluno_fk FOREIGN KEY (cpf) REFERENCES pessoa(cpf)
);

CREATE TABLE administrador(
	cpf VARCHAR (20),
 	cargo CHAR(100) NOT NULL,
 	setor VARCHAR(100) NOT NULL,
 	CONSTRAINT adm_pk PRIMARY KEY(cpf),
 	CONSTRAINT amd_fk FOREIGN KEY(cpf) REFERENCES pessoa(cpf)
);

CREATE TABLE professor(
	cpf VARCHAR (20),
	matricula VARCHAR (32) NOT NULL UNIQUE,
	titulacao VARCHAR (100) NOT NULL,
	CONSTRAINT prof_pk PRIMARY KEY (cpf),
 	CONSTRAINT prof_fk FOREIGN KEY (cpf) REFERENCES pessoa(cpf)
);

CREATE TABLE trimestre(
 	ano INT, 
 	numero INT,
 	dataInicio DATE NOT NULL, 
 	dataFim DATE NOT NULL, 
 	CONSTRAINT trimestre_pk PRIMARY KEY(ano, numero),
 	CONSTRAINT ano_positivo CHECK (ano>0),
 	CONSTRAINT trimestre_num CHECK(numero>=1 AND numero<=3) 
	);

CREATE TABLE turma(
 	codTurma VARCHAR(32),
 	serie VARCHAR(32) NOT NULL, 
 	sala VARCHAR(32) NOT NULL, 
 	CONSTRAINT turma_pk PRIMARY KEY(codTurma)
	);

CREATE TABLE acontecimento(
	codAcontecimento VARCHAR(32),
	nome VARCHAR(100) NOT NULL,
 	data DATE NOT NULL,
 	horarioInicio TIME NOT NULL,
 	horarioFim TIME NOT NULL, 
 	local VARCHAR(100),
 	CONSTRAINT acont_pk PRIMARY KEY (codAcontecimento)
);

CREATE TABLE disciplina(
	nome VARCHAR(100) NOT NULL,
	cargaHoraria INT NOT NULL DEFAULT 0, 
	codDisciplina VARCHAR(32), 
	CONSTRAINT codDisciplina_pK PRIMARY KEY(codDisciplina)
 );

CREATE TABLE diario(
	codDiario VARCHAR(32), 
	atualizado BOOLEAN NOT NULL DEFAULT TRUE,
	matProf VARCHAR(32) NOT NULL,
	codTurma VARCHAR(32) NOT NULL, 
	codDisciplina VARCHAR(32) NOT NULL, 
	CONSTRAINT diario_pk PRIMARY KEY(codDiario),
 	CONSTRAINT matProf_fk FOREIGN KEY(matProf) REFERENCES Professor(matricula), 
	CONSTRAINT codTurma_fk FOREIGN KEY(codTurma) REFERENCES turma(codTurma),
	CONSTRAINT codDisciplina_fk FOREIGN KEY (codDisciplina) REFERENCES disciplina(codDisciplina) 
);

CREATE TABLE evento(
	codAcontecimento VARCHAR(32),
 	coordenador VARCHAR(100) NOT NULL,
	descricao VARCHAR(100) NOT NULL, 
 	cpfAdm VARCHAR(20) NOT NULL, 
 	CONSTRAINT evento_pk PRIMARY KEY (codAcontecimento),
 	CONSTRAINT cpfAdm_fk FOREIGN KEY (cpfAdm) REFERENCES administrador(cpf) 
);

CREATE TABLE mensagem(
 	cpf VARCHAR(20), 
 	codMensagem VARCHAR(32),
 	texto VARCHAR(100) NOT NULL, 
 	CONSTRAINT mensagem_pk PRIMARY KEY(codMensagem),
 	CONSTRAINT cpf_fk FOREIGN KEY(cpf) REFERENCES pessoa(cpf)
	);

CREATE TABLE avaliacao(
 	codDiario VARCHAR(32) NOT NULL, 
 	numero INT NOT NULL, 
 	tipo VARCHAR(32) NOT NULL,
 	codAcontecimento VARCHAR(32) NOT NULL, 
 	CONSTRAINT codDiario_pk PRIMARY KEY(codAcontecimento), 
 	CONSTRAINT codDiario_fk FOREIGN KEY(codDiario) REFERENCES diario(codDiario) 
	);

CREATE TABLE responsabiliza(
	codResponsavel VARCHAR(32),
	cpfAluno VARCHAR(20),
	parentesco VARCHAR(32) NOT NULL, 
	CONSTRAINT responsabiliza_pk PRIMARY KEY(codResponsavel, cpfAluno),
	CONSTRAINT codResponsavel_fk FOREIGN KEY(codResponsavel) REFERENCES responsavel(cpf),
	CONSTRAINT cpfAluno_fk FOREIGN KEY(cpfAluno) REFERENCES aluno(cpf)
 	);

CREATE TABLE matricula(
 	cpfAluno VARCHAR(20), 
 	codDiario VARCHAR(32),
 	frequencia REAL NOT NULL, 
 	CONSTRAINT matricula_pk PRIMARY KEY(cpfAluno, codDiario),
	CONSTRAINT cpfAluno_fk FOREIGN KEY(cpfAluno) REFERENCES Aluno(cpf),
	CONSTRAINT codDiario_pk FOREIGN KEY(codDiario) REFERENCES diario(codDiario),
	CONSTRAINT freq_positiva CHECK(frequencia>=0)
 	);

CREATE TABLE resultadoavaliacao(
	cpfAluno VARCHAR(20),
	codAcontecimento VARCHAR(32),
	nota REAL NOT NULL,
	CONSTRAINT resultadoAvaliacao_pk PRIMARY KEY(cpfAluno, codAcontecimento),
	CONSTRAINT cpfAluno_fk FOREIGN KEY(cpfAluno) REFERENCES aluno(cpf),
	CONSTRAINT codAcontecimento_fk FOREIGN KEY (codAcontecimento) REFERENCES acontecimento(codAcontecimento), 
	CONSTRAINT nota_positiva CHECK(nota>=0)
);

CREATE TABLE respondemensagem(
	codMensagem VARCHAR(32),
	codResposta VARCHAR(32),
	CONSTRAINT respondemensagem_pk PRIMARY KEY(codMensagem, codResposta),
	CONSTRAINT codMensagem_pk FOREIGN KEY (codMensagem) REFERENCES 	mensagem(codMensagem),
	CONSTRAINT codResposta_pk FOREIGN KEY (codMensagem) REFERENCES 	mensagem(codMensagem)
);

CREATE TABLE organizatrimestre(
	ano INT,
	numero INT,
	codTurma VARCHAR(32), 
	CONSTRAINT organizatrimestre_pk
	PRIMARY KEY(ano, numero, codTurma),
	CONSTRAINT trimestre_fk FOREIGN KEY (ano, numero)
	REFERENCES trimestre(ano, numero),
	CONSTRAINT codTurma_pk FOREIGN KEY (codTurma) REFERENCES turma(codTurma)
	);

CREATE TABLE compartilhamensagem(
	cpfEnvia VARCHAR(20),
	cpfRecebe VARCHAR(20),
	codMensagem VARCHAR(32) NOT NULL,
 	visibilidade BOOLEAN NOT NULL,  
	dataHoraEnvio TIMESTAMP NOT NULL, 
	dataHoraVisualizacao TIMESTAMP,
	CONSTRAINT compartilharmsg_pk PRIMARY KEY (cpfEnvia, cpfRecebe, 	codMensagem),
	CONSTRAINT cpfEnvia_fk FOREIGN KEY(cpfEnvia) REFERENCES pessoa(cpf),
	CONSTRAINT cpfRecebe_fk	FOREIGN KEY(cpfRecebe) REFERENCES pessoa(cpf),
 	CONSTRAINT codMensagem_fk FOREIGN KEY(codMensagem) REFERENCES 	mensagem(codMensagem)
 );

CREATE TABLE conteudoavaliacao(
	codAcontecimento VARCHAR(32),
	conteudo VARCHAR(100),
 	CONSTRAINT conteudoavaliacao_pk PRIMARY KEY(codAcontecimento, conteudo),			
 	CONSTRAINT codAcontecimento_fk FOREIGN KEY(codAcontecimento) REFERENCES 	acontecimento(codAcontecimento)
  );

CREATE TABLE emailpessoa(
 	cpf VARCHAR(20), 
 	email VARCHAR(100),
 	CONSTRAINT emailpessoa_pk
 	PRIMARY KEY(cpf, email),
 	CONSTRAINT cpf_fk FOREIGN KEY(cpf) REFERENCES pessoa(cpf)	
);

CREATE TABLE telefonepessoa(
	cpf VARCHAR(20),
	telefone VARCHAR(32),
	CONSTRAINT telefonepessoa_pk
 	PRIMARY KEY(cpf, telefone),
 	CONSTRAINT cpf_fk FOREIGN KEY(cpf) REFERENCES pessoa(cpf)
);

CREATE TABLE telefoneresponsavel(
	cpf VARCHAR(20),
	telefone VARCHAR(32),
	CONSTRAINT telefoneresponsavel_pk
 	PRIMARY KEY(cpf, telefone),
 	CONSTRAINT cpf_fk FOREIGN KEY(cpf)
	REFERENCES responsavel(cpf)
);

