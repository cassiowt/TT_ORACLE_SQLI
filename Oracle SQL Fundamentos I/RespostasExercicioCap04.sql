/*
Crie um bloco PL/SQL que calcule o desconto de um contrato baseado 
no seu total. Salve o bloco PL/SQL para um arquivo chamado e4q1.sql.
a)    Utilize a tabela chamada TCONTRATOS.
b)    Utilize o comando ACCEPT para receber o ID do contrato como uma variável. Leia o total do contrato informado.
c)    Se o total do contrato for menor que R$1000, atribua para o desconto o valor de 10% do total.
d)    Se o total do contrato está entre R$1000 e R$3000, atribua para o desconto o valor de 15% do total.
e)    Se o total do contrato for maior que R$3000, atribua para o desconto o valor de 20% do total.
f)     Efetue o COMMIT das modificações.
*/
SELECT id, total, desconto FROM tcontratos;
SET VERIFY OFF
ACCEPT pId NUMBER PROMPT 'Informe o id do contrato: '
DECLARE
   vTotal tcontratos.total%TYPE;
   vDesconto tcontratos.desconto%TYPE;
BEGIN
  SELECT total
    INTO vTotal
    FROM tcontratos
   WHERE id = &pId;
  
  CASE 
    WHEN vTotal < 1000 THEN
       vDesconto := vTotal * 0.10;
    WHEN vTotal BETWEEN 1000 AND 3000 THEN
       vDesconto := vTotal * 0.15;
    WHEN vTotal > 3000 THEN
       vDesconto := vTotal * 0.20;
  END CASE;
  
  UPDATE tcontratos
     SET desconto = vDesconto
   WHERE id = &pId;
  
  COMMIT;
END;
/
SET VERIFY ON
 

/*
Escreva um bloco PL/SQL para inserir números na coluna 
RESULTADOS da tabela MENSAGENS. 
a)    Insira os números de 1 a 10 excluindo o 6 e 8.
b)    Execute um COMMIT antes do final do bloco.
c)    Execute o seu bloco anônimo.  Verifique se a execução 
       foi correta selecionando os dados da tabela MENSAGENS.
d)    Selecione os dados da tabela MENSAGENS para verificar
       se o bloco executou corretamente.
*/
DROP TABLE MENSAGENS;
CREATE TABLE MENSAGENS(resultados VARCHAR(100) NOT NULL);

BEGIN
  FOR i IN 1..10 LOOP
    IF i <> 6 AND i <> 8 THEN
      INSERT INTO mensagens(resultados)
      VALUES (i);
    END IF;
  END LOOP;
  COMMIT;
END;
/




SELECT * FROM mensagens;
