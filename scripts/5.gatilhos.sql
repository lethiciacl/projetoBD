/*Gatilho para enviar mensagem quando avaliação for marcada*/
CREATE OR REPLACE FUNCTION CriaMensagensAvaliacao()
	RETURNS TRIGGER AS $$
	DECLARE		
		avaliacao visaoAvaliacao%ROWTYPE;
		mensagem mensagem.texto%TYPE;
		codMsg mensagem.codMensagem%TYPE;
		cpfAluno aluno.cpf%TYPE;
		cpfResponsavel responsavel.cpf%TYPE;
	BEGIN
		SELECT * INTO avaliacao FROM visaoAvaliacao
		WHERE codAcontecimento = NEW.codAcontecimento;
		mensagem = 'Informativo. '||
		avaliacao.nomeAvaliacao || ' foi marcada para o dia '||
		to_char(avaliacao.dataAvaliacao,'DD/MM/YYYY')|| ', horário '||
		avaliacao.horaIniAvaliacao || ' e local ' ||
		avaliacao.localAvaliacao || ' da disciplina '||
		avaliacao.disciplina;
		SELECT proximoCodMensagem() INTO codMsg  ;
		INSERT INTO mensagem 
		VALUES(
			avaliacao.cpfProfessor,
			codMsg,
			mensagem);

		FOR cpfAluno, cpfResponsavel IN 
			SELECT mt.cpfAluno, rs.codResponsavel 
			FROM matricula mt, responsabiliza rs
			WHERE rs.cpfAluno = mt.cpfAluno AND mt.codDiario=avaliacao.codDiario
			LOOP
				INSERT INTO CompartilhaMensagem
				VALUES(
					avaliacao.cpfProfessor,
					cpfAluno,
					codMsg,
					TRUE,
					CURRENT_TIMESTAMP(0),
					NULL);
				INSERT INTO CompartilhaMensagem
				VALUES(
					avaliacao.cpfProfessor,
					cpfResponsavel,
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