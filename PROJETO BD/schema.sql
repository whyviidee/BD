DROP TABLE IF EXISTS Solicita;
DROP TABLE IF EXISTS Audita;
DROP TABLE IF EXISTS Coordenador;
DROP TABLE IF EXISTS Acciona;
DROP TABLE IF EXISTS Alocado;
DROP TABLE IF EXISTS Transporta;
DROP TABLE IF EXISTS MeioSocorro;
DROP TABLE IF EXISTS MeioApoio;
DROP TABLE IF EXISTS MeioCombate;
DROP TABLE IF EXISTS Meio;
DROP TABLE IF EXISTS EntidadeMeio;
DROP TABLE if EXISTS ProcessoSocorro CASCADE;
DROP TABLE IF EXISTS EventoEmergencia CASCADE;
DROP TABLE IF EXISTS Vigia;
DROP TABLE IF EXISTS Local;
DROP TABLE IF EXISTS SegmentoVideo;
DROP TABLE IF EXISTS Video;
DROP TABLE IF EXISTS Camera;


CREATE TABLE Camera (
    numCamera int NOT NULL,
    PRIMARY KEY(numCamera));
    

CREATE TABLE Video (
    dataHoraInicioVideo date NOT NULL,
    dataHoraFim date NOT NULL,
    numCamera int NOT NULL,
    PRIMARY KEY(dataHoraInicioVideo),
    FOREIGN KEY(numCamera) REFERENCES Camera(numCamera) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE SegmentoVideo (
    numSegmento int NOT NULL,
    duracao date NOT NULL,
    dataHoraInicioVideo date NOT NULL,
    numCamera int NOT NULL,
    PRIMARY KEY(numSegmento),
    FOREIGN KEY(dataHoraInicioVideo) REFERENCES Video(dataHoraInicioVideo) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(numCamera) REFERENCES Camera(numCamera) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Local (
    moradaLocal VARCHAR(255) NOT NULL,
    PRIMARY KEY(moradaLocal));

CREATE TABLE Vigia (
    moradaLocal VARCHAR(255) NOT NULL,
    numCamera int NOT NULL,
    FOREIGN KEY(moradaLocal) REFERENCES Local (moradaLocal) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(numCamera) REFERENCES Camera(numCamera) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE ProcessoSocorro (
    numProcessoSocorro int NOT NULL,
    PRIMARY KEY(numProcessoSocorro));


CREATE TABLE EventoEmergencia (
    numTelefone int NOT NULL unique,
    instanteChamada timestamp NOT NULL,
    nomePessoa VARCHAR(80) NOT NULL unique,
    moradaLocal VARCHAR(255) NOT NULL,
    numProcessoSocorro int NOT NULL,
    PRIMARY KEY(numTelefone,instanteChamada),
    FOREIGN KEY(moradaLocal) REFERENCES Local (moradaLocal) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(numProcessoSocorro) REFERENCES ProcessoSocorro(numProcessoSocorro) ON DELETE CASCADE ON UPDATE CASCADE);



CREATE TABLE EntidadeMeio (
    nomeEntidade VARCHAR(25) NOT NULL,
    PRIMARY KEY(nomeEntidade));
    
CREATE TABLE Meio (
    numMeio int NOT NULL,
    nomeMeio VARCHAR(25) NOT NULL,
    nomeEntidade VARCHAR(25) NOT NULL,
    PRIMARY KEY(numMeio),
    FOREIGN KEY(nomeEntidade) REFERENCES EntidadeMeio(nomeEntidade) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE MeioCombate (
    numMeio int NOT NULL,
    nomeEntidade VARCHAR(25) NOT NULL,
    FOREIGN KEY(numMeio) REFERENCES Meio(numMeio) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(nomeEntidade) REFERENCES EntidadeMeio(nomeEntidade) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE MeioApoio (
    numMeio int NOT NULL,
    nomeEntidade VARCHAR(25) NOT NULL,
    FOREIGN KEY(numMeio) REFERENCES Meio(numMeio) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(nomeEntidade) REFERENCES EntidadeMeio(nomeEntidade) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE MeioSocorro(
    numMeio int NOT NULL,
    nomeEntidade VARCHAR(25) NOT NULL,
    FOREIGN KEY(numMeio) REFERENCES Meio(numMeio) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(nomeEntidade) REFERENCES EntidadeMeio(nomeEntidade) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Transporta (
    numMeio int NOT NULL,
    nomeEntidade VARCHAR(25) NOT NULL,
    numVitimas int NOT NULL,
    numProcessoSocorro int NOT NULL,
    FOREIGN KEY(numMeio,nomeEntidade) REFERENCES MeioSocorro(numMeio,nomeEntidade) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(numProcessoSocorro) REFERENCES ProcessoSocorro(numProcessoSocorro) ON DELETE CASCADE ON UPDATE CASCADE);


CREATE TABLE Alocado (
    numMeio int NOT NULL,
    nomeEntidade VARCHAR(25) NOT NULL,
    numHoras int NOT NULL,
    numProcessoSocorro int NOT NULL,
    FOREIGN KEY(numMeio,nomeEntidade) REFERENCES MeioApoio(numMeio,nomeEntidade) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(numProcessoSocorro) REFERENCES ProcessoSocorro(numProcessoSocorro) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Acciona (
    numMeio int NOT NULL,
    nomeEntidade VARCHAR(25) NOT NULL,
    numProcessoSocorro int NOT NULL,
    FOREIGN KEY(numMeio,nomeEntidade) REFERENCES Meio(numMeio,nomeEntidade) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(numProcessoSocorro) REFERENCES ProcessoSocorro(numProcessoSocorro) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Coordenador (
    idCoordenador int NOT NULL,
    PRIMARY KEY(idCoordenador));

CREATE TABLE Audita(
    idCoordenador int NOT NULL,
    numMeio int NOT NULL,
    nomeEntidade VARCHAR(25) NOT NULL,
    numProcessoSocorro int NOT NULL,
    dataHoraInicio date NOT NULL,
    dataHoraFim date NOT NULL,
    dataAuditoria date NOT NULL,
    texto VARCHAR(500) NOT NULL,
    FOREIGN KEY(numMeio,nomeEntidade,numProcessoSocorro) REFERENCES Acciona(numMeio,nomeEntidade,numProcessoSocorro) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(idCoordenador) REFERENCES Coordenador(idCoordenador) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Solicita(
    idCoordenador int NOT NULL,
    dataHoraInicioVideo date NOT NULL,
    numCamera int NOT NULL,
    dataHoraInicio date NOT NULL,
    dataHoraFim date NOT NULL,
    FOREIGN KEY(idCoordenador) REFERENCES Coordenador(idCoordenador) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(dataHoraInicioVideo) REFERENCES Video(dataHoraInicioVideo) ON DELETE CASCADE ON UPDATE CASCADE);