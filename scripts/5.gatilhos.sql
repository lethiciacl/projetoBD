/*Gatilho para enviar mensagem quando avaliação for 

marcada*/
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
		cpfResponsavel responsavel.cpf%TYPE;
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

		/*mensagem := 'Informativo. '||
		nomeAcont || ' foi marcada para o dia '||
		to_char(dataAcont,'DD/MM/YYYY')|| ', horário '||
		horaIni || ' e local ' ||
		localAcont || ' da disciplina '||
		nomeDisc;*/

		mensagem := nomeAcont || ' - ' || to_char(dataAcont,'DD/MM/YYYY') || ' '|| horaIni || ' - ' || localAcont ;
		SELECT proximoCodMensagem() INTO codMsg;
		INSERT INTO mensagem VALUES(
			cpfProfessor,
			codMsg,
			mensagem);

		FOR cpfAln IN SELECT cpfAluno FROM matricula WHERE codDiario=NEW.codDiario
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
		RETURN NULL;
	END
	$$ LANGUAGE PLPGSQL;

/*Criando o Gatinho qaundo for marcada uma avaliacao*/
CREATE TRIGGER InformaAvaliacao
AFTER INSERT ON Avaliacao
FOR EACH ROW
EXECUTE PROCEDURE CriaMensagensAvaliacao();