/*
1. Inicie a sessão do SQL Developer criada neste capítulo.

2. Verifique a existência das tabelas utilizadas no curso.

3. Verifique a estrutura da tabela TCLIENTES e depois selecione todas as colunas desta tabela.
*/
desc TCLIENTES;

select * from TCLIENTES;
/*
4. Faça uma query que selecione as colunas nome, preço e desconto da tabela TCURSOS. 
Coloque o título da coluna DESCONTO como "Desconto Promocional".
*/

select NOME , PRECO  from TCURSOS;

Select  DESCONTO  "Desconto Promocional" from TCONTRATOS;

/*
5. Faça um SQL que retorne quais estados possuem clientes.
*/
SELECT DISTINCT ESTADO FROM TCLIENTES;

/*
6. Abra uma sessão do SQL*Plus e mostre a estrutura da tabela TITENS.
*/
desc TITENS;

/*
7. Existem três erros de codificação neste comando. Você pode os identificar?
*/
SELECT id, cod_trg, preco * 0.5 "DESCONTO CURSO"  FROM tcursos;

/*
8. Crie uma consulta para exibir o id, data de compra, desconto e o total para cada contrato, mostrando o id do contrato por primeiro.
*/
SELECT c.ID, c.DT_COMPRA, c.DESCONTO, c.TOTAL FROM TCONTRATOS c;

