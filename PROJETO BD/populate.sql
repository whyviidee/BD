insert into Local values ('Arroios');
insert into Local values ('Azeitão');
insert into Local values ('Benfica');
insert into Local values ('Amadora');
insert into Local values ('Almada');
insert into Local values ('Sintra');
insert into Local values ('Algés');
insert into Local values ('Oeiras');
insert into Local values ('Cascais');
insert into Local values ('Rossio');
insert into Local values ('Alcochete');	

-- Camera

insert into Camera values('89056');
insert into Camera values('02521');
insert into Camera values('24898');
insert into Camera values('39476');
insert into Camera values('49804');
insert into Camera values('91764');
insert into Camera values('71918');
insert into Camera values('45671');

-- Video

insert into Video values ('01/01/2018 10:43:41', '01/01/2018 12:40:32', '89056');
insert into Video values ('02/01/2018 02:53:21', '02/01/2018 04:55:12', '02521');
insert into Video values ('05/01/2018 01:13:15', '05/01/2018 03:30:50', '24898');
insert into Video values ('02/02/2018 11:33:25', '02/02/2018 13:00:19', '39476');
insert into Video values ('04/02/2018 12:23:42', '04/02/2018 14:00:01', '49804');
insert into Video values ('10/03/2018 08:33:03', '10/03/2018 10:50:49', '91764');
insert into Video values ('03/04/2018 10:13:46', '03/04/2018 13:54:30', '71918');
insert into Video values ('02/05/2018 18:10:05', '02/05/2018 20:04:53', '45671');

-- SegmentoVideo

insert into SegmentoVideo values ('7123', '00:30:00' ,'01/01/2018 10:43:41', '89056');
insert into SegmentoVideo values ('4321', '00:30:00' ,'02/01/2018 02:53:21', '02521');
insert into SegmentoVideo values ('8723', '00:30:00' ,'05/01/2018 01:13:15', '24898');
insert into SegmentoVideo values ('3461', '00:30:00' ,'02/02/2018 11:33:25', '39476');
insert into SegmentoVideo values ('6752', '00:30:00' ,'04/02/2018 12:23:42', '49804');
insert into SegmentoVideo values ('3843', '00:30:00' ,'10/03/2018 08:33:03', '91764');
insert into SegmentoVideo values ('2674', '00:30:00' ,'03/04/2018 10:13:46', '71918');
insert into SegmentoVideo values ('1235', '00:30:00' ,'02/05/2018 18:10:05', '45671');

--	Vigia

insert into Vigia values ('Arroios','89056');
insert into Vigia values ('Azeitão','02521');
insert into Vigia values ('Benfica','24898');
insert into Vigia values ('Oeiras','39476');
insert into Vigia values ('Almada','49804');
insert into Vigia values ('Cascais','91764');
insert into Vigia values ('Algés','71918');
insert into Vigia values ('Rossio','45671');

-- EventoEmergencia

insert into EventoEmergencia values ('912345678','01/01/2018 10:43:41','Maria Madelena','Lisboa','001');
insert into EventoEmergencia values ('912343612','02/01/2018 02:53:21','Carlos Manuel','Algés','0002');
insert into EventoEmergencia values ('913255128','05/01/2018 01:13:15','Isabel Garcia','Azeitão','003');
insert into EventoEmergencia values ('912342412','02/02/2018 11:33:25','Francisco Reis','Lisboa','004');
insert into EventoEmergencia values ('965234523','04/02/2018 12:23:42','Tiago Santos','Cascais','001');
insert into EventoEmergencia values ('921351233','05/02/2018 10:20:42','João Torres','Azeitão','002');
insert into EventoEmergencia values ('916134543','10/03/2018 08:33:03','Francisco Santos','Benfica','003');
insert into EventoEmergencia values ('932512344','11/03/2018 09:17:09','Yuri Dagot','Arroios','003');
insert into EventoEmergencia values ('923462112','03/04/2018 10:13:46','Bruno de Carvalho','Alcochete','004');
insert into EventoEmergencia values ('923465234','02/05/2018 18:10:05','Susana Rosa','Sintra','001');

-- ProcessoSocorro

insert into ProcessoSocorro values ('001');
insert into ProcessoSocorro values ('002');
insert into ProcessoSocorro values ('003');
insert into ProcessoSocorro values ('004');

-- Entidade Meio

insert into EntidadeMeio values ('Bombeiros');
insert into EntidadeMeio values ('Exército');
insert into EntidadeMeio values ('Força Aérea');
insert into EntidadeMeio values ('Polícia');

-- Meio

insert into Meio values ('1','Socorro','Bombeiros');
insert into Meio values ('2','Apoio','Força Aérea');
insert into Meio values ('3','Combate','Exército');
insert into Meio values ('4','Combate','Polícia');

-- MeioSocorro

insert into MeioSocorro values ('1', 'Bombeiros');

-- MeioApoio

insert into MeioApoio values ('2', 'Força Aérea');

-- MeioCombate

insert into MeioCombate values ('3', 'Exército');
insert into MeioCombatet values ('3','Polícia');

-- Transporta

insert into Transporta values ('1','Bombeiros','5','001');
insert into Transporta values ('2','Exército','10','002');
insert into Transporta values ('3','Polícia','1','003');

-- Alocado

insert into Alocado values ('1','Bombeiros','2','001');
insert into Alocado values ('2','Exército','3','002');
insert into Alocado values ('3','Polícia','1','003');

-- Acciona

insert into Acciona values ('1','Bombeiros','001');
insert into Acciona values ('2','Exército','002');
insert into Acciona values ('3','Polícia','003');

-- Coordenador

insert into Coordenador Values ('01');
insert into Coordenador Values ('02');
insert into Coordenador Values ('03');
insert into Coordenador Values ('04');
insert into Coordenador Values ('05');

-- Audita

insert into Audita Values ('01','1','Bombeiros','001','01/01/2018 10:43:41', '01/01/2018 12:00:00', '01/01/2018 10:43:41', texto);
insert into Audita Values ('02','2','Exército','002','02/01/2018 02:53:21', '02/01/2018 04:40:00', '02/01/2018 02:53:21', texto);
insert into Audita Values ('03','3','Polícia','003','05/01/2018 01:13:15', '05/01/2018 02:00:00', '05/01/2018 01:13:15', texto);
insert into Audita Values ('04','1','Bombeiros','001','04/02/2018 12:23:42', '04/02/2018 16:30:00', '04/02/2018 12:23:42', texto);
insert into Audita Values ('05','2','Exército','002','11/03/2018 09:17:00', '11/03/2018 11:30:09', '11/03/2018 09:17:09', texto);
insert into Audita Values ('06','4','Força Aérea','004','03/04/2018 10:13:46', '03/04/2018 15:00:00', '03/04/2018 10:13:46', texto);

-- Solicita

insert into Solicita Values ('01','01/01/2018 10:43:41','89056','01/01/2018 10:43:41', '01/01/2018 10:43:41');
insert into Solicita Values ('02','02/01/2018 02:53:21','89056','02/01/2018 02:53:21', '02/01/2018 02:53:21');
insert into Solicita Values ('03','05/01/2018 01:13:15','89056','05/01/2018 01:13:15', '05/01/2018 01:13:15');
insert into Solicita Values ('04','04/02/2018 12:23:42','89056','04/02/2018 12:23:42', '04/02/2018 12:23:42');
insert into Solicita Values ('05','11/03/2018 09:17:00','89056','11/03/2018 09:17:00', '11/03/2018 09:17:00');
insert into Solicita Values ('06','03/04/2018 10:13:46','89056','03/04/2018 10:13:46', '03/04/2018 10:13:46');

