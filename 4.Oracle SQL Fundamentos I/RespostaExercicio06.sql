-- 1. Funções de grupo atuam sobre muitas linhas para produzir uma
-- única linha para cada grupo formado?
'SIM' 

-- 2. Funções de grupo incluem nulos nos cálculos?
'Todas as funções ignoram o valor NULL exceto a Count()'


-- 3. Mostre o maior, o menor, a soma e a média do total de 
-- todos os contratos. Coloque o alias das colunas 
-- como "Máximo", "Mínimo", "Soma" e "Média". 
-- Arredonde os resultados com zero dígitos decimais. 
SELECT ROUND(MAX(ct.TOTAL),2) "Máximo"
,      ROUND(MIN(ct.TOTAL),2) "Mínimo"
,      ROUND(SUM(ct.TOTAL),2) "Mínimo"
,      ROUND(AVG(ct.TOTAL),2) "Média"
FROM TCONTRATOS ct;

-- 4. Modifique a consulta anteriorr para exibir o menor, o maior, 
-- a soma e a média do total para cada estado. 
SELECT c.ESTADO
,      ROUND(MAX(ct.TOTAL),2) "Máximo" 
,      ROUND(MIN(ct.TOTAL),2) "Máximo"
,      ROUND(SUM(ct.TOTAL),2) "Mínimo"
,      ROUND(AVG(ct.TOTAL),2) "Média"
FROM TCONTRATOS ct 
  JOIN TCLIENTES c
    ON (ct.TCLIENTES_ID = c.ID)
GROUP BY c.ESTADO;

-- 5. Escreva uma consulta que mostre a diferença entre o maior e 
-- menor contrato. Coloque o alias da coluna como “DIFERENÇA”. 
SELECT ROUND(MAX(ct.TOTAL),2) "Máximo"
,      ROUND(MIN(ct.TOTAL),2) "Mínimo"
,      ROUND(MAX(ct.TOTAL)-MIN(ct.TOTAL),2) "DIFERENÇA"
FROM TCONTRATOS ct;

-- 6. Escreva uma consulta para exibir o estado, o número de 
-- contratos e a média do total de contratos para todos os 
-- clientes daquele estado. Coloque os alias de coluna como “UF”, 
-- “CONTRATOS”, “MÉDIA”, respectivamente. 
SELECT c.ESTADO "UF"
,      COUNT(ct.ID) "Contratos" 
,      TO_CHAR(ROUND(AVG(ct.TOTAL),2),'L999G999D00') "Média"
FROM TCONTRATOS ct 
  JOIN TCLIENTES c
    ON (ct.TCLIENTES_ID = c.ID)
GROUP BY c.ESTADO;
