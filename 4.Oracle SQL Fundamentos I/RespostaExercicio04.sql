--Escreva uma consulta para exibir a data atual no
-- formato ‘DD/MM/YYYY HH24:MI:SS’. Coloque o alias de coluna como “Data”. 
SELECT to_char(sysdate, 'DD/MM/YYYY HH24:MI:SS') FROM dual;

--Mostre o id do curso, o código Target (cod_trg), o preço e o preço 
--com um aumento de 15%. Selecione somente os cursos que possuam o 
--número 1 em qualquer parte do id. 
--Coloque o alias da coluna como “Novo Preço”.   
SELECT cr.id
,      cr.COD_TRG
,      cr.PRECO
,      cr.PRECO * 1.15 as "Novo Preço"
FROM TCURSOS cr
where cr.ID like '%1%';

--Altere a consulta anterior para adicionar uma nova coluna que subtraia 
--o  novo preço do preço antigo. Coloque o alias da coluna como “Aumento”. 
SELECT cr.id
,      cr.COD_TRG
,      cr.PRECO
,      cr.PRECO * 1.15 as "Novo Preço"
,     (cr.PRECO * 1.15) - cr.PRECO "Aumento"
FROM TCURSOS cr
where cr.ID like '%1%';

--Mostre o nome de cada cliente e calcule o número de meses entre a 
--data atual e a data de nascimento. Coloque o alias da coluna 
--como “Meses de Vida”. Ordene o resultado pelo número de meses. 
--Arredonde o número de meses para o número inteiro mais próximo. 
SELECT c.NOME
,      round((sysdate-c.DT_NASCIMENTO)/30)  "Meses de vida"
,      round(MONTHS_BETWEEN(sysdate,c.DT_NASCIMENTO)) "Meses de vida II"
FROM TCLIENTES c
order by 2;

--Crie uma consulta para exibir o código Target e o preço de todos 
--os cursos. Formate o preço para exibir como R$1.000,00. 
--Coloque o alias da coluna como “Valor Curso”.  
SELECT cr.COD_TRG
,      to_char(cr.PRECO,'L99G999D00') "Valor do Curso"
FROM TCURSOS cr;
