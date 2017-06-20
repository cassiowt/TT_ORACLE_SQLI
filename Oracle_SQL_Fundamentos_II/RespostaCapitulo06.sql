/*
Crie um cursor para recuperar os clientes do Rio Grande do Sul. Utilize um outro 
cursor para recuperar os contratos dos clientes que recebe como parâmetro o 
identificador do cliente. Exiba o total dos contratos dos clientes selecionados. 

Cliente Alfredo Fonseca possui os seguintes contratos:
Contrato 1000 Total = 3600
Contrato 1012 Total = 600
Contrato 1016 Total = 15960
Cliente José Batista possui os seguintes contratos:
Contrato 1007 Total = 1000
Contrato 1014 Total = 956
Contrato 1019 Total = 600

Procedimento PL/SQL concluído com sucesso.
*/

set serveroutput ON
DECLARE
CURSOR   cur_clientes IS
    SELECT   *
     FROM    tclientes
    WHERE   estado = 'RS';
    
CURSOR cur_contratos(pId_Cliente TCLIENTES.ID%type) IS
    SELECT *
     FROM  tcontratos
    WHERE TCLIENTES_ID = pId_Cliente; 

BEGIN
FOR  clientes_record  IN  cur_clientes  LOOP   
     DBMS_OUTPUT.PUT_LINE('Cliente ' || clientes_record.nome || ' possui os seguintes contratos:');
     FOR  contratos_record  IN  cur_contratos(clientes_record.id)  LOOP   
        DBMS_OUTPUT.PUT_LINE('Contrato ' ||  contratos_record.id || ' Total = ' || contratos_record.total);
     END LOOP;
END LOOP;
END;
/