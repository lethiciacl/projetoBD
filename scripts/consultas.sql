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

/*Listar mensagens destinadas a Carlos que já foram visualizadas.*/
SELECT m.texto AS Mensagem
FROM pessoa p, mensagem m, compartilhamensagem c
WHERE p.nome='Carlos' AND p.cpf=c.cpfRecebe AND c.codMensagem=m.codMensagem AND c.dataHoraVisualizacao IS NOT NULL;

/*Listar mensagens com seus respectivos remetente e destinatário que contenham a palavra "Amor"*/
SELECT r.nome AS Remetente, d.nome AS Destinatario, m.texto AS Mensagem
FROM mensagem m, compartilhamensagem c, pessoa d, pessoa r
WHERE m.texto LIKE '%Amor%' AND m.codMensagem = c.codMensagem AND d.cpf=c.cpfRecebe AND r.cpf=c.cpfEnvia

/*Listar professores que residem na cidade de Sousa*/
SELECT nome AS Professor
FROM visaoprofessorpessoa
WHERE endereco LIKE '%Sousa%'

/*Listar alunos ordenando de acordo com seu respectivo rendimento escolar*/
SELECT nome AS Aluno, re AS RendimentoEscolar
FROM visaoalunopessoa
ORDER BY re DESC

/*Listagem de alunos em ordem alfabética*/
SELECT nome AS Alunos
FROM VisaoAlunoPessoa
ORDER BY nome

/*Listar alunos matriculados na disciplina Protuguês*/
SELECT a.matricula, a.nome AS Aluno
FROM visaoAlunoPessoa a JOIN matricula m ON (a.cpf=m.cpfAluno)
WHERE m.codDiario IN (
SELECT coddiario
FROM visaoDiario
WHERE disciplina ='Português')