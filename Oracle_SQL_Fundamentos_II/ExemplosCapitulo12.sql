--------------------------------------------------------
--   Table LOG
--------------------------------------------------------

  CREATE TABLE LOG 
   (USUARIO VARCHAR2(20 BYTE), 
	HORARIO DATE, 
	INFORMACAO VARCHAR2(60 BYTE)
   ) ;

---
SELECT
    usuario,
    horario,
    informacao
FROM
    log;
    
--
    
CREATE OR REPLACE TRIGGER bi_valida_horario_trg
BEFORE INSERT
ON tcontratos
BEGIN
  IF  (TO_CHAR(SYSDATE, 'DAY') IN ('SABADO', 'DOMINGO') OR
       TO_NUMBER(TO_CHAR(SYSDATE,'HH')) NOT BETWEEN 8 AND 23) THEN
       RAISE_APPLICATION_ERROR( -20001,'O cadastramento de contratos é permitido apenas dentro do horário comercial');
  END IF;
END;
/
INSERT INTO tcontratos (
    id, dt_compra, status, tclientes_id, desconto, total
) VALUES (
    1032, SYSDATE, 'A', 100, 300, 3000
);
/
--
   

CREATE OR REPLACE TRIGGER au_gera_log_alteracoes_trg
AFTER UPDATE OF total
ON tcontratos
DECLARE  
BEGIN
  INSERT INTO log( usuario, horario )
  VALUES ( USER, SYSDATE );
END;
/
---

UPDATE tcontratos
    SET total = 1500
WHERE id =1031;
 
DELETE  tcontratos WHERE id =1031;
 commit;
--

CREATE OR REPLACE TRIGGER aidu_audita_tcontratos
AFTER INSERT OR DELETE OR UPDATE
ON tcontratos
FOR EACH ROW
BEGIN
  IF( DELETING )THEN
      INSERT INTO log( usuario, horario, informacao )
      VALUES ( USER, SYSDATE, 'Linhas deletadas.' );
  ELSIF( INSERTING )THEN
      INSERT INTO log( usuario, horario, informacao )
      VALUES ( USER, SYSDATE, 'Linhas inseridas.' );
  ELSIF( UPDATING('TOTAL') )THEN
      INSERT INTO log( usuario, horario, informacao )
      VALUES ( USER, SYSDATE, 'Atualização do TOTAL do contrato.' );
  ELSE
      INSERT INTO log( usuario, horario, informacao )
      VALUES ( USER, SYSDATE, 'Atualização das informações do contrato.' );
  END IF;
END;
/
---

CREATE TABLE tcursos_log (
    id               NUMBER(11),
    dt_log           DATE DEFAULT SYSDATE,
    usuario          VARCHAR2(30) DEFAULT user,
    evento           CHAR(1),
    tcursos_id       NUMBER(11),
    preco_anterior   NUMBER(13,2) NOT NULL,
    preco_novo       NUMBER(13,2) NOT NULL
);

CREATE SEQUENCE TCURSOS_LOG_SEQ  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 10 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;


create or replace trigger A_IUD_TCURSOS_L_TRG
  after insert or update of preco or delete 
  on tcursos  
  for each row
DECLARE
	v_evento     tcursos_log.evento%TYPE;
	v_tcursos_id tcursos.id%TYPE;
BEGIN
	CASE
		WHEN inserting THEN
			v_evento     := 'I';
			v_tcursos_id := :new.id;
		WHEN updating THEN
			v_evento     := 'U';
			v_tcursos_id := :new.id;
		ELSE
			v_evento     := 'D';
			v_tcursos_id := :old.id;
	END CASE;
	INSERT INTO tcursos_log
		(id, dt_log, usuario, evento, tcursos_id, preco_anterior, preco_novo)
	VALUES
		(tcursos_log_seq.nextval,
		 SYSDATE,
		 USER,
		 v_evento,
		 v_tcursos_id,
		 :old.preco,
		 :new.preco);
END a_iud_tcursos_l_trg;
