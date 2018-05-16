-- Crie a tabela Pessoa
CREATE TABLE pessoas 
( 
  id_pessoa    number(7,0) NOT NULL ENABLE,
  data_criacao date default sysdate,
  nome         varchar2 (25)
 ); 

-- Insira na tabela pessoa apartir da tabela tclientes
INSERT INTO pessoas (id_pessoa, NOME)
  SELECT id, nome
    FROM tclientes;
 
SELECT * FROM pessoas;
 
-- Crie a tabela CONTRATOS   
CREATE TABLE contratos
 ( id NUMBER(5),
   Pessoa_id NUMBER(7),
   data DATE,
   desconto NUMBER(7,2),
   total NUMBER(7,2)
 );
 
 desc contratos;
 -- Modifique contratos
ALTER TABLE contratos MODIFY id NUMBER(7);

-- verifique no dicionario
SELECT table_name, owner
  FROM   all_tables
 WHERE  table_name IN ('PESSOAS','CONTRATOS');
 
-- crie comentarios e verifique 
COMMENT ON TABLE pessoas IS 'Informações de Pessoas';
COMMENT ON TABLE contratos IS 'Informações de Contratos';

COMMENT ON COLUMN PESSOAS.DATA_CRIACAO IS 'Data da criação da pessoa';

SELECT table_name, comments
FROM user_tab_comments
WHERE table_name IN ('PESSOAS','CONTRATOS'); 
 
SELECT table_name, COLUMN_NAME, comments
FROM user_col_comments
WHERE table_name IN ('PESSOAS','CONTRATOS'); 

desc PESSOAS; 
 