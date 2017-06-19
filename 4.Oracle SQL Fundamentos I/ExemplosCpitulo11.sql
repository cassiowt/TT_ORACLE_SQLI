select * from all_tables where owner = 'CARIN';

select * from all_tab_columns;

select * from all_objects where object_name like '%ALL_T%';

CREATE TABLE tdescontos_dois
(classe        VARCHAR2 (2) NOT NULL,
 base_inferior NUMBER (7,2),
 base_superior NUMBER (7,2));
 
CREATE TABLE pessoa 
( 
  id_pessoa    number(6,0) NOT NULL ENABLE,
  data_criacao date default sysdate,
  nome         varchar2 (60)
 ); 
 
DROP TABLE pessoa; 

 