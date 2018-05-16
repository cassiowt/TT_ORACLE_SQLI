/*
Crie uma express�o UNION que represente a uni�o dos totais 
de cada contrato e das somas dos itens de contrato. 
No primeiro SELECT selecione o c�digo do contrato, o valor total de 
todos os contratos e a string fixa definida por �CONTRATOS�. 
No segundo SELECT selecione o c�digo do contrato, todas as somas 
do total de cada item deste contrato e a string fixa �ITENS�. 
Ordene pela terceira coluna e depois pela primeira. 
Defina os alias nos dois SELECTs como ID, TOTAL e STRING
*/
SELECT ct.ID "Id", ct.TOTAL "Total", 'CONTRATOS' "String" 
FROM TCONTRATOS ct
UNION
SELECT i.TCONTRATOS_ID,
  SUM(i.TOTAL),
  'ITENS'
FROM TITENS i
GROUP BY i.TCONTRATOS_ID,
  'ITENS'
ORDER BY 1,3 ;

/*
Crie um script para a opera��o de subtra��o (MINUS) entre dois 
SELECTs e a intersec��o(INTERSECT) com um terceiro SELECT. 
No primeiro SELECT selecione ID, DT_COMPRA e TOTAL de todos os contratos. 
No segundo SELECT selecione ID, DT_COMPRA e TOTAL de todos os contratos 
sem desconto (NULO ou ZERO). Subtraia o primeiro pelo segundo. 
No terceiro SELECT selecione ID, DT_COMPRA e TOTAL dos contratos 
realizados com clientes de SP. Execute a consulta.
*/
SELECT ct.ID, 
  ct.DT_COMPRA, 
  ct.TOTAL 
FROM TCONTRATOS ct
MINUS
SELECT ct.ID,
  ct.DT_COMPRA ,
  ct.TOTAL
FROM TCONTRATOS ct
WHERE NVL(ct.DESCONTO,0) = 0
INTERSECT
SELECT ct.ID,
  ct.DT_COMPRA ,
  ct.TOTAL
FROM TCONTRATOS ct
JOIN TCLIENTES c
ON (ct.TCLIENTES_ID = c.ID)
WHERE c.ESTADO      = 'SP';
