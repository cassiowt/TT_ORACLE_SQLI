-- No SQLDeveloper utilize a sua conexão e conecte-se ao banco de dados do curso. 
-- Descreva a estrutura da tabela TCLIENTES_VIP
-- para identificar os nomes das colunas.
DESC TCLIENTES_VIP;

--  Adicione a primeira linha de dados na tabela TCLIENTES_VIP a partir 
-- do exemplo de dados a seguir.
INSERT INTO tclientes_vip
VALUES (1,'Tapes','Carlos','ctapes',795); 

-- Adicione a segunda linha na tabela TCLIENTES_VIP a partir 
-- do exemplo de dados a seguir.
INSERT INTO tclientes_vip(id,sobrenome,nome,clienteid,credito)
VALUES (2,'Moura','Ana','amoura',860); 

-- Selecione
SELECT *FROM tclientes_vip;

-- Adicione mais três linhas na tabela TCLIENTES_VIP a partir 
-- do exemplo de dados a seguir.

INSERT INTO tclientes_vip(id,sobrenome,nome,clienteid,credito)
VALUES (3,'Pinheiro','Viviane','vpinheir',1100);

INSERT INTO tclientes_vip(id,sobrenome,nome,clienteid,credito)
VALUES (4,'Dutra','Manuel','mdutra',750);

INSERT INTO tclientes_vip(id,sobrenome,nome,clienteid,credito)
VALUES (5,'Silva','Cesar','csilva',1550);

INSERT INTO "CASSIO"."TCLIENTES_VIP" (ID, SOBRENOME, NOME, CLIENTEID, CREDITO) 
VALUES ('6', 'Trindade', 'Cassio', 'ctrindade', 10000);

-- Selecione
SELECT *FROM tclientes_vip;

-- Modifique o sobrenome do cliente com ID = 3 para “Souza”.
UPDATE tclientes_vip
SET sobrenome = 'Souza'
WHERE id = 3;

-- Modifique o crédito para 1000 para todos os clientes com o 
-- crédito menor que 900.
UPDATE tclientes_vip
SET credito = 1000
WHERE credito < 900;

-- selecione 
SELECT * FROM tclientes_vip;

-- Remova o cliente “Ana Moura” da tabela TCLIENTES_VIP.
DELETE FROM tclientes_vip
WHERE sobrenome = 'Moura'
AND   nome = 'Ana';

-- selecione
SELECT * FROM tclientes_vip;

-- Efetive todas as modificações pendentes.
COMMIT;
ROLLBACK;
-- Adicione uma linha para a tabela TCLIENTES_VIP com os 
-- valores id = 6, nome = ‘Roberto’, sobrenome = ‘Pires’ , 
-- clienteid = rpires e credito = 2000.
SAVEPOINT X;
INSERT INTO tclientes_vip(id,sobrenome,nome,clienteid,credito)
VALUES (7,'Alberto','Roberto','ralberto',2000);

-- selecione
SELECT * FROM tclientes_vip;

--  Marque um ponto intermediário no processamento da transação.
SAVEPOINT A;

-- Remova todas as linhas da tabela TCLIENTES_VIP.
DELETE FROM tclientes_vip;

-- selecione
SELECT * FROM tclientes_vip;

-- Descarte a mais recente operação de DELETE sem descartar a operação de INSERT anterior.
ROLLBACK TO SAVEPOINT X;

-- selecione
SELECT * FROM tclientes_vip;

-- efetue
COMMIT;
