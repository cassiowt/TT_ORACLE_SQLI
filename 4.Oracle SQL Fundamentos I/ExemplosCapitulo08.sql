-- lista clientes com o valor do contrato maior que o maior valor de contrato 
-- do cliente de id 110
SELECT
    tc.id contrato,
    c.nome,
    total
FROM
    tcontratos tc,
    tclientes c
WHERE
        tc.tclientes_id = c.id
    AND
        total > (
            SELECT
                MAX(total)
            FROM
                tcontratos
            WHERE
                tclientes_id = 110
        )
ORDER BY 2;

-- Lista todos os clientes que tenham o mesmo estafo do cliente 100
-- e que o mes de nacimento seja o mesmo do cliente 130
SELECT	id, nome  --, to_char(DT_NASCIMENTO, 'yyyy-MON') AnoMes, ESTADO
   FROM	tclientes
WHERE	estado =
	( SELECT estado
	  FROM   tclientes
	  WHERE  id = 100)
AND	TO_CHAR(dt_nascimento,'MON') =
	( SELECT TO_CHAR(dt_nascimento,'MON')
	  FROM   tclientes
	  WHERE  id = 130);
      
-- Lista todos os contratos que estão acima da Media   
SELECT	id, dt_compra, desconto, total
FROM	tcontratos
WHERE	total >
	( SELECT AVG(total)
	  FROM   tcontratos);   
 
 -- Lista a média da compra por data em que estas foram maior que média total de 
 -- compras
SELECT dt_compra, AVG(total)
FROM   tcontratos
GROUP  BY  dt_compra
HAVING AVG(total) >
       (SELECT AVG(total)
         FROM   tcontratos);     
      --GROUP  BY dt_compra);
      
-- Lista o preço dos  cursos que que tenha o menor preço por carga horaria.      
SELECT	id, cod_trg, preco
FROM	tcursos
WHERE	preco IN 
            (SELECT MIN(preco)
   	 FROM   tcursos
  	 GROUP  BY carga_horaria); 

-- Lista os contratos cujo total é maior que o total de qualquer contrato do 
-- dia ‘04/01/2005’.  (4500, 1800, 1995)  
SELECT	id, dt_compra, desconto, total
FROM	tcontratos
WHERE	total > ANY 
	( SELECT total
	  FROM   tcontratos
	  WHERE  dt_compra = to_date('04/01/2005', 'DD/MM/YYYY'));

-- Lista os contratos cujo total é maior todos os  totais de  contratos do 
-- dia ‘04/01/2005’.  (4500, 1800, 1995)       
SELECT	id, dt_compra, desconto, total
FROM	tcontratos
WHERE	total > ALL
	(SELECT total
	 FROM   tcontratos
	 WHERE  dt_compra =    to_date('04/01/2005', 'DD/MM/YYYY'));      
     
-- Lista os contratos que tem   total X com desconto 60 
SELECT	id, dt_compra, desconto, total 
FROM	tcontratos
WHERE	(total, NVL(desconto,0)) IN
	( SELECT total, 60
	  FROM   tcontratos
	  WHERE  total < 3000);    
      

-- Monta uma tabela temporaria baseada em uma sub consulta, onde obtemos a MEDIA
-- agrupando pela data da compra
-- Após listamos os contratos onde o total está acima da MEDIA.
SELECT tcn1.id, tcn1.dt_compra, tcn1.total, trunc(sub.MEDIA,2)
FROM tcontratos tcn1, 
    ( SELECT dt_compra, AVG(total) MEDIA
        FROM   tcontratos tcn2
       GROUP  BY dt_compra) sub
WHERE tcn1.dt_compra = sub.dt_compra
AND   tcn1.total > sub.media;


