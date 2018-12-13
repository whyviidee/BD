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
	tipo VARCHAR(15)  ,
	PRIMARY KEY(idMeio));

CREATE TABLE d_tempo(
	idData SERIAL ,
	dia int NOT NULL,
	mes int NOT NULL,
	ano int NOT NULL,
	PRIMARY KEY(idData));

CREATE TABLE fact_table(
	idFact SERIAL,
	idEvento INT ,
	idMeio INT ,
	idData INT ,
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

INSERT INTO d_tempo (dia, mes, ano)
	SELECT EXTRACT (DAY FROM instanteChamada) as dia,
		   EXTRACT (MONTH FROM instanteChamada) as  mes,
		   EXTRACT (YEAR FROM instanteChamada) as ano
		   FROM eventoEmergencia;

INSERT INTO fact_table(idEvento, idMeio, idData)
		SELECT idEvento ,idMeio, idData FROM d_evento , d_meio ,d_tempo ;




-- RESTRICOES DE INTEGRIDADE

DROP TRIGGER IF EXISTS chk_solicita_trigger AS solicita;

CREATE OR REPLACE FUNCTION chk_solicita() returns Trigger AS $$
BEGIN
  DECLARE n int;
  SET n = (
    SELECT COUNT(idCoordenador)
    FROM vigia NATURAL JOIN eventoEmergencia NATURAL JOIN audita AS table
    WHERE new.idCoordenador = table.idCoordenador AND new.numCamara = table.numCamara
    );
  IF n < 1 THEN
    RAISE EXCEPTION 'Nonexistent Coordinator ID',
    USING HINT = 'Check if Coordinator auditates the local adress'
  END if;
end;
$$ Language plpgsql;

CREATE TRIGGER chk_solicita_trigger after update on solicita
FOR EACH ROW EXECUTE PROCEDURE chk_solicita();



DROP TRIGGER IF EXISTS chk_alocado_trigger AS alocado;

CREATE OR REPLACE FUNCTION chk_alocado() returns Trigger AS $$
BEGIN
  DECLARE n int;
  SET n = (
    SELECT COUNT(numMeio)
    FROM meioApoio NATURAL JOIN Accionado AS table
    WHERE new.numMeio = table.numMeio AND new.numProcessoSocorro= table.numProcessoSocorro
    );
  IF n < 1 THEN
    RAISE EXCEPTION 'Nonexistent Half',
    USING HINT = 'Check if Half alocaded to the HelpProcess'
  END if;
end;
$$ Language plpgsql;

CREATE TRIGGER chk_alocado_trigger after update on alocado
FOR EACH ROW EXECUTE PROCEDURE chk_alocado();
