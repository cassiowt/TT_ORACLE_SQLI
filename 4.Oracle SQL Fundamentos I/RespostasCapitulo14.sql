-- No SQLDeveloper utilize a sua conex�o e conecte-se ao 
-- banco de dados do curso. Crie uma seq��ncia para ser utilizada 
--com a coluna da chave prim�ria da tabela PESSOAS.
-- A seq��ncia deve iniciar em 10 e possuir um valor m�ximo de 200. Forne�a para a seq��ncia um incremento de 1 e o nome como SPESSOAS_ID.
CREATE SEQUENCE spessoas_id
START WITH 15
INCREMENT BY 1
MAXVALUE 200;

-- Crie um arquivo de script para exibir a seguinte informa��o
-- sobre suas seq��ncias: o nome da seq��ncia, o valor m�ximo,
--o incremento e o �ltimo n�mero fornecido.
SELECT sequence_name, max_value, increment_by, last_number
FROM user_sequences;

-- Escreva um script interativo para inserir uma linha na tabela PESSOAS. Coloque o nome do arquivo como e14q3.sql. Utilize a seq��ncia que voc� criou para a coluna ID. Crie um prompt customizado para solicitar o nome da pessoa. Execute o script adicionando duas pessoas chamadas �Maria de Lourdes� e �Samuel Medeiros�.  Efetive as inser��es.
ACCEPT pnome PROMPT 'Informe o nome da pessoa: '

INSERT INTO pessoas(id_pessoa,nome)
VALUES (spessoas_id.NEXTVAL, '&pnome');

select spessoas_id.currval from dual;

UNDEFINE pnome;

COMMIT;
select * from pessoas;
-- Crie um �ndice para a coluna definida como FOREIGN KEY na tabela CONTRATOS.
CREATE INDEX con_pessoa_idx
ON contratos (pessoa_id);
-- Mostre os �ndices que existem no dicion�rio de dados para a
-- tabela CONTRATOS.
SELECT index_name, table_name, uniqueness
FROM user_indexes
WHERE table_name = 'CONTRATOS';