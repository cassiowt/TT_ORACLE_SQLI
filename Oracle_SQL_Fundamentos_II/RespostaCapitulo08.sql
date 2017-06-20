CREATE TABLE DESCONTOS_PADROES
AS SELECT id,desconto,total
   FROM   tcontratos;
   
CREATE OR REPLACE PROCEDURE modifica_desconto
(pporcentagem IN NUMBER)
IS
BEGIN
   UPDATE descontos_padroes
   SET desconto = total * (pPorcentagem/100); 
   COMMIT;
EXCEPTION
  WHEN others THEN
     RAISE_APPLICATION_ERROR(-20002,'Erro Oracle ' || SQLCODE || SQLERRM);
END;
/