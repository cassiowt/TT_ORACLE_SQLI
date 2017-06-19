SET SERVEROUTPUT ON
DECLARE
 -- declara variaveis do procedimento
 vCodigoCurso tcursos.cod_trg%TYPE;
 vResultado VARCHAR2(60);
-- inicia procedimento 
BEGIN 
  -- seleciona o valor da variavel vCodigoCurso
  SELECT COD_TRG
  INTO vCodigoCurso
  FROM tcursos
  WHERE COD_TRG = 'TO10G1' ;
  --WHERE ID = (SELECT MAX(ID) FROM tcursos);
  -- define o valor da variável vResultado
  CASE vCodigoCurso
     WHEN 'TOR11GF1' THEN 
           vResultado := 'Oracle 11g Fundamentals 1';
     WHEN 'TOR11GF2' THEN 
           vResultado := 'Oracle 11g Fundamentals 2';
     WHEN 'TO10G1' THEN 
           vResultado := 'Administração e Arquitetura Oracle 11g';
     ELSE
           vResultado := 'Curso não informado';
  END CASE;
  DBMS_OUTPUT.PUT_LINE(vResultado);
END;
/


DECLARE
  vResultado VARCHAR2(30);
  vPreco tcursos.preco%TYPE;
BEGIN
  SELECT preco
  INTO vPreco
  FROM tcursos
  WHERE id = 20;
  CASE 
     WHEN vPreco < 1500  THEN 
          vResultado := 'Preco baixo';
     WHEN vPreco BETWEEN 1500 AND 2000 THEN 
          vResultado := 'Preco médio';
     WHEN vPreco > 2000 THEN 
          vResultado := 'Preco alto';
  END CASE;
  DBMS_OUTPUT.PUT_LINE(vResultado || ' no valor de ' 
       ||to_char(vPreco, 'L99G999D99'));
END;
/


DECLARE
i  INTEGER(3) :=  1;
BEGIN
WHILE  i < 11  LOOP
    DBMS_OUTPUT.PUT_LINE('I =  ' || to_char(i));
    i := i + 1;
END LOOP teste_loop;
END;

BEGIN

     LOOP
        vContador := vContador + 1;
        EXIT WHEN vContador > 10;

        LOOP
           EXIT Loop_externo WHEN vTotal = 'YES';
           -- Sai dos dois LOOPs
           EXIT WHEN vSair = 'YES';
           -- Sai do LOOP interno
   
        END LOOP Loop_Interno;
      
      END LOOP Loop_Externo;
  END;
