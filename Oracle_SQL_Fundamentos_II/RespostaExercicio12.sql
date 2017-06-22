select max(id)
from tclientes;

-- Crie a sequence TCLIENTES_SEQ:
DROP SEQUENCE TCLIENTES_SEQ;

CREATE SEQUENCE TCLIENTES_SEQ
start with 201
increment by 1
nocache
nocycle
nomaxvalue;



--Crie uma database DML trigger before insert a nível de linha para gerar o numero do cliente a partir da sequence TCLIENTES_SEQ.


CREATE OR REPLACE TRIGGER BI_TCLIENTES_TRG_L
BEFORE INSERT ON TCLIENTES
FOR EACH ROW 
BEGIN
  SELECT  tclientes_seq.nextval
  INTO    :new.id
  FROM    dual;
EXCEPTION
WHEN  others  THEN 
      RAISE_APPLICATION_ERROR(-20001, 'Erro na leitura da tabela dual para obter nextval de TCLIENTES_SEQ ' ||
      SQLCODE || SQLERRM);
END;

--

insert into tclientes (nome) 
values ('Paulo Roberto');
commit;

select * 
from tclientes;