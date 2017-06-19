ACCEPT pId NUMBER PROMPT 'Informe o id do cliente: '

DECLARE
    TYPE contrato_record_type IS TABLE OF tcontratos%ROWTYPE
    INDEX BY BINARY_INTEGER;

    contrato_record contrato_record_type;
BEGIN
   SELECT *
   INTO   contrato_record
   FROM   tcontratos
   WHERE  TCLIENTES_ID = &pid;
   FOR i IN contrato_record.first..contrato_record.last  LOOP  
       DBMS_OUTPUT.PUT_LINE('Contrato: ' || contrato_record(i).id);
       DBMS_OUTPUT.PUT_LINE('Data de Compra: ' || contrato_record(i).dt_compra);
       DBMS_OUTPUT.PUT_LINE('Desconto: ' || contrato_record(i).desconto);
       DBMS_OUTPUT.PUT_LINE('Total: ' || contrato_record(i).total);
   END LOOP;
END;

---

SET SERVEROUTPUT ON
ACCEPT pId NUMBER PROMPT 'Informe o id do contrato: '
DECLARE
   contrato_record tcontratos%ROWTYPE;
BEGIN
   SELECT *
   INTO   contrato_record
   FROM   tcontratos
   WHERE id = &pid;
   DBMS_OUTPUT.PUT_LINE('Contrato: ' || contrato_record.id);
   DBMS_OUTPUT.PUT_LINE('Data de Compra: ' || contrato_record.dt_compra);
   DBMS_OUTPUT.PUT_LINE('Desconto: ' || contrato_record.desconto);
   DBMS_OUTPUT.PUT_LINE('Total: ' || contrato_record.total);
END;


-- 
