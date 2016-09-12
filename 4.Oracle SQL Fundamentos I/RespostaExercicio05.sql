-- Escreva uma consulta para exibir o nome do cliente e 
-- os contratos (id e data de compra) que este cliente possui, 
-- ordene por nome em ordem alfabética.
SELECT c.NOME, ct.ID, ct.DT_COMPRA as "Data da Compra" 
FROM TCLIENTES c
  JOIN TCONTRATOS ct
    ON (c.ID = ct.TCLIENTES_ID);


-- Crie uma lista única de todos os contratos que possuem clientes 
-- com a letra ‘A’ (maiúscula ou minúscula) no nome, 
-- ordene por ordem alfabética. 
SELECT c.NOME, ct.ID, ct.DT_COMPRA as "Data da Compra" 
FROM TCLIENTES c
  JOIN TCONTRATOS ct
    ON (c.ID = ct.TCLIENTES_ID)
WHERE upper(c.NOME) like '%A%' ;

-- Escreva uma consulta para exibir o nome do cliente, id do contrato 
-- e total, para todos os contratos que não possuem desconto 
-- (NULO ou ZERO). 
SELECT c.NOME, ct.ID, ct.TOTAL --, ct.DESCONTO
FROM TCLIENTES c
  JOIN TCONTRATOS ct
    ON (c.ID = ct.TCLIENTES_ID)
WHERE nvl(ct.DESCONTO, 0) = 0;

-- Crie uma consulta que mostre o nome do cliente, o id e 
-- total do contrato, e a classe de desconto para todos 
-- os contratos. Ordene pela classe de desconto. 
SELECT c.NOME, ct.ID, ct.TOTAL, d.CLASSE
FROM TDESCONTOS d, TCLIENTES c
  JOIN TCONTRATOS ct
    ON (c.ID = ct.TCLIENTES_ID)
WHERE nvl(ct.DESCONTO, 0) BETWEEN d.BASE_INFERIOR
                              AND d.BASE_SUPERIOR; 

-- Mostre o id, o código e a data de criação do curso e o id, 
-- o código e a data de criação do seu curso pre_requisito 
-- do mesmo para todos os cursos. 
SELECT c.ID, c.COD_TRG, c.DT_CRIACAO, p.id, p.COD_TRG, p.DT_CRIACAO
FROM TCURSOS c
  JOIN TCURSOS p
    ON (c.PRE_REQUISITO = p.ID)
WHERE c.PRE_REQUISITO is not null
ORDER BY 2;
