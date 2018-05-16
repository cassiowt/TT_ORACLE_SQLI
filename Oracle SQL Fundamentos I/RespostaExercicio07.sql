-- Escreva uma consulta para exibir o nome dos clientes e a 
-- data de nascimento para todos os clientes que estão no mesmo estado 
-- do cliente ‘Mário Cardoso’, excluindo-o do resultado.
SELECT c.NOME , c.DT_NASCIMENTO FROM TCLIENTES c
WHERE c.ESTADO =  (
  SELECT cmario.ESTADO FROM TCLIENTES cmario
  WHERE cmario.nome = 'Mário Cardoso')
AND c.nome != 'Mário Cardoso';

-- Crie uma consulta para exibir o id e o total do contrato, 
-- o nome do cliente responsável pelo contrato para todos os contratos 
-- com total maior que a média do total de contratos. 
-- Classifique o resultado em ordem descendente de total.
SELECT c.NOME , ct.ID, to_char(sum(ct.TOTAL), '999G999D99') 
FROM TCONTRATOS ct
  JOIN TCLIENTES c
    ON (ct.TCLIENTES_ID = c.ID)
WHERE ct.TOTAL > (
      SELECT avg(ctmedia.TOTAL)
      FROM TCONTRATOS ctmedia);

--GROUP BY c.NOME, ct.ID;


-- Escreva uma consulta que mostre o id e o nome do cliente para 
-- todos os clientes que são de um estado com qualquer cliente cujo 
-- nome contenha uma letra ‘v’ (minúscula).  
SELECT c.ID, c.NOME, c.ESTADO FROM TCLIENTES c
WHERE c.ESTADO IN  (
  SELECT cnomev.ESTADO FROM TCLIENTES cnomev
  WHERE cnomev.nome like '%v%');

-- Mostre o código Target e o preço dos cursos com pré-requisito 
-- o cod_trg  ‘THTML4’.
SELECT c.COD_TRG, c.PRECO 
FROM TCURSOS c
WHERE c.PRE_REQUISITO IN(
        SELECT c1.ID
        FROM TCURSOS c1
        WHERE c1.COD_TRG = 'THTML4');

-- Mostre o nome e o telefone de todos os clientes que compraram 
-- no dia ‘06/01/2005’. 
SELECT c.NOME, c.TELEFONE
FROM TCLIENTES c
WHERE c.ID in (
    SELECT ct.TCLIENTES_ID FROM TCONTRATOS ct
    WHERE ct.DT_COMPRA = '06/01/2005');
    
SELECT c.NOME, c.TELEFONE
FROM TCLIENTES c
 JOIN TCONTRATOS ct
   ON (c.ID = ct.TCLIENTES_ID )
WHERE ct.DT_COMPRA = '06/01/2005';


