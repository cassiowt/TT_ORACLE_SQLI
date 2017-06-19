-- No SQLDeveloper utilize a sua conexão e conecte-se ao 
-- banco de dados do curso. Crie uma seqüência para ser utilizada 
--com a coluna da chave primária da tabela PESSOAS.
-- A seqüência deve iniciar em 10 e possuir um valor máximo de 200. Forneça para a seqüência um incremento de 1 e o nome como SPESSOAS_ID.
CREATE SEQUENCE spessoas_id
START WITH 15
INCREMENT BY 1
MAXVALUE 200;

-- Crie um arquivo de script para exibir a seguinte informação
-- sobre suas seqüências: o nome da seqüência, o valor máximo,
--o incremento e o último número fornecido.
SELECT sequence_name, max_value, increment_by, last_number
FROM user_sequences;

-- Escreva um script interativo para inserir uma linha na tabela PESSOAS. Coloque o nome do arquivo como e14q3.sql. Utilize a seqüência que você criou para a coluna ID. Crie um prompt customizado para solicitar o nome da pessoa. Execute o script adicionando duas pessoas chamadas “Maria de Lourdes” e “Samuel Medeiros”.  Efetive as inserções.
ACCEPT pnome PROMPT 'Informe o nome da pessoa: '

INSERT INTO pessoas(id_pessoa,nome)
VALUES (spessoas_id.NEXTVAL, '&pnome');

select spessoas_id.currval from dual;

UNDEFINE pnome;

COMMIT;
select * from pessoas;
-- Crie um índice para a coluna definida como FOREIGN KEY na tabela CONTRATOS.
CREATE INDEX con_pessoa_idx
ON contratos (pessoa_id);
-- Mostre os índices que existem no dicionário de dados para a
-- tabela CONTRATOS.
SELECT index_name, table_name, uniqueness
FROM user_indexes
WHERE table_name = 'CONTRATOS';