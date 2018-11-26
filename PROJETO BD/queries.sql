// FAZ PARTE DO PROJETO ANTIFO


#a)
SELECT espaco.*
FROM espaco
LEFT JOIN aluga
ON (espaco.codigo=aluga.codigo AND espaco.morada=aluga.morada)
WHERE aluga.codigo IS NULL;

#b)
SELECT morada
FROM aluga GROUP BY morada
HAVING COUNT(morada) > (SELECT AVG(result.contador)
                        FROM (SELECT COUNT(morada) contador
                              FROM aluga
                              GROUP BY morada) result);

#c)
SELECT nif, nome, telefone
FROM (SELECT *
      FROM user
      NATURAL JOIN arrenda
      NATURAL JOIN fiscaliza
      GROUP BY nif, id) result
GROUP BY nif
HAVING COUNT(nif) = 1;

#d)
SELECT  morada, codigo, SUM(pago) total_pago
FROM (SELECT morada, codigo_espaco as codigo, data_inicio, data_fim, tarifa * (data_fim - data_inicio + 1) pago 
      FROM aluga
      NATURAL JOIN oferta
      NATURAL JOIN paga
      NATURAL JOIN posto
      WHERE YEAR(data_inicio) = 2016 AND YEAR(data_fim) = 2016

      UNION   ALL
      
      SELECT morada, codigo, data_inicio, data_fim, tarifa * (data_fim - data_inicio + 1) pago
      FROM aluga
      NATURAL JOIN oferta
      NATURAL JOIN paga
      NATURAL JOIN espaco
      WHERE YEAR(data_inicio) = 2016 AND YEAR(data_fim) = 2016) result
GROUP BY codigo, morada
ORDER BY codigo;

#e)
SELECT espaco.morada, espaco.codigo
FROM espaco
LEFT JOIN posto
ON (espaco.morada = posto.morada AND espaco.codigo = posto.codigo_espaco)
LEFT JOIN (SELECT result.codigo, result.morada, estado
           FROM estado
           INNER JOIN (SELECT  alugavel.*, MAX(time_stamp) maximo
                       FROM estado
                       NATURAL JOIN aluga
                       NATURAL JOIN oferta
                       NATURAL JOIN alugavel
                       GROUP BY codigo
                       ORDER BY codigo) result
           ON estado.time_stamp = result.maximo
           WHERE (estado = 'Paga' OR estado = 'Aceite')) result
ON (result.codigo = posto.codigo AND result.morada = posto.morada)
GROUP BY espaco.codigo
HAVING (BIT_AND(IF(ISNULL(result.estado), FALSE, TRUE)) = TRUE);
