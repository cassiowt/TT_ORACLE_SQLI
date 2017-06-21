--
Select * from USER_OBJECTS where OBJECT_TYPE in ('PROCEDURE','FUNCTION');
--
Select line, text from USER_SOURCE where name like 'CONSULTA_PRECO_HORA';
--
show ERRORS CONSULTA_PRECO_HORA;

--
select  object_name, status from USER_OBJECTS;

-- 
EXEC deptree_fill('TABLE', 'CASSIO', 'TCURSOS');

-- DEPTREE.
SELECT  *
FROM    deptree
ORDER BY seq#;

-- IDEPTREE.
SELECT * FROM   ideptree;

--