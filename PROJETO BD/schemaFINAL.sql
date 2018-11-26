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
DROP TABLE IF EXISTS ProcessoSocorro;
DROP TABLE IF EXISTS EventoEmergencia;
DROP TABLE IF EXISTS Vigia;
DROP TABLE IF EXISTS Local;
DROP TABLE IF EXISTS SegmentoVideo;
DROP TABLE IF EXISTS Video;
DROP TABLE IF EXISTS Camera;


CREATE TABLE Camera (
    numCamera int NOT NULL unique,
    PRIMARY KEY(numCamera));
    

CREATE TABLE Video (
    dataHoraInicio date NOT NULL,
    dataHoraFim date NOT NULL,
    numCamera int NOT NULL,
    PRIMARY KEY(dataHoraInicio),
    FOREIGN KEY(numCamera) REFERENCES Camera(numCamera) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE SegmentoVideo (
    numSegmento int NOT NULL,
    duracao int NOT NULL,
    dataHoraInicio date NOT NULL,
    numCamera int NOT NULL,
    PRIMARY KEY(numSegmento),
    FOREIGN KEY(dataHoraInicio,numCamera) REFERENCES Video(dataHoraInicio,numCamera) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Local (
    moradaLocal VARCHAR(255) NOT NULL,
    PRIMARY KEY(moradaLocal));

CREATE TABLE Vigia (
    moradaLocal VARCHAR(255) NOT NULL,
    numCamera int NOT NULL,
    FOREIGN KEY(moradaLocal) REFERENCES Local (moradaLocal) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(numCamera) REFERENCES Video(numCamera) ON DELETE CASCADE ON UPDATE CASCADE);


CREATE TABLE EventoEmergencia (
    numTelefone int NOT NULL,
    instanteChamada timestamp NOT NULL,
    nomePessoa VARCHAR(80) NOT NULL,
    moradaLocal VARCHAR(255) NOT NULL,
    numProcessoSocorro int NOT NULL,
    PRIMARY KEY(numTelefone,instanteChamada),
    FOREIGN KEY(moradaLocal) REFERENCES Local (moradaLocal) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(numProcessoSocorro) REFERENCES ProcessoSocorro(numProcessoSocorro) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE ProcessoSocorro (
    numProcessoSocorro int NOT NULL,
    PRIMARY KEY(numProcessoSocorro));

CREATE TABLE EntidadeMeio (
    nomeEntidade VARCHAR(25) NOT NULL,
    PRIMARY KEY(nomeEntidade));
    
CREATE TABLE Meio (
    numMeio int NOT NULL,
    nomeMeio VARCHAR(25) NOT NULL,
    nomeEntiade VARCHAR(25) NOT NULL,
    PRIMARY KEY(numMeio),
    FOREIGN KEY(nomeEntiade) REFERENCES EntidadeMeio(nomeEntiade) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE MeioCombate (
    numMeio int NOT NULL,
    nomeEntiade VARCHAR(25) NOT NULL,
    FOREIGN KEY(numMeio,nomeEntiade) REFERENCES Meio(numMeio,nomeEntiade) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE MeioApoio (
    numMeio int NOT NULL,
    nomeEntiade VARCHAR(25) NOT NULL,
    FOREIGN KEY(numMeio,nomeEntiade) REFERENCES Meio(numMeio,nomeEntiade) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE MeioSocorro(
    numMeio int NOT NULL,
    nomeEntiade VARCHAR(25) NOT NULL,
    FOREIGN KEY(numMeio,nomeEntiade) REFERENCES Meio(numMeio,nomeEntiade) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Transporta (
    numMeio int NOT NULL,
    nomeEntiade VARCHAR(25) NOT NULL,
    numVitimas int NOT NULL,
    numProcessoSocorro int NOT NULL,
    FOREIGN KEY(numMeio,nomeEntiade) REFERENCES MeioSocorro(numMeio,nomeEntiade) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(numProcessoSocorro) REFERENCES ProcessoSocorro(numProcessoSocorro) ON DELETE CASCADE ON UPDATE CASCADE);


CREATE TABLE Alocado (
    numMeio int NOT NULL,
    nomeEntiade VARCHAR(25) NOT NULL,
    numHoras int NOT NULL,
    numProcessoSocorro int NOT NULL,
    FOREIGN KEY(numMeio,nomeEntiade) REFERENCES MeioSocorro(numMeio,nomeEntiade) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(numProcessoSocorro) REFERENCES ProcessoSocorro(numProcessoSocorro) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Acciona (
    numMeio int NOT NULL,
    nomeEntiade VARCHAR(25) NOT NULL,
    numProcessoSocorro int NOT NULL,
    FOREIGN KEY(numMeio,nomeEntiade) REFERENCES MeioSocorro(numMeio,nomeEntiade) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(numProcessoSocorro) REFERENCES ProcessoSocorro(numProcessoSocorro) ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE Coordenador (
    idCoordenador int NOT NULL,
    PRIMARY KEY(idCoordenador));

CREATE TABLE Audita(
    idCoordenador int NOT NULL,
    numMeio int NOT NULL,
    nomeEntiade VARCHAR(25) NOT NULL,
    numProcessoSocorro int NOT NULL,
    datahoraInicio date NOT NULL,
    datahoraFim date NOT NULL,
    dataAuditoria date NOT NULL,
    texto VARCHAR(500) NOT NULL,
    FOREIGN KEY(numMeio,nomeEntiade,numProcessoSocorro) REFERENCES Acciona(numMeio,nomeEntiade,numProcessoSocorro) ON DELETE CASCADE ON UPDATE,
    FOREIGN KEY(idCoordenador) REFERENCES Coordenador(idCoordenador) ON DELETE CASCADE ON UPDATE);

CREATE TABLE Solicita(
    idCoordenador int NOT NULL,
    dataHoraInicioVideo date NOT NULL,
    numCamera int NOT NULL,
    dataHoraInicio date NOT NULL,
    dataHoraFim date NOT NULL,
    FOREIGN KEY(idCoordenador) REFERENCES Coordenador(idCoordenador) ON DELETE CASCADE ON UPDATE),
    FOREIGN KEY(dataHoraInicioVideo) REFERENCES Video(dataHoraInicioVideo) ON DELETE CASCADE ON UPDATE);






