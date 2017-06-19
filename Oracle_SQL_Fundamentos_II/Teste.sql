SELECT F_MAIOR('USER_TABLES', 'USER_VIEWS') FROM DUAL; 

SET serveroutput ON
ACCEPT pid PROMPT 'Digite o codigo do curso: '
DECLARE
vpreco  tcursos.preco%type;
BEGIN
SELECT  preco
INTO    vpreco
FROM    tcursos
WHERE   id = &pid;
DBMS_OUTPUT.PUT_LINE('Preço = ' || to_char(vpreco, 'L99G999G999D99'));
EXCEPTION
  WHEN NO_DATA_FOUND THEN 
       RAISE_APPLICATION_ERROR(-20001, 'Código do curso inválido');
END;

select id, preco from tcursos;
execute aumenta_preco_curso;


set serveroutput on
DECLARE
vSamle := '01/10/07';
BEGIN
dbms_output.put_line('Quoted identifier End = '|| vSamle);
END;


set serveroutput on
DECLARE
c CHAR(32767) := ' ';
v VARCHAR2(32767) := ' ';
BEGIN
dbms_output.put_line('tamanho de c = '||LENGTH(c));
dbms_output.put_line('tamanho de v = '||LENGTH(v));
v := v || ' ';
dbms_output.put_line('tamanho de v = '||LENGTH(v));
END;
/

DECLARE
SUBTYPE code IS CHAR(1 CHAR);
c CHAR(1 CHAR) := 'A';
d CODE;
BEGIN
d := c;
dbms_output.put_line('tamanho de c = '||LENGTH(c));
dbms_output.put_line('tamanho de d = '||LENGTH(c));
END;
/
