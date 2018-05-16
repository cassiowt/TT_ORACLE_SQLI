-- Union e Union All
select tab.total from 
   (
      SELECT 1 xx, id, dt_compra, desconto, total
      FROM   tcontratos
      WHERE  dt_compra = '10/01/05'
    UNION  ALL
      SELECT 2 xx, id, dt_compra, desconto, total
      FROM   tcontratos
      WHERE  desconto IS NOT NULL
    UNION
      SELECT 3 xx, id, dt_compra, desconto, total
      FROM   tcontratos
      WHERE  total > 4000
      ORDER  BY 1
  ) tab
where xx = 2;

-- Intersect
SELECT id, dt_compra, desconto, total
FROM   tcontratos
WHERE  desconto IS NOT NULL
INTERSECT
SELECT id, dt_compra, desconto, total
FROM   tcontratos
WHERE  total > 4000
ORDER  BY 1;

-- Minus
SELECT id, dt_compra, desconto, total
FROM   tcontratos
WHERE  dt_compra = '10/01/05'
MINUS
SELECT id, dt_compra, desconto, total
FROM   tcontratos
WHERE  desconto IS NOT NULL;

SELECT id, dt_compra, desconto, total
FROM   tcontratos
WHERE  desconto IS NOT NULL
MINUS
SELECT id, dt_compra, desconto, total
FROM   tcontratos
WHERE  total > 4000
ORDER  BY 1;

SELECT id, dt_compra, desconto, total
FROM   tcontratos
WHERE  desconto IS NOT NULL
MINUS
SELECT id, dt_compra, desconto, total
FROM   tcontratos
WHERE  dt_compra = '10/01/05';



select cast(1111231 as VARCHAR2(10)) as "CONTRATOS"  from dual;


select to_char(cast(1111231 as VARCHAR2(10)), '/C99999999') from dual;

