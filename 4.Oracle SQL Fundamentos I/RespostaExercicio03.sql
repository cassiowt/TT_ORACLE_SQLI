/*
1. Inicie uma sessão do SQL Developer.
2. Crie uma consulta para exibir o id e a data de compra (dt_compra) dos contratos
com o total superior a 10000.
*/
 SELECT ct.id, ct.dt_compra, ct.total
 FROM TCONTRATOS ct
 WHERE ct.total > 1000
 order by 3;

/*
3. Crie uma consulta para exibir o nome, endereço, cidade, cep e telefone 
do cliente com o id 140.
*/
SELECT c.nome, c.endereco, c.cidade, c.cep, c.telefone
FROM TCLIENTES c
WHERE c.id = 140;
/* 
4. Crie uma consulta para exibir o id, dt_compra, desconto e total dos contratos
(tabela tcontratos) para todos os contratos cuja total não está 
na faixa de 2000 à 5000.
*/
 SELECT ct.id, ct.dt_compra, ct.DESCONTO, ct.TOTAL
  FROM tcontratos ct
  WHERE  ct.TOTAL not BETWEEN 2000 and 5000;
/*
5. Altere a consulta para selecionar somente os contratos que possuem
desconto maior do que zero. Apresente o resultado em ordem crescente de data de compra.
*/
 SELECT ct.id, ct.dt_compra, ct.DESCONTO, ct.TOTAL
  FROM tcontratos ct
  WHERE ct.TOTAL not BETWEEN 2000 and 5000
 -- AND ct.desconto > 0;
 AND nvl(ct.desconto,0) > 0;
/*
6. Mostre o nome, a cidade e o estado de todos os clientes que possuem estado 
igual a 'RS' ou 'SP' em ordem alfabética.
*/
 SELECT c.NOME, c.CIDADE, c.ESTADO
 FROM tclientes c
 WHERE c.ESTADO in ('RS','SP')
 ORDER BY c.NOME;
/*
7. Crie uma consulta para exibir os contratos sem desconto registrado.
*/
SELECT ct.id, ct.dt_compra, ct.DESCONTO, ct.TOTAL
  FROM tcontratos ct
  WHERE ct.desconto is null;
