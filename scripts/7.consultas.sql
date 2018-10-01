/*Listar professores com suas respectivas disciplinas e carga horária*/
SELECT p.nome as Professor, dp.nome as Disciplina, dp.cargaHoraria 
FROM pessoa p ,professor pf, diario d, disciplina dp
WHERE (p.cpf=pf.cpf) and (d.matProf = pf.matricula) and (dp.codDisciplina = d.codDisciplina);

/*Lista os telefone do responsável pela aluna Estella Costa*/
SELECT telefone 
FROM visaoalunopessoa a, responsabiliza r, telefoneresponsavel tr
WHERE nome='Estella Costa' and r.cpfaluno = a.cpf and tr.cpf=r.codResponsavel;

/*Listar mensagens que não foram visualizadas e seus destinatários*/
SELECT p.nome AS Destinatario, m.texto as Mensagem 
FROM mensagem m, compartilhamensagem c, pessoa p
WHERE c.codMensagem = m.codMensagem AND c.cpfRecebe = p.cpf and dataHoraVisualizacao is null;

/*Listar as mensagens destinadas a Joaquim Assis*/
SELECT dataHoraEnvio AS Data, m.texto AS Mensagem, pe.nome AS Remetente,
CASE
	WHEN (cm.dataHoraVisualizacao IS NOT NULL) THEN 'Visualizada'
	WHEN (cm.dataHoraVisualizacao IS NULL) THEN 'Não Visualizada'
END AS Situacao
FROM mensagem m, compartilhamensagem cm, pessoa pr, pessoa pe
WHERE m.codMensagem = cm.codMensagem AND cm.cpfRecebe = pr.cpf AND cm.cpfEnvia = pe.cpf 
AND pr.nome ='Joaquim Assis'
ORDER BY cm.dataHoraEnvio DESC;

/*Listar mensagens destinadas a Carlos que já foram visualizadas.*/
SELECT m.texto AS Mensagem
FROM pessoa p, mensagem m, compartilhamensagem c
WHERE p.nome='Carlos' AND p.cpf=c.cpfRecebe AND c.codMensagem=m.codMensagem AND c.dataHoraVisualizacao IS NOT NULL;

/*Listar mensagens com seus respectivos remetente e destinatário que contenham a palavra "Amor"*/
SELECT r.nome AS Remetente, d.nome AS Destinatario, m.texto AS Mensagem
FROM mensagem m, compartilhamensagem c, pessoa d, pessoa r
WHERE m.texto LIKE '%Amor%' AND m.codMensagem = c.codMensagem AND d.cpf=c.cpfRecebe AND r.cpf=c.cpfEnvia;

/*Listar professores que residem na cidade de Sousa*/
SELECT nome AS Professor
FROM visaoprofessorpessoa
WHERE endereco LIKE '%Sousa%';

/*Listar alunos ordenando de acordo com seu respectivo rendimento escolar*/
SELECT nome AS Aluno, re AS RendimentoEscolar
FROM visaoalunopessoa
ORDER BY re DESC;

/*Listagem de alunos em ordem alfabética*/
SELECT nome AS Alunos
FROM VisaoAlunoPessoa
ORDER BY nome;

/*Listar alunos matriculados na disciplina Protuguês*/
SELECT a.matricula, a.nome AS Aluno
FROM visaoAlunoPessoa a JOIN matricula m ON (a.cpf=m.cpfAluno)
WHERE m.codDiario IN (
SELECT coddiario
FROM visaoDiario
WHERE disciplina ='Português');

/*Lista responsáveis que possuam mais de um telefone do trabalho*/
SELECT nome AS Responsavel
FROM visaoResponsavelPessoa*
WHERE cpf IN 
(SELECT cpf
FROM telefoneResponsavel
GROUP BY cpf
HAVING COUNT(*) > 1);

/*Listar professores que possuem avaliações do tipo Prova */
SELECT professor 
FROM visaoDiario vd
WHERE EXISTS 
(SELECT * 
FROM Avaliacao a
WHERE a.codDiario = vd.codDiario AND a.tipo='Prova');

/*Lista professores que não possuem email*/
SELECT p.nome AS Professor
FROM visaoProfessorPessoa p
WHERE NOT EXISTS (
SELECT * 
FROM emailPessoa e 
WHERE e.cpf=p.cpf);

/*Listar alunos que assistem aulas nas salas "Sala 02" ou "Sala 03".*/
(SELECT a.matricula, a.nome As Aluno
FROM (visaoAlunoPessoa a JOIN matricula m ON (a.cpf=m.cpfAluno)) JOIN visaoDiario d ON (m.codDiario=d.codDiario)
WHERE d.sala ='Sala 02') UNION (SELECT a.matricula, a.nome As Aluno
FROM (visaoAlunoPessoa a JOIN matricula m ON (a.cpf=m.cpfAluno)) JOIN visaoDiario d ON (m.codDiario=d.codDiario)
WHERE d.sala ='Sala 03');

/*Listar a quantidade de mensagem que cada pessoa compartilhou ordenando por número de mensagens*/
SELECT p.nome , COUNT(c.codMensagem) AS QtdMensagem
FROM pessoa p LEFT JOIN compartilhamensagem c ON(p.cpf=c.cpfEnvia)
GROUP BY p.cpf, p.nome
ORDER BY COUNT(c.codMensagem) DESC;


/*Listar Diário que não marcaram avaliação*/
(SELECT CodDiario
FROM diario)
EXCEPT
(SELECT CodDiario
FROM avaliacao);


/*Lista as mensagem visualizadas e a quantidade de dias entre o envio e sua visualização*/
SELECT r.Nome AS Remetente,d.Nome As Destinatario, m.texto AS Mensagem,
diasEntreDatas(CAST(c.dataHoraEnvio AS DATE),CAST(c.dataHoraVisualizacao AS DATE)) AS DemoraDias
FROM pessoa r, pessoa d, compartilhaMensagem c, mensagem m
WHERE r.cpf = c.cpfEnvia AND d.cpf=c.cpfREcebe AND c.codMensagem=m.codMensagem AND c.dataHoraVisualizacao IS NOT NULL
ORDER BY diasEntreDatas(CAST(c.dataHoraEnvio AS DATE),CAST(c.dataHoraVisualizacao AS DATE)) DESC;

/*Horario em que as mensagens são compartilhadas*/
SELECT COUNT(*) AS QuantMensagens,
	CASE 
		WHEN (CAST(datahoraenvio AS TIME)<CAST('06:00:00' AS TIME))
			THEN 'Noite'
		WHEN (CAST(datahoraenvio AS TIME)<CAST('12:00:00' AS TIME))
			THEN 'Manhã'
		WHEN (CAST(datahoraenvio AS TIME)<CAST('18:00:00' AS TIME))
			THEN 'Tarde'
		ELSE 'Noite'
	END AS HORARIO
FROM compartilhamensagem
GROUP BY HORARIO
ORDER BY COUNT(*) DESC;

/*Relacionar o 3 primeiro colocado no simulado de Geografia*/
SELECT ac.nome,va.matricula, va.nome AS Aluno, rav.nota
FROM (avaliacao av NATURAL JOIN resultadoavaliacao rav) NATURAL JOIN acontecimento ac, VisaoAlunoPessoa va

WHERE av.tipo='Simulado'  AND ac.nome LIKE '%Geografia%' AND rav.cpfaluno = cpf
ORDER BY ac.codacontecimento, rav.nota DESC
LIMIT(3);