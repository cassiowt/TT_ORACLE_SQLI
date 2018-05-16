CREATE OR REPLACE VIEW vclientes_tudo AS
SELECT *
FROM tclientes;

-- SQLDeveloper utilize a sua conex�o e conecte-se ao banco de dados do curso. Crie uma vis�o chamada VCONTRATOS baseada no n�mero do contrato, data de compra e no n�mero do cliente a partir da tabela TCONTRATOS. Modifique o cabe�alho para o c�digo do cliente para �CLIENTE�.
CREATE VIEW vcontratos_x AS
SELECT id, dt_compra, tclientes_id cliente
FROM tcontratos;

--Mostre o conte�do da vis�o VCONTRATOS.
SELECT *
FROM vcontratos_x;

--Selecione a coluna VIEW_NAME e TEXT a partir da vis�o USER_VIEWS do dicion�rio de dados.
SELECT view_name, text
FROM user_views
WHERE view_name = 'VCONTRATOS';

--Utilizando a vis�o VCONTRATOS, execute uma consulta para exibir 
--todos os clientes e datas de compras.
SELECT cliente, dt_compra
FROM vcontratos_x;

-- Crie uma vis�o chamada VCLIENTESRS que contenha o n�mero do cliente
-- o nome, a cidade e o estado para todos os clientes com estado 
-- igual a �RS�. N�o permita que opera��es DML sejam
-- executadas atrav�s da vis�o.
CREATE  VIEW vclientesrs AS
SELECT  id, nome, cidade, estado
FROM    tclientes
WHERE      estado = 'RS'
WITH         READ ONLY;

-- Mostre a estrutura e o conte�do da vis�o VCLIENTESRS.
DESCRIBE vclientesrs

SELECT *
FROM vclientesrs; 