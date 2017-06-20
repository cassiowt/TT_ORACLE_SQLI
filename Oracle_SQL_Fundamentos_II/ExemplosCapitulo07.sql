--

set serveroutput on
ACCEPT  pid PROMPT 'Digite o codigo do Cliente: '
DECLARE
  vnome  tclientes.nome%TYPE;
BEGIN
  SELECT nome
  INTO   vnome
  FROM   tclientes
  WHERE  id = &pid;
  -- Comandos
  DBMS_OUTPUT.PUT_LINE('Cliente = ' || vnome);
  
EXCEPTION
  WHEN NO_DATA_FOUND THEN
     RAISE_APPLICATION_ERROR(-20001, 'Cliente não encontrado, id = ' || 
     TO_CHAR(&pid));
  WHEN OTHERS THEN
     RAISE_APPLICATION_ERROR(-20002, 'Erro Oracle ' || SQLCODE || SQLERRM);
END;
-- Exceções Pré-definidas Oracle


--

DECLARE
   vNome     tclientes.nome%TYPE := 'Carlos Magno';
   vCidade   tclientes.cidade%TYPE;
BEGIN
   SELECT cidade
   INTO   vCidade
   FROM   tclientes
   WHERE  nome = vNome;
   
    DBMS_OUTPUT.PUT_LINE('Cliente = ' || vnome);

EXCEPTION
  WHEN no_data_found THEN
    RAISE_APPLICATION_ERROR(-20001, 'Cliente Inexistente! ');
  WHEN too_many_rows THEN
    RAISE_APPLICATION_ERROR(-20002, 'Cliente Duplicado! ');
  WHEN others THEN
    RAISE_APPLICATION_ERROR(-20003, 'Exceção Desconhecida!'||SQLCODE||' '
                                     ||SQLERRM);
END;

--

DECLARE
   vDt_vencimento DATE;
   vValor         NUMBER;
   vJuros         NUMBER;
   vConta         NUMBER := 100;
   eConta_vencida EXCEPTION;
BEGIN
   SELECT data_vencimento, valor, juros
   INTO   vDt_vencimento, vValor, vJuros
   FROM   contas
   WHERE  codigo = vConta;

   IF   vDt_vencimento < TRUNC(SYSDATE) THEN
        RAISE eConta_vencida;  
   END IF;

EXCEPTION
   WHEN eConta_vencida THEN
        UPDATE contas
        SET    valor = valor + juros
        WHERE  conta = vConta;    
END;

--

set serveroutput ON
DECLARE
eExce EXCEPTION;
 
CURSOR   cur_clientes IS
    SELECT   *
     FROM    tclientes
    WHERE   estado = '&pEstado';  

CURSOR cur_contratos(pId_Cliente TCLIENTES.ID%type) IS
    SELECT *
     FROM  tcontratos
    WHERE TCLIENTES_ID = pId_Cliente; 
BEGIN
   OPEN cur_clientes;
   IF   cur_clientes%ROWCOUNT = 0  
        THEN  RAISE eExce;  
   ELSE
   CLOSE cur_clientes;
        FOR  clientes_record  IN  cur_clientes  LOOP   
             DBMS_OUTPUT.PUT_LINE('Cliente ' || clientes_record.nome || ' possui os seguintes contratos:');
             FOR  contratos_record  IN  cur_contratos(clientes_record.id)  LOOP   
                DBMS_OUTPUT.PUT_LINE('Contrato ' ||  contratos_record.id || ' Total = ' || contratos_record.total);
             END LOOP;
        END LOOP;
    END IF;
EXCEPTION
   WHEN eExce THEN
        DBMS_OUTPUT.PUT_LINE('Estado inexistente para cliente');   
END;
/
