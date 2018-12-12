#1)
SELECT numprocessosocorro  
FROM alocado 
WHERE nummeio >= ALL 
  (SELECT nummeio FROM alocado);




#2)

SELECT DISTINCT nomeentidade
FROM entidademeio
NATURAL JOIN eventoemergencia
WHERE (instantechamada >= '2018/06/21 00:00:00' and instantechamada <= '2018/09/21 23:59:59')
  and numprocessosocorro >= ALL
    (SELECT numprocessosocorro FROM entidademeio NATURAL JOIN eventoemergencia);





#3)
SELECT numprocessosocorro
FROM (SELECT acciona.*
FROM acciona
LEFT JOIN audita ON (acciona.numprocessosocorro = audita.numprocessosocorro)
WHERE audita.numprocessosocorro IS NULL) AS DP
NATURAL JOIN eventoemergencia
WHERE(instantechamada >= '2018/01/01 00:00:00' 
  and instantechamada <= '2018/12/31 23:59:59' 
  and moradalocal = 'Oliveira do Hospital');





#4)
SELECT COUNT(numsegmento) 
FROM segmentovideo 
NATURAL JOIN vigia 
WHERE 
  (duracao > '00:01:00' and 
    moradalocal = 'Monchique' and 
    datahorainiciovideo >='2018/08/01 00:00:00' and 
    datahorainiciovideo <= '2018/08/31 23:58:59');




#5)

SELECT meiocombate.* 
FROM meiocombate 
LEFT JOIN meioapoio 
ON (meiocombate.nummeio = meioapoio.nummeio) 
WHERE meioapoio.nummeio IS NULL;



#6)

SELECT nomeentidade
FROM meiocombate
NATURAL JOIN acciona;

