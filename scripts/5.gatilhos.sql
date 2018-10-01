/*Gatilho para enviar mensagem quando avaliação for marcada*/
CREATE OR REPLACE FUNCTION CriaMensagensAvaliacao()
	RETURNS TRIGGER AS $$
	DECLARE		
		nomeAcont acontecimento.nome%TYPE;
		dataAcont acontecimento.data%TYPE;
		horaIni acontecimento.horarioInicio%TYPE;
		localAcont acontecimento.local%TYPE;

		cpfProfessor professor.cpf%TYPE;

		nomeDisc disciplina.nome%TYPE;

		mensagem mensagem.texto%TYPE;
		codMsg mensagem.codMensagem%TYPE;
		cpfAln aluno.cpf%TYPE;
		cpfRsp responsavel.cpf%TYPE;
	BEGIN

		SELECT INTO 
			nomeAcont, dataAcont, horaIni, localAcont
			nome, data, horarioInicio, local
		FROM acontecimento WHERE codAcontecimento = NEW.codAcontecimento;

		SELECT INTO
			cpfProfessor, nomeDisc
			cpf, nome
		FROM diario, professor, disciplina 
		WHERE diario.codDiario = NEW.codDiario AND diario.matProf = professor.matricula
		AND diario.codDisciplina = disciplina.codDisciplina;
		/*Criando mensagem*/
		mensagem := nomeAcont || ' - ' || to_char(dataAcont,'DD/MM/YYYY') || ' '|| horaIni || ' - ' || localAcont ;
		SELECT proximoCodMensagem() INTO codMsg;
		INSERT INTO mensagem VALUES(
			cpfProfessor,
			codMsg,
			mensagem);
		/*Compartilhando com o aluno*/
		FOR cpfAln IN 
				SELECT cpfAluno FROM matricula WHERE codDiario=NEW.codDiario
			LOOP
				INSERT INTO CompartilhaMensagem
					VALUES(
						cpfProfessor,
						cpfAln,
						codMsg,
						TRUE,
						CURRENT_TIMESTAMP(0),
						NULL);					
			END LOOP;
		/*Compartilhando com o responsavel*/
		FOR cpfRsp IN 
				SELECT codResponsavel 
				FROM matricula NATURAL JOIN responsabiliza
				WHERE codDiario=NEW.codDiario 
			LOOP
				INSERT INTO CompartilhaMensagem
					VALUES(
						cpfProfessor,
						cpfRsp,
						codMsg,
						TRUE,
						CURRENT_TIMESTAMP(0),
						NULL);					
			END LOOP;	
		RETURN NULL;
	END
	$$ LANGUAGE PLPGSQL;

/*Criando o Gatinho qaundo for marcada uma avaliacao*/
CREATE TRIGGER InformaAvaliacao
AFTER INSERT ON Avaliacao
FOR EACH ROW
EXECUTE PROCEDURE CriaMensagensAvaliacao();

/*---------------------------------------------------------------------------------------*/

/*Cria mensagem de evento*/
CREATE OR REPLACE FUNCTION CriaMensagensEvento()
	RETURNS TRIGGER AS $$
	DECLARE		
		nomeAcont acontecimento.nome%TYPE;
		dataAcont acontecimento.data%TYPE;
		horaIni acontecimento.horarioInicio%TYPE;
		localAcont acontecimento.local%TYPE;

		mensagem mensagem.texto%TYPE;
		codMsg mensagem.codMensagem%TYPE;

		cpfPess pessoa.cpf%TYPE;

	BEGIN
		SELECT INTO 
			nomeAcont, dataAcont, horaIni, localAcont
			nome, data, horarioInicio, local
		FROM acontecimento WHERE codAcontecimento = NEW.codAcontecimento;

		/*Criando mensagem*/
		mensagem := nomeAcont || ' - ' || to_char(dataAcont,'DD/MM/YYYY') || ' '|| horaIni || ' - ' || localAcont ;
		SELECT proximoCodMensagem() INTO codMsg;
		INSERT INTO mensagem VALUES(
			NEW.cpfAdm,
			codMsg,
			mensagem);

		/*Compartilhando com o pessoa*/
		FOR cpfPess IN 
				SELECT cpf FROM pessoa 
			LOOP
				INSERT INTO CompartilhaMensagem
					VALUES(
						NEW.cpfAdm,
						cpfPess,
						codMsg,
						TRUE,
						CURRENT_TIMESTAMP(0),
						NULL);					
			END LOOP;
		RETURN NULL;
	END
	$$ LANGUAGE PLPGSQL;

/*Criando o Gatinho qaundo for marcado um evento*/
CREATE TRIGGER InformaEvento
AFTER INSERT ON Evento
FOR EACH ROW
EXECUTE PROCEDURE CriaMensagensEvento();

/*---------------------------------------------------------------------------------------*/

/*Modifica o RE do aluno*/
CREATE OR REPLACE FUNCTION ModificaREAluno()
	RETURNS TRIGGER AS $$
	DECLARE		
		media ResultadoAvaliacao.nota%TYPE;
	BEGIN
		SELECT INTO media AVG(nota) FROM ResultadoAvaliacao
		WHERE cpfAluno = NEW.cpfAluno
		GROUP BY cpfAluno;

		UPDATE aluno SET re=media WHERE cpf = NEW.cpfAluno;

		RETURN NULL;
	END
	$$ LANGUAGE PLPGSQL;

/*Criando o Gatinho qaundo for lancada a nota da avalicao*/
CREATE TRIGGER ResultadoAvaliacao
AFTER INSERT ON ResultadoAvaliacao
FOR EACH ROW
EXECUTE PROCEDURE ModificaREAluno();

/*---------------------------------------------------------------------------------------*/

/*Mensagem quando frequencia ficar abaixo de 75 */
CREATE OR REPLACE FUNCTION InformaFrequencia()
	RETURNS TRIGGER AS $$
	DECLARE
		cpfProfessor professor.cpf%TYPE;
		nomeDisc disciplina.nome%TYPE;
		mensagem mensagem.texto%TYPE;
		codMsg mensagem.codMensagem%TYPE;
		nomeAluno pessoa.nome%TYPE;
		cpfRsp responsavel.cpf%TYPE;
	BEGIN

		SELECT INTO
			nomeAluno
			nome
		FROM pessoa
		WHERE cpf = NEW.cpfAluno;
		SELECT INTO
			cpfProfessor, nomeDisc
			cpf, nome
		FROM diario, professor, disciplina 
		WHERE diario.codDiario = NEW.codDiario AND diario.matProf = professor.matricula
		AND diario.codDisciplina = disciplina.codDisciplina;
		/*Criando mensagem*/
		mensagem := 'A frenquencia do aluno '||nomeAluno|| ' na disciplina  '||nomeDisc||' é de '|| NEW.frequencia||'.';
		SELECT proximoCodMensagem() INTO codMsg;
		INSERT INTO mensagem VALUES(
			cpfProfessor,
			codMsg,
			mensagem);
		/*Compartilhando com o aluno*/
		
		INSERT INTO CompartilhaMensagem
			VALUES(
				cpfProfessor,
				NEW.cpfAluno,
				codMsg,
				TRUE,
				CURRENT_TIMESTAMP(0),
				NULL);					
		
		/*Compartilhando com o responsavel*/
		FOR cpfRsp IN 
				SELECT codResponsavel 
				FROM matricula NATURAL JOIN responsabiliza
				WHERE codDiario=NEW.codDiario AND matricula.cpfAluno=NEW.cpfAluno
			LOOP
				INSERT INTO CompartilhaMensagem
					VALUES(
						cpfProfessor,
						cpfRsp,
						codMsg,
						TRUE,
						CURRENT_TIMESTAMP(0),
						NULL);					
			END LOOP;	
		RETURN NULL;
	END
	$$ LANGUAGE PLPGSQL;

/*Criando o gatilho quando a frequencia ficar abaixo de 75%*/
CREATE TRIGGER FrequenciaInferior 
AFTER INSERT OR UPDATE ON matricula
FOR EACH ROW
WHEN (NEW.frequencia < 0.75)
EXECUTE PROCEDURE InformaFrequencia();