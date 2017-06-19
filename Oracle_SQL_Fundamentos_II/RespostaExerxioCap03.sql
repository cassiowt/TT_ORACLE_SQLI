-- Crie um bloco PL/SQL que seleciona o maior número de contrato 
-- na tabela TCONTRATOS e armazene ele em uma variável do SQL*Plus (BIND).
-- Mostre o resultado na tela. 
VARIABLE gMax_contrato NUMBER
DECLARE
   vMax_contrato NUMBER;
BEGIN
   SELECT MAX(id)
   INTO vMax_contrato
   FROM tcontratos;
   :gMax_contrato := vMax_contrato;
END;
/
PRINT gMax_contrato

/*-
 Crie um bloco PL/SQL que insira um novo cliente na tabela TCLIENTES.
a)    Utilize os parâmetros: ID, NOME e DT_NASCIMENTO.
b)    Deixe o resto dos valores nulos.
c)    Execute o bloco PL/SQL.
d)    Mostre o novo cliente que você criou.
*/

CREATE SEQUENCE  "CASSIO"."TCLIENTES_SEQ" 
MINVALUE 200 MAXVALUE 9999999999999999999999999999 
INCREMENT BY 1 START WITH 200 CACHE 20 NOORDER  NOCYCLE  NOPARTITION;

SET VERIFY OFF
ACCEPT pNome PROMPT 'Informe o nome do cliente: '
ACCEPT pDt_nascimento DATE FORMAT 'DD/MM/YY' PROMPT 'Informe a data de nascimento do cliente: '
BEGIN
   INSERT INTO tclientes(id,nome,dt_nascimento)
   VALUES (tclientes_seq.NEXTVAL,'&pNome','&pDt_nascimento');
   COMMIT;
END;
/

SELECT * FROM tclientes;

SET VERIFY ON

/*
Crie um bloco PL/SQL que atualize a cidade de um determinado cliente. 
a)    Utilize o comando ACCEPT do SQLPLUS para receber o ID e 
      a CIDADE do cliente.
b)    Execute o bloco PL/SQL.
c)    Consulte os valores do cliente atualizado.
*/
ACCEPT pid NUMBER PROMPT 'Informe o id do cliente: '
ACCEPT pcidade PROMPT 'Informe a nova cidade do cliente: '
BEGIN
   UPDATE tclientes
   SET cidade = '&pcidade'
   WHERE id = &pid;
   COMMIT;
END;
/
