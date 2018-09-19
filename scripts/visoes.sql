/*Visão da jução natura entre professor e pessoa*/
CREATE VIEW VisaoProfessorPessoa 
AS SELECT *
FROM professor NATURAL LEFT JOIN pessoa;

/*Visão da jução natura entre aluno e pessoa*/
CREATE VIEW VisaoAlunoPessoa 
AS SELECT *
FROM aluno NATURAL LEFT JOIN pessoa;

/*Visão da jução natura entre administrador e pessoa*/
CREATE VIEW VisaoAdministradoPessoa 
AS SELECT *
FROM administrador NATURAL LEFT JOIN pessoa;

/*Visão da jução natura entre responsavel e pessoa*/
CREATE VIEW VisaoResponsavelPessoa 
AS SELECT *
FROM responsavel NATURAL LEFT JOIN pessoa;

/*Visão de junção natural entre evento e acontecimento*/
CREATE VIEW VisaoEvento
AS SELECT *
FROM evento NATURAL LEFT JOIN acontecimento;

/*Visão de junção natural entre avaliacao e acontecimeno*/
CREATE VIEW VisaoAvaliacao
AS SELECT *
FROM avaliacao NATURAL LEFT JOIN acontecimento;