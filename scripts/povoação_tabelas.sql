/*pessoa*/

/*responsáveis*/
INSERT INTO pessoa(nome,cpf,senha,identidade,dataNascimento,sexo,endereco)
VALUES('Ana Rodrigues','947.564.740-63','gDNyZQXL','34.642.816-6','10/02/1988','feminino','Cajazeiras - Paraíba, Brasil');

INSERT INTO pessoa(nome,cpf,senha,identidade,dataNascimento,sexo,endereco)
VALUES('Beatriz Pereira','816.582.500-36','FkT8D2Je','38.045.510-9','04/07/1985','feminino','Cajazeiras - Paraíba, Brasil');

INSERT INTO pessoa(nome,cpf,senha,identidade,dataNascimento,sexo,endereco)
VALUES('Antonella Fernandes','455.270.350-11','UkRp9t2G','39.900.321-6','23/12/1979','feminino','Cajazeiras - Paraíba, Brasil');

INSERT INTO pessoa(nome,cpf,senha,identidade,dataNascimento,sexo,endereco)
VALUES('Matheus Ricardo Almada','492.332.324-84','DLqdK7xeNG','48.684.360-9','21/02/1996','masculino','Cajazeiras - Paraíba, Brasil');

INSERT INTO pessoa(nome,cpf,senha,identidade,dataNascimento,sexo,endereco)
VALUES('Theo Henry Campos','829.340.194-03', 'RoMI1LhQPn','35.940.274-4','06/11/1992','masculino','Cajazeiras - Paraíba, Brasil');

/*professores*/
INSERT INTO pessoa(nome,cpf,senha,identidade,dataNascimento,sexo,endereco)
VALUES('Jennifer Amanda Porto','974.336.374-27', 'Ajh5W9Rrpm', '19.067.861-6', '12/12/1981', 'feminino', 'Sousa - Paraíba, Brasil');

INSERT INTO pessoa(nome,cpf,senha,identidade,dataNascimento,sexo,endereco)
VALUES('Henry Murilo Raul de Paula', '490.437.174-79', 'CM9gJC6huG', '13.096.888-2', '09/11/1985', 'masculino', 'Sousa - Paraíba, Brasil');

INSERT INTO pessoa(nome,cpf,senha,identidade,dataNascimento,sexo,endereco)
VALUES('Vitor Guilherme Moura', '979.536.644-02', 'QhgLRfwnHa', '38.528.504-8','03/10/1985','masculino', 'Sousa - Paraíba, Brasil');

INSERT INTO pessoa(nome,cpf,senha,identidade,dataNascimento,sexo,endereco)
VALUES('Mariana Fernanda Souza','725.430.454-73','EdO1twUIxx','24.860.270-6','20/02/1988','feminino','Sousa - Paraíba, Brasil');

INSERT INTO pessoa(nome,cpf,senha,identidade,dataNascimento,sexo,endereco)
VALUES('Augusto Mário Almada','421.019.024-19','wG2PWATc6Y','10.088.219-5','20/12/1988','masculino','Sousa - Paraíba, Brasil');

/*administrador*/
INSERT INTO pessoa(nome,cpf,senha,identidade,dataNascimento,sexo,endereco)
VALUES('Maitê Duarte','071.053.094-31','hexiL6ltSq','40.368.856-5','19/01/1968','feminino','Pombal - Paraíba, Brasil');

INSERT INTO pessoa(nome,cpf,senha,identidade,dataNascimento,sexo,endereco)
VALUES('Raimunda Nogueira','140.261.534-52','taZ40aHcln','28.267.872-4','24/01/1960','feminino','Pombal - Paraíba, Brasil');

INSERT INTO pessoa(nome,cpf,senha,identidade,dataNascimento,sexo,endereco)
VALUES('Alessandra Nascimento','866.110.874-86','wWjo9OyKRq','16.326.035-7','26/06/1972','feminino','Pombal - Paraíba, Brasil');

INSERT INTO pessoa(nome,cpf,senha,identidade,dataNascimento,sexo,endereco)
VALUES('Joaquim Assis','591.310.934-18','mmaKhkhslc','35.784.148-7','02/03/1979','masculino','Pombal - Paraíba, Brasil');

INSERT INTO pessoa(nome,cpf,senha,identidade,dataNascimento,sexo,endereco)
VALUES('Oliver Santos','561.077.524-80','0SJW6RarF6','44.583.476-6','27/12/1981','masculino','Pombal - Paraíba, Brasil');

/*aluno*/
INSERT INTO pessoa(nome,cpf,senha,identidade,dataNascimento,sexo,endereco)
VALUES('Estella Costa', '537.759.154-27', 'LcfswMbUMi','31.584.762-1','25/09/2003','feminino','Cajazeiras - Paraíba, Brasil');

INSERT INTO pessoa(nome,cpf,senha,identidade,dataNascimento,sexo,endereco)
VALUES('Luana Souza','003.962.124-33','pB6tERtui5','24.046.447-3','01/11/2005','feminino','Cajazeiras - Paraíba, Brasil');

INSERT INTO pessoa(nome,cpf,senha,identidade,dataNascimento,sexo,endereco)
VALUES('Carlos','963.234.750-14','5cxuHnEM','39.871.131-8','14/01/2005','masculino','Cajazeiras - Paraíba, Brasil');

INSERT INTO pessoa(nome,cpf,senha,identidade,dataNascimento,sexo,endereco)
VALUES('Daniel','358.595.280-19','txzeMrNt','47.919.186-4','10/03/2005','masculino','Cajazeiras - Paraíba, Brasil');

INSERT INTO pessoa(nome,cpf,senha,identidade,dataNascimento,sexo,endereco)
VALUES('Ellen','236.717.500-49','ubhKs5Wy','26.190.992-7','19/08/2003','feminino','Cajazeiras - Paraíba, Brasil');

/*responsável*/

INSERT INTO responsavel(cpf,enderecoTrabalho)
VALUES ('947.564.740-63','Cajazeiras - Paraíba, Brasil');
INSERT INTO responsavel(cpf,enderecoTrabalho)
VALUES ('816.582.500-36','Cajazeiras - Paraíba, Brasil');
INSERT INTO responsavel(cpf,enderecoTrabalho)
VALUES ('455.270.350-11','Cajazeiras - Paraíba, Brasil');
INSERT INTO responsavel(cpf,enderecoTrabalho)
VALUES ('492.332.324-84','Cajazeiras - Paraíba, Brasil');
INSERT INTO responsavel(cpf,enderecoTrabalho)
VALUES ('829.340.194-03','Cajazeiras - Paraíba, Brasil');

/*aluno*/

INSERT INTO aluno(cpf,matricula,RE,nomeMae,nomePai)
VALUES('537.759.154-27','2018140001',9.3,'Ana','João');
INSERT INTO aluno(cpf,matricula,RE,nomeMae,nomePai)
VALUES('003.962.124-33','2018140002',8.3,'Beatriz','Márcio');
INSERT INTO aluno(cpf,matricula,RE,nomeMae,nomePai)
VALUES('963.234.750-14','2018140003',9.1,'Antonella','André');
INSERT INTO aluno(cpf,matricula,RE,nomeMae,nomePai)
VALUES('358.595.280-19','2018140004',7.6,'Marcella','Matheus');
INSERT INTO aluno(cpf,matricula,RE,nomeMae,nomePai)
VALUES('236.717.500-49','2018140005',8.4,'Edilsa','Theo');

/*administrador*/

INSERT INTO administrador(cpf,cargo,setor)
VALUES('071.053.094-31','Diretora','Administrativo');
INSERT INTO administrador(cpf,cargo,setor)
VALUES('140.261.534-52','Cordenadora','Administrativo');
INSERT INTO administrador(cpf,cargo,setor)
VALUES('561.077.524-80','Técnico de T.I.','T.I.');
INSERT INTO administrador(cpf,cargo,setor)
VALUES('866.110.874-86','Vice-Diretora','Administrativo');
INSERT INTO administrador(cpf,cargo,setor)
VALUES('591.310.934-18','Coordenador','Administrativo');

/*professor*/

INSERT INTO professor(cpf,matricula,titulacao)
VALUES('974.336.374-27','2018120001','mestrado');
INSERT INTO professor(cpf,matricula,titulacao)
VALUES('490.437.174-79','2018120002','especialização');
INSERT INTO professor(cpf,matricula,titulacao)
VALUES('979.536.644-02','2018120003','mestrado');
INSERT INTO professor(cpf,matricula,titulacao)
VALUES('725.430.454-73','2018120004','doutorado');
INSERT INTO professor(cpf,matricula,titulacao)
VALUES('421.019.024-19','2018120005','doutorado');

/*acontecimento*/

INSERT INTO acontecimento(codAcontecimento,nome,data,horarioInicio,horarioFim,local) 
VALUES('#001','Dia das Mães','13/05/2018','17:30','21:00','Ginásio');
INSERT INTO acontecimento(codAcontecimento,nome,data,horarioInicio,horarioFim,local) 
VALUES('#002','Dia dos Pais','08/08/2018','18:00','22:00','Ginásio');
INSERT INTO acontecimento(codAcontecimento,nome,data,horarioInicio,horarioFim,local) 
VALUES('#003','Dia do Estudante','11/08/2018','10:45','11:45','Ginásio');
INSERT INTO acontecimento(codAcontecimento,nome,data,horarioInicio,horarioFim,local) 
VALUES('#004','Natal','22/12/2018','18:00','20:00','Praça Padre Rolim');
INSERT INTO acontecimento(codAcontecimento,nome,data,horarioInicio,horarioFim,local) 
VALUES('#005','Dia dos Professores','14/10/2018','19:00','23:00','Ginásio');
INSERT INTO acontecimento(codAcontecimento,nome,data,horarioInicio,horarioFim,local) 
VALUES('#006','Avaliação de Matemática','13/09/2018','11:00','12:05','Sala-01');
INSERT INTO acontecimento(codAcontecimento,nome,data,horarioInicio,horarioFim,local) 
VALUES('#007','Avaliação de Português','18/09/2018','07:00','09:15','Sala-02');
INSERT INTO acontecimento(codAcontecimento,nome,data,horarioInicio,horarioFim,local) 
VALUES('#008','Avaliação de Geografia', '20/09/2018','08:30','09:15','Sala-01');
INSERT INTO acontecimento(codAcontecimento,nome,data,horarioInicio,horarioFim,local) 
VALUES('#009','Avaliação de Inglês','12/09/2018','09:30','11:00','Sala-02');
INSERT INTO acontecimento(codAcontecimento,nome,data,horarioInicio,horarioFim,local) 
VALUES('#010','Avaliação de Espanhol','14/09/2018','10:45','12:05','Sala 01');

/*turma*/

INSERT INTO turma(codTurma, serie, sala)
VALUES('#B001','1A-EM','Sala 01');
INSERT INTO turma(codTurma, serie, sala)
VALUES('#B002','8A-EFII','Sala 02');
INSERT INTO turma(codTurma, serie, sala)
VALUES('#B003','8B-EFII','Sala 03');
INSERT INTO turma(codTurma, serie, sala)
VALUES('#B004','8C-EFII','Sala 04');
INSERT INTO turma(codTurma, serie, sala)
VALUES('#B005','1B-EM', 'Sala 05');

/*trimestre*/
INSERT INTO trimestre(ano, numero, dataInicio, dataFim)
VALUES(2017,1,'14/02/2017','18/05/2017');
INSERT INTO trimestre(ano, numero, dataInicio, dataFim)
VALUES(2017,2,'21/05/2017','06/09/2017');
INSERT INTO trimestre(ano, numero, dataInicio, dataFim)
VALUES(2017,3,'10/09/2017','14/12/2017');
INSERT INTO trimestre(ano, numero, dataInicio, dataFim)
VALUES(2018,1,'14/02/2018','18/05/2018');
INSERT INTO trimestre(ano, numero, dataInicio, dataFim)
VALUES(2018,2,'21/05/2018','06/09/2018');
INSERT INTO trimestre(ano, numero, dataInicio, dataFim)
VALUES(2018,3,'10/09/2018','14/12/2018');

/*organizatrimestre*/

INSERT INTO organizatrimestre(ano,numero,codTurma)
VALUES(2018,2,'#B001');
INSERT INTO organizatrimestre(ano,numero,codTurma)
VALUES(2018,2,'#B002');
INSERT INTO organizatrimestre(ano,numero,codTurma)
VALUES(2018,1,'#B003');
INSERT INTO organizatrimestre(ano,numero,codTurma)
VALUES(2018,1,'#B004');
INSERT INTO organizatrimestre(ano,numero,codTurma)
VALUES(2018,3,'#B005');

/*mensagem*/

INSERT INTO mensagem(cpf,codMensagem,texto) 
VALUES('947.564.740-63','#D001','Olá, mundo!');
INSERT INTO mensagem(cpf,codMensagem,texto) 
VALUES('974.336.374-27','#D002','Tudo tem que acabar eventualmente. Senão nada poderia começar.');
INSERT INTO mensagem(cpf,codMensagem,texto) 
VALUES('071.053.094-31','#D003','Não faz sentido ser adulto se por vezes não se pode ser criança.');
INSERT INTO mensagem(cpf,codMensagem,texto) 
VALUES('140.261.534-52','#D004','Inteligência superior e crueldade insensível simplesmente não vão bem juntas');
INSERT INTO mensagem(cpf,codMensagem,texto) 
VALUES('358.595.280-19','#D005','Existe sempre uma solução.');
INSERT INTO mensagem(cpf,codMensagem,texto)
VALUES('236.717.500-49','#D006','Nunca esteja certo de tudo. É um sinal de fraqueza.');
INSERT INTO mensagem(cpf,codMensagem,texto)
VALUES('490.437.174-79','#D007','Violência não acaba com a violência, expande-a.');
INSERT INTO mensagem(cpf,codMensagem,texto)
VALUES('591.310.934-18','#D008','A dor e a perda nos define tanto quanto a felicidade e o amor.');
INSERT INTO mensagem(cpf,codMensagem,texto)
VALUES('963.234.750-14','#D009','Algumas coisas valem a pena, mesmo que partam seu coração.');
INSERT INTO mensagem(cpf,codMensagem,texto)
VALUES('829.340.194-03','#D010','Amor não é sentimento... Amor é uma promessa.');
INSERT INTO mensagem(cpf,codMensagem,texto)
VALUES('071.053.094-31','#D011','A aluna Maité Duarte apresentou compormatemento inadequado durante a aula.');

/*compartilhamensagem*/

INSERT INTO compartilhamensagem(cpfEnvia,cpfRecebe,codMensagem,visibilidade,dataHoraEnvio,dataHoraVisualizacao)
VALUES('947.564.740-63','236.717.500-49','#D001',FALSE,'11/10/2018 11:29:29','11/10/2018 13:47:34');
INSERT INTO compartilhamensagem(cpfEnvia,cpfRecebe,codMensagem,visibilidade,dataHoraEnvio,dataHoraVisualizacao)
VALUES('974.336.374-27','490.437.174-79','#D002',FALSE,'12/10/2018 15:11:23','12/10/2018 17:20:00');
INSERT INTO compartilhamensagem(cpfEnvia,cpfRecebe,codMensagem,visibilidade,dataHoraEnvio,dataHoraVisualizacao)
VALUES('071.053.094-31','591.310.934-18','#D003',FALSE,'13/10/2018 16:00:02','13/10/2018 18:59:37');
INSERT INTO compartilhamensagem(cpfEnvia,cpfRecebe,codMensagem,visibilidade,dataHoraEnvio,dataHoraVisualizacao)
VALUES('140.261.534-52','963.234.750-14','#D004',FALSE,'14/10/2018 09:45:36','14/10/2018 09:47:11');
INSERT INTO compartilhamensagem(cpfEnvia,cpfRecebe,codMensagem,visibilidade,dataHoraEnvio,dataHoraVisualizacao)
VALUES('358.595.280-19','829.340.194-03','#D005',FALSE,'15/10/2018 07:43:34','15/10/2018 08:53:11');
INSERT INTO compartilhamensagem(cpfEnvia,cpfRecebe,codMensagem,visibilidade,dataHoraEnvio,dataHoraVisualizacao)
VALUES('071.053.094-31','947.564.740-63','#D011',FALSE,'10/09/2018 07:43:34',null);
INSERT INTO compartilhamensagem(cpfEnvia,cpfRecebe,codMensagem,visibilidade,dataHoraEnvio,dataHoraVisualizacao)
VALUES('829.340.194-03','816.582.500-36','#D010',FALSE,'20/09/2018 07:43:34','20/09/2018 08:43:34');


/*respondemensagem*/

INSERT INTO respondemensagem(codMensagem,codResposta)
VALUES('#D001','#D002');
INSERT INTO respondemensagem(codMensagem,codResposta)
VALUES('#D003','#D004');
INSERT INTO respondemensagem(codMensagem,codResposta)
VALUES('#D005','#D006');
INSERT INTO respondemensagem(codMensagem,codResposta)
VALUES('#D007','#D008');
INSERT INTO respondemensagem(codMensagem,codResposta)
VALUES('#D009','D009');

/*resultadoavaliação*/

INSERT INTO resultadoavaliacao(cpfAluno,codAcontecimento,nota)
VALUES('537.759.154-27','#006',8.2);
INSERT INTO resultadoavaliacao(cpfAluno,codAcontecimento,nota)
VALUES('003.962.124-33','#007',9.3);
INSERT INTO resultadoavaliacao(cpfAluno,codAcontecimento,nota)
VALUES('963.234.750-14','#008',9.9);
INSERT INTO resultadoavaliacao(cpfAluno,codAcontecimento,nota)
VALUES('358.595.280-19','#009',9.1);
INSERT INTO resultadoavaliacao(cpfAluno,codAcontecimento,nota)
VALUES('236.717.500-49','#010',10.0);

/*disciplina*/

INSERT INTO disciplina(nome, cargaHoraria, codDisciplina)
VALUES('Matemática',40,'#C001');
INSERT INTO disciplina(nome, cargaHoraria, codDisciplina)
VALUES('Português',40,'#C002');
INSERT INTO disciplina(nome, cargaHoraria, codDisciplina)
VALUES('Geografia',40,'#C003');
INSERT INTO disciplina(nome, cargaHoraria, codDisciplina)
VALUES('Inglês',20,'#C004');
INSERT INTO disciplina(nome, cargaHoraria, codDisciplina)
VALUES('Espanhol',20,'#C005');

/*diario*/

INSERT INTO diario(codDiario, atualizado, matProf, codTurma, codDisciplina)
VALUES('#AA01',TRUE, '2018120001','#B001','#C001');
INSERT INTO diario(codDiario, atualizado, matProf, codTurma, codDisciplina)
VALUES('#AA02',TRUE, '2018120002','#B002','#C002');
INSERT INTO diario(codDiario, atualizado, matProf, codTurma, codDisciplina)
VALUES('#AA03',TRUE,'2018120003','#B003','#C003');
INSERT INTO diario(codDiario, atualizado, matProf, codTurma, codDisciplina)
VALUES('#AA04',TRUE,'2018120004','#B004','#C004');
INSERT INTO diario(codDiario, atualizado, matProf, codTurma, codDisciplina)
VALUES('#AA05',TRUE,'2018120005','#B005','#C005');

/*evento*/

INSERT INTO evento(codAcontecimento,coordenador,descrição,cpfAdm)
VALUES('#001','Mário','Dia dos mães proposto para enaltecer a figura materna.','561.077.524-80');
INSERT INTO evento(codAcontecimento,coordenador,descrição,cpfAdm)
VALUES('#002','Andressa','Dia dos pais proposto para enaltecer a figura paterna.','561.077.524-80');
INSERT INTO evento(codAcontecimento,coordenador,descrição,cpfAdm)
VALUES('#003','Anália', 'Dia dos estudantes proposto para enaltecer os alunos.','561.077.524-80');
INSERT INTO evento(codAcontecimento,coordenador,descrição,cpfAdm)
VALUES('#004','Natal','Auto de natal para comemorar o evento cristão.','071.053.094-31');
INSERT INTO evento(codAcontecimento,coordenador,descrição,cpfAdm)
VALUES('#005','Dia dos Professores','Jantar de comemoração para o dia dos professores.','591.310.934-18');

/*avaliacao*/

INSERT INTO avaliacao(codDiario,numero,tipo,codAcontecimento)
VALUES('#AA01',1,'Prova','#006');
INSERT INTO avaliacao(codDiario,numero,tipo,codAcontecimento)
VALUES('#AA02',1,'Prova','#007');
INSERT INTO avaliacao(codDiario,numero,tipo,codAcontecimento)
VALUES('#AA03',1,'Prova','#008');
INSERT INTO avaliacao(codDiario,numero,tipo,codAcontecimento)
VALUES('#AA04',1,'Prova','#009');
INSERT INTO avaliacao(codDiario,numero,tipo,codAcontecimento)
VALUES('#AA05',1,'Prova','#010');

/*responsabiliza*/

INSERT INTO responsabiliza(codResponsavel, cpfAluno, parentesco)
VALUES('947.564.740-63','537.759.154-27','Mãe');
INSERT INTO responsabiliza(codResponsavel, cpfAluno, parentesco)
VALUES('816.582.500-36','003.962.124-33', 'Mãe');
INSERT INTO responsabiliza(codResponsavel, cpfAluno, parentesco)
VALUES('455.270.350-11','963.234.750-14','Mãe');
INSERT INTO responsabiliza(codResponsavel, cpfAluno, parentesco)
VALUES('492.332.324-84','358.595.280-19','Pai');
INSERT INTO responsabiliza(codResponsavel, cpfAluno, parentesco)
VALUES('829.340.194-03','236.717.500-49','Pai');

/*matricula*/

INSERT INTO matricula(cpfAluno,codDiario,frequencia)
VALUES('537.759.154-27','#AA01', 91);
INSERT INTO matricula(cpfAluno,codDiario,frequencia)
VALUES('003.962.124-33','#AA02', 93);
INSERT INTO matricula(cpfAluno,codDiario,frequencia)
VALUES('963.234.750-14','#AA02', 94);
INSERT INTO matricula(cpfAluno,codDiario,frequencia)
VALUES('358.595.280-19','#AA02', 79);
INSERT INTO matricula(cpfAluno,codDiario,frequencia)
VALUES('236.717.500-49','#AA01', 88);

/*conteudoavaliacao*/

INSERT INTO conteudoavaliacao(codAcontecimento,conteudo)
VALUES('#006','Álgebra');
INSERT INTO conteudoavaliacao(codAcontecimento,conteudo)
VALUES('#007','Figuras de Linguagem');
INSERT INTO conteudoavaliacao(codAcontecimento,conteudo)
VALUES('#008','Relevo');
INSERT INTO conteudoavaliacao(codAcontecimento,conteudo)
VALUES('#009','Present Continuous');
INSERT INTO conteudoavaliacao(codAcontecimento,conteudo)
VALUES('#010','Préterito pluscuamperfecto');

/*emailpessoa*/

INSERT INTO emailpessoa(cpf,email)
VALUES('947.564.740-63','ana@gmail.com');
INSERT INTO emailpessoa(cpf,email)
VALUES('816.582.500-36','beatriz@hotmail.com');
INSERT INTO emailpessoa(cpf,email)
VALUES('974.336.374-27','jennifer@hotmail.com');
INSERT INTO emailpessoa(cpf,email)
VALUES('561.077.524-80','oliver@hotmail.com');
INSERT INTO emailpessoa(cpf,email)
VALUES('003.962.124-33','luana@gmail.com');

/*telefonepessoa*/

INSERT INTO telefonepessoa(cpf,telefone)
VALUES('947.564.740-63','(83)9954-1234');
INSERT INTO telefonepessoa(cpf,telefone)
VALUES('816.582.500-36','(83)9876-5678');
INSERT INTO telefonepessoa(cpf,telefone)
VALUES('974.336.374-27','(83)4209-1105');
INSERT INTO telefonepessoa(cpf,telefone)
VALUES('561.077.524-80','(83)5797-2171');
INSERT INTO telefonepessoa(cpf,telefone)
VALUES('003.962.124-33','(83)8739-5343');


/*telefoneresponsavel*/

INSERT INTO telefoneresponsavel(cpf,telefone)
VALUES('947.564.740-63','(83)9954-3695');
INSERT INTO telefoneresponsavel(cpf,telefone)
VALUES('947.564.740-63','(83)9876-6013');
INSERT INTO telefoneresponsavel(cpf,telefone)
VALUES('816.582.500-36','(83)4209-2929');
INSERT INTO telefoneresponsavel(cpf,telefone)
VALUES('492.332.324-84','(83)5797-2984');
INSERT INTO telefoneresponsavel(cpf,telefone)
VALUES('829.340.194-03','(83)8739-5493');
