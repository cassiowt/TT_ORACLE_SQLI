CREATE OR REPLACE FUNCTION consulta_preco_hora
(pid IN tcursos.id%TYPE)
RETURN NUMBER
IS
  vpreco  tcursos.preco%TYPE;
BEGIN
  SELECT round(tcs.preco/tcs.carga_horaria)
  INTO   vpreco
  FROM   tcursos tcs
  WHERE  tcs.id = pId;
  RETURN (vPreco);
EXCEPTION
  WHEN no_data_found THEN
       RAISE_APPLICATION_ERROR(-20001,'Curso inexistente! ');
  WHEN others THEN
     RAISE_APPLICATION_ERROR(-20002,'Erro Oracle ' || SQLCODE || SQLERRM);
END;

SELECT  consulta_preco_hora(c.ID) "Valor Hora", SUBSTR(c.nome,1 ,20) nome,c.preco, c.CARGA_HORARIA FROM tcursos c;