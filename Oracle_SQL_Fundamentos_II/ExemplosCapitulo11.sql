CREATE OR REPLACE PACKAGE pck_cursos
IS
  gDesconto tcontratos.desconto%TYPE;

  PROCEDURE atualiza_preco_cursos;
  
  PROCEDURE aumenta_porcentagem_curso(pPorcentagem IN NUMBER DEFAULT 10);

  PROCEDURE aumenta_preco(pId IN tcursos.id%TYPE);

  FUNCTION consulta_preco(pId IN tcursos.id%TYPE) RETURN NUMBER;

END pck_cursos;

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
END pck_cursos;