SET SERVEROUTPUT ON
ACCEPT pid NUMBER PROMPT 'Informe o id do contrato: '
DECLARE
   vtotal tcontratos.total%TYPE;
BEGIN
   SELECT total
   INTO   vtotal
   FROM   tcontratos
   WHERE  id = &pid;
   DBMS_OUTPUT.PUT_LINE ('Total = ' || vtotal);
EXCEPTION
  WHEN no_data_found THEN
       RAISE_APPLICATION_ERROR(-20001,'Contrato inexistente! ');
  WHEN others THEN
     RAISE_APPLICATION_ERROR(-20002,'Erro Oracle ' || SQLCODE || SQLERRM);
END;