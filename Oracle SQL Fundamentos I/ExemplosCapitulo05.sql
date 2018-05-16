SELECT * FROM TCLIENTES;
SELECT * FROM TCONTRATOS;

SELECT  tcontratos.id, tcontratos.dt_compra, tcontratos.total,
        tclientes.id cliente, tclientes.nome
FROM    tclientes
        JOIN tcontratos 
             ON (tclientes.id = tcontratos.tclientes_id);


INSERT INTO "CASSIO"."TCLIENTES" (ID, NOME, DT_NASCIMENTO, ENDERECO, CIDADE, ESTADO, CEP, TELEFONE) 
VALUES ('210', 'Cassio', TO_DATE('1970-05-07 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'Frei Clemente', 'Porto Alegre ', 'RS', '9967724 ', '111 ');             
             
SELECT  tcontratos.id, tcontratos.dt_compra, tcontratos.total,
        tclientes.id cliente, tclientes.nome
FROM    tclientes
        FULL OUTER JOIN tcontratos 
             ON (tclientes.id = tcontratos.tclientes_id)
WHERE   tcontratos.id IS NULL
   OR   tclientes.id IS NULL;
   
   
SELECT  tcontratos.id, tcontratos.dt_compra, tcontratos.total,
        tclientes.id cliente, tclientes.nome
FROM    tclientes
        FULL OUTER JOIN tcontratos 
             ON (tclientes.id = tcontratos.tclientes_id);
             
             
SELECT	co.id CONTRATO, co.desconto,
         de.classe, de.base_inferior, de.base_superior
FROM	tcontratos co, tdescontos de
WHERE	NVL(co.desconto,0) BETWEEN de.base_inferior 
                              AND de.base_superior;
 