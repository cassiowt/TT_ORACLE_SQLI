-- No SQLDeveloper utilize a sua conexão e conecte-se ao banco de dados 
--do curso. Adicione uma constraint PRIMARY KEY para a tabela CONTRATOS
-- utilizando a coluna ID.
ALTER TABLE contratos
ADD CONSTRAINT con_id_pk PRIMARY KEY(id);

-- Crie uma constraint PRIMARY KEY na tabela PESSOAS utilizando a coluna ID.
ALTER TABLE pessoa
ADD CONSTRAINT pes_id_pk PRIMARY KEY(id_pessoa);

--Adicione uma referência de chave estrangeira para a tabela CONTRATOS 
--que garanta que o contrato não seja associado a uma pessoa 
-- com ID inexistente (coluna PESSOAS_ID).
ALTER TABLE contratos
ADD CONSTRAINT con_pes_id_fk FOREIGN KEY(pessoa_id) REFERENCES pessoa(id_pessoa);

-- Confirme que as constraints foram adicionadas consultando
-- a visão USER_CONSTRAINTS. Observe os tipos e nomes das constraints. 
-- Salve o comando em um arquivo chamado e20q4.sql.
SELECT constraint_name, constraint_type
FROM   user_constraints
WHERE   table_name  IN ('PESSOA','CONTRATOS');

-- Modifique a tabela CONTRATOS. Adicione uma coluna IMPOSTO 
-- com o tipo de dado NUMBER(7,2) definindo que o valor do 
-- imposto não pode ser negativo.
ALTER TABLE contratos
ADD (imposto NUMBER(7,2) CONSTRAINT con_imposto_ck CHECK(imposto >0));
