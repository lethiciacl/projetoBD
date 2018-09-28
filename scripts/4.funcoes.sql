/*Função que retorna a quantidade de dias entre duas datas*/
CREATE OR REPLACE FUNCTION diasEntreDatas(DATE, DATE) RETURNS INTEGER
	AS $$
		DECLARE
			dataMaior DATE;
			dataMenor DATE;
			dias INTEGER;
		BEGIN
			IF ($1<$2) THEN
				dataMenor := $1;
				dataMaior := $2;
			ELSE
				dataMenor := $2;
				dataMaior := $1;
			END IF;
			dias := dataMaior - dataMenor; 
			RETURN dias;
		END;
	$$ LANGUAGE PLPGSQL;

/*Função que calcula a duracao de um trimestre*/
CREATE OR REPLACE FUNCTION duracaoTrimestre(INTEGER, INTEGER) RETURNS INTEGER
	AS $$
		DECLARE 
			an ALIAS FOR $1;
			nu ALIAS FOR $2;
			dias INTEGER;
			tr trimestre%ROWTYPE;
		BEGIN
			SELECT * INTO tr FROM trimestre WHERE ano=an AND numero=nu;
			dias := diasEntreDatas(tr.dataInicio,tr.dataFim);
			RETURN dias;
		END
	$$ LANGUAGE PLPGSQL;

/*Função que retorna a quantidade de dias para o final do trimestre*/
CREATE OR REPLACE FUNCTION diasParaFinalTrimestre(INTEGER, INTEGER) RETURNS INTEGER
	AS $$
		DECLARE
			an ALIAS FOR $1;
			nu ALIAS FOR $2;
			dias INTEGER;
			hoje DATE;
			tr trimestre%ROWTYPE;	
		BEGIN
			hoje := CAST(CURRENT_TIMESTAMP AS DATE);
			SELECT * INTO tr FROM trimestre WHERE ano=an AND numero=nu;
			IF (tr.dataInicio > hoje ) THEN
				RETURN -1;
				ELSE IF (tr.dataFim < hoje) THEN
					RETURN 0;
				END IF;
			END IF;
			dias := diasEntreDatas(hoje,tr.dataFim);
			RETURN dias;
		END
	$$ LANGUAGE PLPGSQL;

/*Proximo código da mensagem */
CREATE OR REPLACE FUNCTION proximoCodMensagem() RETURNS mensagem.codMensagem%TYPE
	AS $$
		DECLARE
			prx INTEGER;
			cod mensagem.codMensagem%TYPE;
		BEGIN
			SELECT MAX(to_number(SUBSTRING(codMensagem FROM 3)::VARCHAR,'000'))+1 
			INTO prx
			FROM MENSAGEM;
			SELECT LPAD(CAST(prx AS VARCHAR),3,'0')
			INTO cod;
			cod := '#D'||cod;
			RETURN cod;
		END
	$$ LANGUAGE PLPGSQL;