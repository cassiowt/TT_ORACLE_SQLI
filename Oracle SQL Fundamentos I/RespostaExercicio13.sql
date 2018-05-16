CREATE OR REPLACE VIEW vclientes_tudo AS
SELECT *
FROM tclientes;

-- SQLDeveloper utilize a sua conexão e conecte-se ao banco de dados do curso. Crie uma visão chamada VCONTRATOS baseada no número do contrato, data de compra e no número do cliente a partir da tabela TCONTRATOS. Modifique o cabeçalho para o código do cliente para “CLIENTE”.
CREATE VIEW vcontratos_x AS
SELECT id, dt_compra, tclientes_id cliente
FROM tcontratos;

--Mostre o conteúdo da visão VCONTRATOS.
SELECT *
FROM vcontratos_x;

--Selecione a coluna VIEW_NAME e TEXT a partir da visão USER_VIEWS do dicionário de dados.
SELECT view_name, text
FROM user_views
WHERE view_name = 'VCONTRATOS';

--Utilizando a visão VCONTRATOS, execute uma consulta para exibir 
--todos os clientes e datas de compras.
SELECT cliente, dt_compra
FROM vcontratos_x;

-- Crie uma visão chamada VCLIENTESRS que contenha o número do cliente
-- o nome, a cidade e o estado para todos os clientes com estado 
-- igual a ‘RS’. Não permita que operações DML sejam
-- executadas através da visão.
CREATE  VIEW vclientesrs AS
SELECT  id, nome, cidade, estado
FROM    tclientes
WHERE      estado = 'RS'
WITH         READ ONLY;

-- Mostre a estrutura e o conteúdo da visão VCLIENTESRS.
DESCRIBE vclientesrs

SELECT *
FROM vclientesrs; 