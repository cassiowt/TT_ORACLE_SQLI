--

CREATE OR REPLACE FUNCTION consulta_preco
(pId IN tcursos.id%TYPE)
RETURN NUMBER 
IS
  vPreco   tcursos.preco%TYPE := 0;
BEGIN
  SELECT preco
  INTO   vPreco
  FROM   tcursos
  WHERE  id = pId;
  RETURN(vPreco);
  -- Comandos

EXCEPTION
WHEN  no_data_found THEN 
      raise_application_error(-20001, 'Curso inexistente');
WHEN  others THEN 
      raise_application_error(-20002, 'Erro Oracle ' || SQLCODE ||
      SQLERRM);
END consulta_preco;

select consulta_preco(20) from dual;

SELECT tcontratos_id, seq, qtde, total, consulta_preco(tcursos_id) preco
FROM   titens;

--

CREATE OR REPLACE FUNCTION existe_cliente( pId IN tclientes.id%TYPE) RETURN BOOLEAN
IS
  vvar   NUMBER(1);
BEGIN
  SELECT 1
  INTO   vvar
  FROM   tclientes
  WHERE  id = pId;
  RETURN( TRUE );

EXCEPTION
  WHEN others THEN
    RETURN( FALSE );
END;

CREATE OR REPLACE PROCEDURE cadastra_cliente (pid        IN tclientes.id%TYPE,
                            pnome      IN tclientes.nome%TYPE,
                            pcidade    IN tclientes.cidade%TYPE,
                            pestado    IN tclientes.estado%TYPE)
IS
BEGIN
  IF( NOT existe_cliente(pid) )THEN
      INSERT INTO tclientes (id, nome, cidade, estado)
      VALUES ( pid, pnome, pcidade, pestado);
  ELSE RAISE too_many_rows;
  END IF;
EXCEPTION
  WHEN no_data_found THEN
    RAISE_APPLICATION_ERROR(-20001, 'Cliente Inexistente! ');
  WHEN too_many_rows THEN
    RAISE_APPLICATION_ERROR(-20002, 'Cliente Duplicado! ');
  WHEN others THEN
    RAISE_APPLICATION_ERROR(-20003, 'Exceção Desconhecida!'||SQLCODE||' '
                                     ||SQLERRM);
END;

exec cadastra_cliente (pid  => 1, pnome  => 'Cassio Trindade',  pcidade => 'São Sepé', pestado => 'RS');

select * from tclientes where id = 1;


ROLLBACK