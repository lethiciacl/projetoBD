/*professor - Disciplinas e carga horária*/
SELECT p.nome as Professor, dp.nome as Disciplina, dp.cargaHoraria 
FROM pessoa p ,professor pf, diario d, disciplina dp
WHERE (p.cpf=pf.cpf) and (d.matProf = pf.matricula) and (dp.codDisciplina = d.codDisciplina)
