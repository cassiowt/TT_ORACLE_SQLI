CREATE OR REPLACE PACKAGE pck_cursos
IS
  gDesconto tcontratos.desconto%TYPE;

  PROCEDURE atualiza_preco_cursos;
  
  PROCEDURE aumenta_porcentagem_curso(pPorcentagem IN NUMBER DEFAULT 10);

  PROCEDURE aumenta_preco(pId IN tcursos.id%TYPE);

  FUNCTION consulta_preco(pId IN tcursos.id%TYPE) RETURN NUMBER;

  FUNCTION consulta_preco_dois(pId IN tcursos.id%TYPE) RETURN NUMBER;
   
END pck_cursos;
/

CREATE OR REPLACE PACKAGE BODY pck_cursos
IS
    PROCEDURE atualiza_preco_cursos
    IS
    BEGIN
      UPDATE tcursos
      SET    preco = preco * 1.1;
    END atualiza_preco_cursos;
    
    PROCEDURE aumenta_porcentagem_curso
    (pPorcentagem IN NUMBER DEFAULT 10)
    IS
    BEGIN
      UPDATE tcursos
      SET    preco = preco * ((pPorcentagem / 100) + 1);
    END aumenta_porcentagem_curso;
    
    PROCEDURE aumenta_preco
    (pId IN tcursos.id%TYPE)
    IS
    BEGIN
      UPDATE tcursos
      SET    preco = preco * 1.1
      WHERE  id = pId;
    END aumenta_preco;
   
    FUNCTION consulta_preco
    (pId IN tcursos.id%TYPE)
    RETURN NUMBER IS
      vPreco   tcursos.preco%TYPE := 0;
    BEGIN
      SELECT preco
      INTO   vPreco
      FROM   tcursos
      WHERE  id = pId;
      RETURN(vPreco);
   END consulta_preco;
   
   FUNCTION consulta_preco_dois(pId IN tcursos.id%TYPE) RETURN NUMBER
    IS
      vPreco   tcursos.preco%TYPE := 0;
    BEGIN
      SELECT preco
      INTO   vPreco
      FROM   tcursos
      WHERE  id = pId;
      IF(vPreco < 500)THEN       
        aumenta_preco( pId );    -- Invocando a PROCEDURE aumenta_preco
        COMMIT;
      END IF;
      SELECT preco
      INTO   vPreco
      FROM   tcursos
      WHERE  id = pId;
      RETURN(vPreco);
   END consulta_preco_dois;
   

BEGIN
   SELECT AVG(preco)*.25
   INTO   gDesconto
   FROM   tcursos;      
END pck_cursos;
/


CREATE OR REPLACE PROCEDURE atualiza_contrato
 (pcontrato IN tcontratos.id%TYPE,
  pcliente IN tclientes.id%TYPE)
IS
  vestado   tclientes.estado%TYPE;
  vdesconto tcontratos.desconto%TYPE;
  vtotal    tcontratos.total%TYPE;

BEGIN
  SELECT tcl.estado
  INTO   vestado
  FROM   tclientes tcl
  WHERE  tcl.id = pCliente;

  IF  (vestado IN ('SP','RJ'))  THEN
       SELECT tcn.total * .3
       INTO   vdesconto
       FROM   tcontratos tcn
       WHERE  tcn.id = pContrato;
  ELSE
       vdesconto := pck_cursos.gdesconto;
  END IF;

  UPDATE tcontratos
  SET    desconto = vdesconto
  WHERE  id = pcontrato;

  COMMIT;
EXCEPTION
  WHEN no_data_found THEN
    RAISE_APPLICATION_ERROR(-20201, 'Número de Contrato inválido!');
  WHEN others THEN
    RAISE_APPLICATION_ERROR(-20201, 'Erro Oracle' || SQLCODE ||    SQLERRM);
END;
/

