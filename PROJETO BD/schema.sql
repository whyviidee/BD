DROP TABLE IF EXISTS solicita;
DROP TABLE IF EXISTS audita;
DROP TABLE IF EXISTS coordenador;
DROP TABLE IF EXISTS acciona;
DROP TABLE IF EXISTS alocado;
DROP TABLE IF EXISTS transporta;
DROP TABLE IF EXISTS meioSocorro;
DROP TABLE IF EXISTS meioApoio;
DROP TABLE IF EXISTS meioCombate;
DROP TABLE IF EXISTS meio;
DROP TABLE IF EXISTS entidadeMeio;
DROP TABLE IF EXISTS eventoEmergencia ;
DROP TABLE if EXISTS processoSocorro ;
DROP TABLE IF EXISTS vigia;
DROP TABLE IF EXISTS local;
DROP TABLE IF EXISTS segmentoVideo;
DROP TABLE IF EXISTS video;
DROP TABLE IF EXISTS camera;


CREATE TABLE camera (
    numCamera int NOT NULL,
    PRIMARY KEY(numCamera));


CREATE TABLE video (
    dataHoraInicioVideo date NOT NULL,
    dataHoraFim date NOT NULL,
    numCamera int NOT NULL,
    PRIMARY KEY(dataHoraInicioVideo),
    FOREIGN KEY(numCamera) REFERENCES camera(numCamera) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE segmentoVideo (
    numSegmento int NOT NULL,
    duracao date NOT NULL,
    dataHoraInicioVideo date NOT NULL,
    numCamera int NOT NULL,
    PRIMARY KEY(numSegmento),
    FOREIGN KEY(dataHoraInicioVideo) REFERENCES video(dataHoraInicioVideo) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(numCamera) REFERENCES camera(numCamera) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE local (
    moradaLocal VARCHAR(255) NOT NULL,
    PRIMARY KEY(moradaLocal));

CREATE TABLE vigia (
    moradaLocal VARCHAR(255) NOT NULL,
    numCamera int NOT NULL,
    FOREIGN KEY(moradaLocal) REFERENCES local (moradaLocal) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(numCamera) REFERENCES camera(numCamera) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE processoSocorro (
    numProcessoSocorro int NOT NULL,
    PRIMARY KEY(numProcessoSocorro));


CREATE TABLE eventoEmergencia (
    numTelefone int NOT NULL unique,
    instanteChamada timestamp NOT NULL,
    nomePessoa VARCHAR(80) NOT NULL unique,
    moradaLocal VARCHAR(255) NOT NULL,
    numProcessoSocorro int NOT NULL,
    PRIMARY KEY(numTelefone,instanteChamada),
    FOREIGN KEY(moradaLocal) REFERENCES local (moradaLocal) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(numProcessoSocorro) REFERENCES processoSocorro(numProcessoSocorro) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE entidadeMeio (
    nomeEntidade VARCHAR(25) NOT NULL,
    PRIMARY KEY(nomeEntidade));

CREATE TABLE meio (
    numMeio VARCHAR(15) NOT NULL,
    nomeMeio VARCHAR(25) NOT NULL,
    nomeEntidade VARCHAR(25) NOT NULL,
    PRIMARY KEY(numMeio,nomeEntidade),
    FOREIGN KEY(nomeEntidade) REFERENCES entidadeMeio(nomeEntidade) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE meioCombate (
    numMeio VARCHAR(15) NOT NULL,
    nomeEntidade VARCHAR(25) NOT NULL,
    FOREIGN KEY(numMeio,nomeEntidade) REFERENCES meio(numMeio,nomeEntidade) ON DELETE CASCADE ON UPDATE CASCADE,
    --FOREIGN KEY(nomeEntidade) REFERENCES Meio(nomeEntidade) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (numMeio, nomeEntidade));

CREATE TABLE meioApoio (
    numMeio VARCHAR(15) NOT NULL,
    nomeEntidade VARCHAR(25) NOT NULL,
    FOREIGN KEY(numMeio,nomeEntidade) REFERENCES meio(numMeio,nomeEntidade) ON DELETE CASCADE ON UPDATE CASCADE,
    --FOREIGN KEY(nomeEntidade) REFERENCES Meio(nomeEntidade) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (numMeio, nomeEntidade));


CREATE TABLE meioSocorro(
    numMeio VARCHAR(15) NOT NULL,
    nomeEntidade VARCHAR(25) NOT NULL,
    FOREIGN KEY(numMeio,nomeEntidade) REFERENCES meio(numMeio,nomeEntidade) ON DELETE CASCADE ON UPDATE CASCADE,
    --FOREIGN KEY(nomeEntidade) REFERENCES Meio(nomeEntidade) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (numMeio, nomeEntidade));

CREATE TABLE transporta (
    numMeio VARCHAR(15) NOT NULL,
    nomeEntidade VARCHAR(25) NOT NULL,
    numVitimas int NOT NULL,
    numProcessoSocorro int NOT NULL,
    FOREIGN KEY(numMeio,nomeEntidade) REFERENCES meioSocorro(numMeio,nomeEntidade) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(numProcessoSocorro) REFERENCES processoSocorro(numProcessoSocorro) ON DELETE CASCADE ON UPDATE CASCADE);


CREATE TABLE alocado (
    numMeio VARCHAR(15) NOT NULL,
    nomeEntidade VARCHAR(25) NOT NULL,
    numHoras int NOT NULL,
    numProcessoSocorro int NOT NULL,
    FOREIGN KEY(numMeio,nomeEntidade) REFERENCES meioApoio(numMeio,nomeEntidade) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(numProcessoSocorro) REFERENCES processoSocorro(numProcessoSocorro) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE acciona (
    numMeio VARCHAR(15) NOT NULL,
    nomeEntidade VARCHAR(25) NOT NULL,
    numProcessoSocorro int NOT NULL,
    FOREIGN KEY(numMeio,nomeEntidade) REFERENCES meio(numMeio,nomeEntidade) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(numProcessoSocorro) REFERENCES processoSocorro(numProcessoSocorro) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY(numMeio,nomeEntidade,numProcessoSocorro));

CREATE TABLE coordenador (
    idCoordenador int NOT NULL,
    PRIMARY KEY(idCoordenador));

CREATE TABLE audita(
    idCoordenador int NOT NULL,
    numMeio VARCHAR(15) NOT NULL,
    nomeEntidade VARCHAR(25) NOT NULL,
    numProcessoSocorro int NOT NULL,
    dataHoraInicio date NOT NULL,
    dataHoraFim date NOT NULL,
    dataAuditoria date NOT NULL,
    texto VARCHAR(500) NOT NULL,
    FOREIGN KEY(numMeio,nomeEntidade,numProcessoSocorro) REFERENCES acciona(numMeio,nomeEntidade,numProcessoSocorro) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(idCoordenador) REFERENCES coordenador(idCoordenador) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE solicita(
    idCoordenador int NOT NULL,
    dataHoraInicioVideo date NOT NULL,
    numCamera int NOT NULL,
    dataHoraInicio date NOT NULL,
    dataHoraFim date NOT NULL,
    FOREIGN KEY(idCoordenador) REFERENCES coordenador(idCoordenador) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(dataHoraInicioVideo) REFERENCES video(dataHoraInicioVideo) ON DELETE CASCADE ON UPDATE CASCADE);
