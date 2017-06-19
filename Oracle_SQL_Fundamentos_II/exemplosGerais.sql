CREATE OR REPLACE FUNCTION F_MAIOR(vTAB1 IN VARCHAR, vTAB2 IN VARCHAR) RETURN VARCHAR IS
vSQL      VARCHAR2(256);    --string que recebe o comando SQL dinâmico
vTOT1     PLS_INTEGER;      --total de registros da Tabela 1
vTOT2     PLS_INTEGER;      --total de registros da Tabela 2


BEGIN
   --PASSO 1: monta e executa SQL dinâmico referente a Tabela 1
   vSQL := 'SELECT COUNT(*) FROM '  || vTAB1;
   EXECUTE IMMEDIATE vSQL INTO vTOT1;

   --PASSO 2: monta e executa SQL dinâmico referente a Tabela 2
   vSQL := 'SELECT COUNT(*) FROM '  || vTAB2;
   EXECUTE IMMEDIATE vSQL INTO vTOT2;
   
  --PASSO 3: retorna o nome e a quantidade de registros da tabela com mais linhas
   IF vTOT1 > vTOT2 THEN
     RETURN  vTAB1 ||  ' --- ' || TO_CHAR(vTOT1);
   ELSIF vTOT1 < vTOT2 THEN
      RETURN  vTAB2 ||  ' --- ' || TO_CHAR(vTOT2);
   ELSE
      RETURN  'EMPATE --- ' || TO_CHAR(vTOT2);
   END IF;

END;


/*
O programa exemplo funciona da seguinte forma. No passo 1, uma instrução 
SQL é montada dinamicamente e armazenada na variável vSQL (do tipo VARCHAR2). 
Observe que o parâmetro de entrada da função vTAB1 (nome da tabela 1) 
é concatenado no final do literal ‘SELECT COUNT(*)’. 
A seguir encontra-se a linha de código mais importante do programa:
*/

