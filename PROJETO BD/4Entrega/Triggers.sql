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
 _________________________________________________________________________________________________________
/________________________________________________________________________________________________________/

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
