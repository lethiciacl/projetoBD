/*CRIANDO INDICES*/
CREATE INDEX codacontindice ON acontecimento(codacontecimento);
CREATE INDEX cpfindice ON administrador(cpf);
CREATE INDEX cpfalunoindice ON aluno(cpf);
CREATE INDEX codavaliaindice ON avaliacao(coddiario);
CREATE INDEX numeroindice ON avaliacao(numero);
CREATE INDEX codmensagemindice ON compartilhamensagem(codmensagem);
CREATE INDEX codacontavalindice ON conteudoavaliacao(codacontecimento);
CREATE INDEX coddiarioindice ON diario(coddiario);
CREATE INDEX coddiscindice ON disciplina(coddisciplina);
CREATE INDEX emailpessindice ON emailpessoa(cpf);
CREATE INDEX eventoindice ON evento(codacontecimento);
CREATE INDEX matriculaindice ON matricula(cpfaluno);
CREATE INDEX mensagemindice ON mensagem(cpf);
CREATE INDEX organtrimanoindice ON organizatrimestre(ano);
CREATE INDEX organtrimnumeroindice ON organizatrimestre(numero);
CREATE INDEX pessoaindice ON pessoa(cpf);
CREATE INDEX profindice ON professor(cpf);
CREATE INDEX respmensindice ON respondemensagem(codmensagem);
CREATE INDEX responsabilizaindice ON responsabiliza(codresponsavel);
CREATE INDEX responsavelindice ON responsavel(cpf);
CREATE INDEX resultavalindice ON resultadoavaliacao(codacontecimento);
CREATE INDEX telpesscpfindice ON telefonepessoa(cpf);
CREATE INDEX telpesstelindice ON telefonepessoa(telefone);
CREATE INDEX trimestreanoindice ON trimestre(ano);
CREATE INDEX trimestrenumindice ON trimestre(numero);
CREATE INDEX turmaindice ON turma(codturma);