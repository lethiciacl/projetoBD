/*Visão da jução natura entre professor e pessoa*/
CREATE VIEW VisaoProfesorPessoa 
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