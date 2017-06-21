--

SELECT name, type, referenced_name, referenced_type
FROM   user_dependencies
WHERE  referenced_name IN ('TCLIENTES');

--

SELECT text, line
 FROM  user_source
WHERE  type = 'PROCEDURE'  AND 
       name = 'CADASTRA_CLIENTE'
ORDER  by line;

DESCRIBE CADASTRA_CLIENTE;

SELECT line||'/'||position pos, text
  FROM   user_errors
 WHERE  name = 'ATUALIZA_PRECO_CURSOS'
 ORDER BY line;
 
SHOW ERRORS PROCEDURE atualiza_preco_cursos;

SELECT name, type, referenced_name, referenced_type
FROM   user_dependencies
WHERE  referenced_name IN ('TCLIENTES');

-----------------------------

EXEC deptree_fill('TABLE', 'CASSIO', 'TCLIENTES');

SELECT nested_level, type, name
FROM   deptree
ORDER BY seq#;

-- Ou

SELECT  rpad(' ', nested_level * 10 ) || type || ' ' || name
FROM    deptree
ORDER BY seq#;

---Consultando a visão IDEPTREE.
SELECT *
FROM   ideptree;
