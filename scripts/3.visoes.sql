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
AS SELECT 
	av.codAcontecimento	AS codAcontecimento,
	av.tipo				AS tipoAvaliacao,
	av.numero			AS numAvaliacao,
	ac.nome 			AS nomeAvaliacao,
	ac.data 			AS dataAvaliacao,
	ac.horarioInicio 	AS horaIniAvaliacao,
	ac.horarioFim		AS horaFimAvaliacao,
	ac.local			AS localAvaliacao,
	dc.nome 			AS disciplina,
	di.codDiario		AS codDiario,
	ps.cpf				AS cpfProfessor,
	ps.nome 			AS professor

FROM 
	avaliacao av, 
	acontecimento ac,
	diario di,
	disciplina dc,
	professor pr,
	pessoa ps
WHERE 
	av.codAcontecimento = ac.codAcontecimento AND 
	av.codDiario = di.codDiario AND 
	di.codDisciplina = dc.codDisciplina AND
	di.matProf = pr.matricula AND
	ps.cpf = pr.cpf; 


/*Visao do diário*/
CREATE VIEW VisaoDiario
AS SELECT d.codDiario, d.atualizado, p.matricula, p.nome AS Professor, t.serie, t.sala, dc.codDisciplina, dc.nome As Disciplina, dc.cargaHoraria
FROM diario d, disciplina dc, turma t, visaoProfessorPessoa p
WHERE d.codDisciplina = dc.codDisciplina AND t.codTurma = d.codTurma AND p.matricula=d.matProf