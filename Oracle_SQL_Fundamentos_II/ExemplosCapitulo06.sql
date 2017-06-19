
--

set serveroutput on
DECLARE

  CURSOR  tcursos_cursor  IS
    SELECT  nome, preco
      FROM    tcursos;
  
  tcursos_record  tcursos_cursor%rowtype;

BEGIN
  /* Inicializa */
  OPEN  tcursos_cursor;
  FETCH  tcursos_cursor  
    INTO  tcursos_record;
  /* Loop */
  WHILE  tcursos_cursor%found  LOOP
    DBMS_OUTPUT.PUT_LINE(tcursos_record.nome || ' - ' || 
    LTRIM(TO_CHAR(tcursos_record.preco, 'L99G999G999D99')));
    FETCH  tcursos_cursor  
      INTO  tcursos_record;
  END LOOP;
  CLOSE tcursos_cursor;
END;
/
--

set serveroutput ON
DECLARE
CURSOR   tcursos_cursor IS
SELECT   nome, preco
FROM     tcursos
ORDER BY preco DESC;
BEGIN
FOR  tcursos_record  IN  tcursos_cursor  LOOP   
     DBMS_OUTPUT.PUT_LINE(tcursos_record.nome || ' - ' || 
     trim(to_char(tcursos_record.preco, 'L99G999G999D99')));
     EXIT  WHEN  tcursos_cursor%rowcount  = 3;
END LOOP;
END;
/
--

set serveroutput ON
DECLARE
CURSOR   tcursos_cursor IS
SELECT   nome, preco, rownum
FROM     (SELECT   nome, preco
          FROM     tcursos
          ORDER BY preco DESC)
where    rownum < 4;
BEGIN
FOR  tcursos_record  IN  tcursos_cursor  LOOP   
     DBMS_OUTPUT.PUT_LINE(tcursos_record.nome || ' - ' || 
     trim(to_char(tcursos_record.preco, 'L99G999G999D99')));
END LOOP;
END;
/
