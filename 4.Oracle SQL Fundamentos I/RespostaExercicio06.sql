-- 1. Fun��es de grupo atuam sobre muitas linhas para produzir uma
-- �nica linha para cada grupo formado?
'SIM' 

-- 2. Fun��es de grupo incluem nulos nos c�lculos?
'Todas as fun��es ignoram o valor NULL exceto a Count()'


-- 3. Mostre o maior, o menor, a soma e a m�dia do total de 
-- todos os contratos. Coloque o alias das colunas 
-- como "M�ximo", "M�nimo", "Soma" e "M�dia". 
-- Arredonde os resultados com zero d�gitos decimais. 
SELECT ROUND(MAX(ct.TOTAL),2) "M�ximo"
,      ROUND(MIN(ct.TOTAL),2) "M�nimo"
,      ROUND(SUM(ct.TOTAL),2) "M�nimo"
,      ROUND(AVG(ct.TOTAL),2) "M�dia"
FROM TCONTRATOS ct;

-- 4. Modifique a consulta anteriorr para exibir o menor, o maior, 
-- a soma e a m�dia do total para cada estado. 
SELECT c.ESTADO
,      ROUND(MAX(ct.TOTAL),2) "M�ximo" 
,      ROUND(MIN(ct.TOTAL),2) "M�ximo"
,      ROUND(SUM(ct.TOTAL),2) "M�nimo"
,      ROUND(AVG(ct.TOTAL),2) "M�dia"
FROM TCONTRATOS ct 
  JOIN TCLIENTES c
    ON (ct.TCLIENTES_ID = c.ID)
GROUP BY c.ESTADO;

-- 5. Escreva uma consulta que mostre a diferen�a entre o maior e 
-- menor contrato. Coloque o alias da coluna como �DIFEREN�A�. 
SELECT ROUND(MAX(ct.TOTAL),2) "M�ximo"
,      ROUND(MIN(ct.TOTAL),2) "M�nimo"
,      ROUND(MAX(ct.TOTAL)-MIN(ct.TOTAL),2) "DIFEREN�A"
FROM TCONTRATOS ct;

-- 6. Escreva uma consulta para exibir o estado, o n�mero de 
-- contratos e a m�dia do total de contratos para todos os 
-- clientes daquele estado. Coloque os alias de coluna como �UF�, 
-- �CONTRATOS�, �M�DIA�, respectivamente. 
SELECT c.ESTADO "UF"
,      COUNT(ct.ID) "Contratos" 
,      TO_CHAR(ROUND(AVG(ct.TOTAL),2),'L999G999D00') "M�dia"
FROM TCONTRATOS ct 
  JOIN TCLIENTES c
    ON (ct.TCLIENTES_ID = c.ID)
GROUP BY c.ESTADO;
