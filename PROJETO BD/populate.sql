insert into local values ('Arroios');
insert into local values ('Azeitão');
insert into local values ('Benfica');
insert into local values ('Amadora');
insert into local values ('Almada');
insert into local values ('Sintra');
insert into local values ('Algés');
insert into local values ('Oeiras');
insert into local values ('Cascais');
insert into local values ('Rossio');
insert into local values ('Alcochete');

-- Camera

insert into camera values('89056');
insert into camera values('02521');
insert into camera values('24898');
insert into camera values('39476');
insert into camera values('49804');
insert into camera values('91764');
insert into camera values('71918');
insert into camera values('45671');

-- Video

insert into video values ('01/01/2018 10:43:41', '01/01/2018 12:40:32', '89056');
insert into video values ('02/01/2018 02:53:21', '02/01/2018 04:55:12', '02521');
insert into video values ('05/01/2018 01:13:15', '05/01/2018 03:30:50', '24898');
insert into video values ('02/02/2018 11:33:25', '02/02/2018 13:00:19', '39476');
insert into video values ('04/02/2018 12:23:42', '04/02/2018 14:00:01', '49804');
insert into video values ('10/03/2018 08:33:03', '10/03/2018 10:50:49', '91764');
insert into video values ('03/04/2018 10:13:46', '03/04/2018 13:54:30', '71918');
insert into video values ('02/05/2018 18:10:05', '02/05/2018 20:04:53', '45671');

-- SegmentoVideo

insert into segmentoVideo values ('7123', '01/01/2018 00:30:00' ,'01/01/2018 10:43:41', '89056');
insert into segmentoVideo values ('4321', '02/01/2018 00:30:00' ,'02/01/2018 02:53:21', '02521');
insert into segmentoVideo values ('8723', '05/01/2018 00:30:00' ,'05/01/2018 01:13:15', '24898');
insert into segmentoVideo values ('3461', '02/02/2018 00:30:00' ,'02/02/2018 11:33:25', '39476');
insert into segmentoVideo values ('6752', '04/02/2018 00:30:00' ,'04/02/2018 12:23:42', '49804');
insert into segmentoVideo values ('3843', '10/03/2018 00:30:00' ,'10/03/2018 08:33:03', '91764');
insert into segmentoVideo values ('2674', '03/04/2018 00:30:00' ,'03/04/2018 10:13:46', '71918');
insert into segmentoVideo values ('1235', '02/05/2018 00:30:00' ,'02/05/2018 18:10:05', '45671');

--	Vigia

insert into vigia values ('Arroios','89056');
insert into vigia values ('Azeitão','02521');
insert into vigia values ('Benfica','24898');
insert into vigia values ('Oeiras','39476');
insert into vigia values ('Almada','49804');
insert into vigia values ('Cascais','91764');
insert into vigia values ('Algés','71918');
insert into vigia values ('Rossio','45671');


  -- ProcessoSocorro

  insert into processoSocorro values ('001');
  insert into processoSocorro values ('002');
  insert into processoSocorro values ('003');
  insert into processoSocorro values ('004');


-- EventoEmergencia

insert into eventoEmergencia values ('912345678','01/01/2018 10:43:41','Maria Madelena','Cascais','001');
insert into eventoEmergencia values ('912343612','02/01/2018 02:53:21','Carlos Manuel','Algés','0002');
insert into eventoEmergencia values ('913255128','05/01/2018 01:13:15','Isabel Garcia','Azeitão','003');
insert into eventoEmergencia values ('912342412','02/02/2018 11:33:25','Francisco Reis','Arroios','004');
insert into eventoEmergencia values ('965234523','04/02/2018 12:23:42','Tiago Santos','Cascais','001');
insert into eventoEmergencia values ('921351233','05/02/2018 10:20:42','João Torres','Azeitão','002');
insert into eventoEmergencia values ('916134543','10/03/2018 08:33:03','Francisco Santos','Benfica','003');
insert into eventoEmergencia values ('932512344','11/03/2018 09:17:09','Yuri Dagot','Arroios','003');
insert into eventoEmergencia values ('923462112','03/04/2018 10:13:46','Bruno de Carvalho','Alcochete','004');
insert into eventoEmergencia values ('923465234','02/05/2018 18:10:05','Susana Rosa','Sintra','001');


-- Entidade Meio

insert into entidadeMeio values ('Bombeiros');
insert into entidadeMeio values ('Exército');
insert into entidadeMeio values ('Força Aérea');
insert into entidadeMeio values ('Polícia');

-- Meio

insert into meio values ('1','Socorro','Bombeiros');
insert into meio values ('2','Apoio','Força Aérea');
insert into meio values ('3','Combate','Polícia');
insert into meio values ('4','Combate','Exército');

-- MeioSocorro

insert into meioSocorro values ('1', 'Bombeiros');
insert into meioSocorro values ('2', 'Força Aérea');
insert into meioSocorro values ('3', 'Polícia');
insert into meioSocorro values ('4', 'Exército');

-- MeioApoio

insert into meioApoio values ('1', 'Bombeiros');
insert into meioApoio values ('2', 'Força Aérea');
insert into meioApoio values ('3', 'Polícia');
insert into meioApoio values ('4', 'Exército');

-- MeioCombate
insert into meioCombate values ('1', 'Bombeiros');
insert into meioCombate values ('2', 'Força Aérea');
insert into meioCombate values ('4', 'Exército');
insert into meioCombate values ('3','Polícia');


-- Transporta

insert into transporta values ('1','Bombeiros','5','001');
insert into transporta values ('2','Força Aérea','10','002');
insert into transporta values ('3','Polícia','1','003');
insert into transporta values('4','Exército','2','004');

-- Alocado

insert into alocado values ('1','Bombeiros','2','001');
insert into alocado values ('2','Força Aérea','3','002');
insert into alocado values ('3','Polícia','1','003');
insert into alocado values ('4','Exército','2','004');


-- Acciona

insert into acciona values ('1','Bombeiros','001');
insert into acciona values ('2','Força Aérea','002');
insert into acciona values ('3','Polícia','003');
insert into acciona values ('4','Exército','004');

-- Coordenador

insert into coordenador Values ('01');
insert into coordenador Values ('02');
insert into coordenador Values ('03');
insert into coordenador Values ('04');
insert into coordenador Values ('05');



-- Audita

insert into audita Values ('01','1','Bombeiros','001','01/01/2018 10:43:41', '01/01/2018 12:00:00', '01/01/2018 10:43:41', 'texto1');
insert into audita Values ('02','2','Força Aérea','002','02/01/2018 02:53:21', '02/01/2018 04:40:00', '02/01/2018 02:53:21', 'texto2');
insert into audita Values ('03','3','Polícia','003','05/01/2018 01:13:15', '05/01/2018 02:00:00', '05/01/2018 01:13:15', 'texto3');
insert into audita Values ('04','1','Bombeiros','001','04/02/2018 12:23:42', '04/02/2018 16:30:00', '04/02/2018 12:23:42', 'texto4');
insert into audita Values ('05','2','Força Aérea','002','11/03/2018 09:17:00', '11/03/2018 11:30:09', '11/03/2018 09:17:09', 'texto5');

-- Solicita

insert into solicita Values ('01','01/01/2018 10:43:41','89056','01/01/2018 10:43:41', '01/01/2018 10:43:41');
insert into solicita Values ('02','02/01/2018 02:53:21','89056','02/01/2018 02:53:21', '02/01/2018 02:53:21');
insert into solicita Values ('03','05/01/2018 01:13:15','89056','05/01/2018 01:13:15', '05/01/2018 01:13:15');
insert into solicita Values ('04','04/02/2018 12:23:42','89056','04/02/2018 12:23:42', '04/02/2018 12:23:42');
insert into solicita Values ('05','03/04/2018 10:13:46','89056','03/04/2018 10:13:46', '03/04/2018 10:13:46');
