DROP TABLE IF EXISTS fact_table;
DROP TABLE IF EXISTS d_tempo;
DROP TABLE IF EXISTS d_meio;
DROP TABLE IF EXISTS d_evento;

-- CRIACAO DAS TABELAS

CREATE TABLE d_evento(
	idEvento SERIAL,
	numTelefone INT NOT NULL,
	instanteChamada date,
	PRIMARY KEY(idEvento));

CREATE TABLE d_meio(
	idMeio SERIAL,
	numMeio VARCHAR(15) NOT NULL,
	nomeMeio VARCHAR(15) NOT NULL,
	nomeEntidade VARCHAR(25) NOT NULL,
	tipo VARCHAR (15) ,
	PRIMARY KEY(idMeio));

CREATE TABLE d_tempo(
	idData SERIAL ,
	dia int NOT NULL,
	mes int NOT NULL,
	ano int NOT NULL,
	PRIMARY KEY(idData));

CREATE TABLE fact_table(
	idFact SERIAL,
	idEvento INT NOT NULL,
	idMeio INT NOT NULL,
	idData INT NOT NULL,
	PRIMARY KEY(idFact),
	FOREIGN KEY (idEvento) REFERENCES d_evento(idEvento),
	FOREIGN KEY (idMeio) REFERENCES d_meio(idMeio),
	FOREIGN KEY (idData) REFERENCES d_tempo(idData) ON DELETE CASCADE ON UPDATE CASCADE);


-- POPULATE DAS TABELAS


INSERT INTO d_evento (numTelefone, instanteChamada) 
	SELECT numTelefone, instanteChamada
		FROM eventoEmergencia;


INSERT INTO d_meio (numMeio, nomeMeio, nomeEntidade)
	SELECT numMeio, nomeMeio, nomeEntidade
		FROM meio;

INSERT INTO d_meio (tipo)
	SELECT (IF ((meio.numMeio = meioCombate.numMeio ) as tipo OR 
			   (meio.numMeio = meioApoio.numMeio) as tipo OR 
			   (meio.numMeio = meioSocorro.numMeio) as tipo));

INSERT INTO d_tempo (dia, mes, ano)
	SELECT 	DAYOFMONTH(date) as dia,
    		MONTH(date) as mes,
    		YEAR(date) as ano
    			FROM (SELECT dataHoraInicio FROM audita);

INSERT INTO fact_table(idEvento, idMeio, idData)
	SELECT	(SELECT idEvento
				FROM d_evento
					WHERE d_evento.numTelefone = eventoEmergencia.numTelefone) idEvento,
			(SELECT idMeio
				FROM d_meio
					WHERE d_meio.numMeio = meio.numMeio) idMeio,
			(SELECT idData
				FROM d_tempo
					WHERE dia = DAYOFMONTH(data) AND mes = MONTH(data) AND ano = YEAR(data)) idData;




-- RESTRICOES DE INTEGRIDADE




