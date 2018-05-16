-- *** INSERÇOES ***
-- Método implícito:
INSERT INTO tdescontos(classe, base_inferior, base_superior)
VALUES ('F', 50000, 99999);

-- Método explícito:
INSERT INTO tdescontos
VALUES('G', 60000, NULL);

SELECT * FROM tdescontos;

-- Valores especiasi
INSERT INTO tcontratos(id, dt_compra, status, tclientes_id, desconto, total)
VALUES (1021, SYSDATE, 'A', 150, NULL, 3000);

SELECT * FROM   tcontratos WHERE  id = 1021;

-- inserindo datas
INSERT INTO tcontratos
VALUES (1022,TO_DATE('16/01/2009','DD/MM/YYYY'),'A',200,100,1000);

INSERT INTO tcontratos
VALUES (1024,TO_DATE('16/16/2009','MM/DD/YYYY'),'A',200,100,1000);


SELECT * FROM   tcontratos WHERE  id = 1023;

-- parametros
INSERT INTO tdescontos(classe, base_inferior, base_superior)
VALUES ('&classe', &base_inferior, &base_superior);

-- inserindo a partir de um SELECT
CREATE TABLE clientes_sp AS  SELECT * FROM tclientes where id = 100;

INSERT INTO clientes_sp (id, nome, dt_nascimento, endereco, cidade, estado, cep, telefone, comentarios)
  SELECT id, nome, dt_nascimento, endereco, cidade, estado, cep, telefone, comentarios
    FROM amaral.tclientes
   WHERE estado = 'RS';

SELECT * FROM clientes_sp;


-- *** ATUALIZAÇOES ***
-- simples
SELECT * FROM tcontratos  WHERE id = 1000;
UPDATE	tcontratos SET	desconto = total * 0.7 WHERE id = 1000;

UPDATE	tcontratos SET	desconto = total * 0.5 

-- com SELECT 
drop table media_contratos_clientes;
CREATE TABLE media_contratos_clientes AS  
 SELECT  tclientes_id, max(total) total, max(desconto) desconto
   FROM tcontratos 
  group by tclientes_id;

UPDATE media_contratos_clientes me
SET    me.total = (SELECT AVG(co1.total)
                   FROM   tcontratos co1
                   WHERE me.tclientes_id =       co1.tclientes_id),
       me.desconto = (SELECT AVG(co2.desconto)
                      FROM tcontratos co2
                      WHERE me.tclientes_id = co2.tclientes_id);

SELECT * FROM media_contratos_clientes;


DELETE FROM tdescontos WHERE CLASSE = 'F';



DELETE FROM media_contratos_clientes me
WHERE  me.total >0;

ROLLBACK;
SELECT * FROM tcursos WHERE  id = 50;

UPDATE tcursos 
SET    preco = 2000
WHERE  id = 50;

SAVEPOINT ok;

UPDATE tcursos
SET carga_horaria = 30
WHERE  id = 50;

ROLLBACK TO SAVEPOINT ok;

COMMIT;








