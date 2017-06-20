--
DROP TABLE tcursos_temp;

CREATE TABLE tcursos_temp
AS SELECT *
   FROM   tcursos;

SELECT AVG(preco) FROM tcursos_temp;

CREATE OR REPLACE PROCEDURE atualiza_preco_cursos
IS
BEGIN
     UPDATE tcursos_temp
     SET    preco = preco * 1.1;
END;

exec atualiza_preco_cursos;

-- 

CREATE OR REPLACE PROCEDURE aumenta_preco
(pId IN tcursos.id%TYPE, 
 ppercentual IN NUMBER DEFAULT 10)
IS
BEGIN
  UPDATE tcursos_temp
  SET    preco = preco * (1 + (ppercentual / 100))
  WHERE  id = pId;
END aumenta_preco;

exec aumenta_preco(pId => 20, ppercentual => 100);

select * from tcursos_temp where id = 20; -- 638

--