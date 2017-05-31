alter session set nls_date_format = 'dd-mm-rrrr'
/

prompt Criando base de tabelas do curso Oracle 11g Fundamentals I e II...;
prompt .;
prompt

rem ----------------------------------------------------------------

create table tDescontos
( classe        VarChar2( 2  ) not null
, base_inferior Number( 7, 2  )
, base_superior Number( 7, 2  )
, constraint tds_classe_pk primary key( classe ) );

rem ----------------------------------------------------------------

insert into tDescontos Values( 'A', 0, 999 ); 
insert into tDescontos Values( 'B', 1000, 4999 );
insert into tDescontos Values( 'C', 5000, 9999 );
insert into tDescontos Values( 'D', 10000, 19999 );
insert into tDescontos Values( 'E', 20000, 49999 );

rem ----------------------------------------------------------------

create table tClientes
( id            Number( 6 ) not null
, nome          VarChar2( 35 ) not null
, dt_nascimento Date
, endereco      VarChar2( 40 )
, cidade        VarChar2( 30 )
, estado        VarChar2( 2 )
, cep           VarChar2( 8 )
, telefone      VarChar2( 10 )
, comentarios   VarChar2( 1000 )
, constraint tclientes_id_pk primary key ( id )
, constraint tclientes_id_ck check ( id > 0 ) );

rem ----------------------------------------------------------------

insert into tClientes Values( 100, 'Amarildo Fagundes', '22-12-1976', 'Rua Carlos Eduardo Filho  111', 'São Paulo', 'SP', '52299003', '1154433267', null );
insert into tClientes Values( 110, 'Ana Maria Prado', '03-03-1971', 'Avenida Guarani 4490', 'Rio de Janeiro', 'RJ', '21223444', '2154462281', null );
insert into tClientes Values( 120, 'Antônio da Silva', '10-07-1964', 'Rua Carlos Dunnas 1213', 'São Paulo', 'SP', '05434303', '1157991238', null );
insert into tClientes Values( 130, 'Ramiro Antunes', '19-10-1961', 'Avenida Castro Alves 60', 'Rio de Janeiro', 'RJ', '21938888', '2145591454', null );
insert into tClientes Values( 140, 'Nadia Velasques', '20-01-1973', 'Rua Pinheiros 209', 'Rio de Janeiro', 'RJ', '21935503', '2144392200', null );
insert into tClientes Values( 150, 'Alfredo Fonseca', '24-04-1970', 'Avenida Tapes 2831', 'Porto Alegre', 'RS', '90440300', '5133442874', null );
insert into tClientes Values( 160, 'Jânio Marques', '11-05-1965', 'Rua Maria da Graça 22', 'São Paulo', 'SP', '54552333', '1154457300', null );
insert into tClientes Values( 170, 'José Batista', '05-02-1969', 'Rua Comendador Dutra 3420', 'Porto Alegre', 'RS', '90786500', '5133267755', null );
insert into tClientes Values( 180, 'Carlos Magno', '30-10-1971', 'Rua Anacleto Farias 312', 'São Paulo', 'SP', '05498722', '1155543437', null );
insert into tClientes Values( 190, 'João Medeiros', '15-09-1965', 'Avenida das Bromélias 449', 'Rio de Janeiro', 'RJ', '21333090', '2145567947', null );
insert into tClientes Values( 200, 'Mário Cardoso', '07-08-1977', 'Rua Guarapari 2003', 'São Paulo', 'SP', '54441003', '1145567947', null );

rem ----------------------------------------------------------------

create sequence sContratos_ID
  increment by 1
  start with 1021
  nocache;

rem ----------------------------------------------------------------

create table tContratos
( id           Number( 4 ) not null
, dt_compra    Date
, status       VarChar2( 1 )
, tclientes_id Number( 6 ) not null
, desconto     Number(  7, 2 ) constraint tcn_desconto_ck check ( desconto >= 0 )
, total        Number( 10, 2 ) constraint tcn_total_ck    check ( total    >= 0 )
, constraint tcn_tclientes_id_fk foreign key ( tclientes_id ) references tclientes ( id )
, constraint tcontratos_id_pk primary key ( id ) );

rem ----------------------------------------------------------------

insert into tContratos Values( 1000, '03-01-2005', 'A', 150, 360, 3600 );
insert into tContratos Values( 1001, '04-01-2005', 'A', 100, 225, 4500 );
insert into tContratos Values( 1002, '04-01-2005', 'A', 120, null, 1800 );
insert into tContratos Values( 1003, '04-01-2005', 'A', 160, 985, 1995 );
insert into tContratos Values( 1004, '05-01-2005', 'A', 180, null, 9000 );
insert into tContratos Values( 1005, '05-01-2005', 'A', 190, 191, 3191 );
insert into tContratos Values( 1006, '06-01-2005', 'A', 200, null, 2000 );
insert into tContratos Values( 1007, '06-01-2005', 'A', 170, 50, 1000 );
insert into tContratos Values( 1008, '06-01-2005', 'A', 100, 700, 6218 );
insert into tContratos Values( 1009, '06-01-2005', 'A', 110, null, 1200 );
insert into tContratos Values( 1010, '07-01-2005', 'A', 130, null, 2215 );
insert into tContratos Values( 1011, '07-01-2005', 'A', 140, 1500, 3000 );
insert into tContratos Values( 1012, '08-01-2005', 'A', 150, 60, 600 );
insert into tContratos Values( 1013, '08-01-2005', 'A', 100, 260, 2600 );
insert into tContratos Values( 1014, '08-01-2005', 'A', 170, null, 956 );
insert into tContratos Values( 1015, '09-01-2005', 'A', 200, null, 4200 );
insert into tContratos Values( 1016, '09-01-2005', 'A', 150, 960, 15960 );
insert into tContratos Values( 1017, '10-01-2005', 'A', 130, null, 3600 );
insert into tContratos Values( 1018, '10-01-2005', 'A', 110, null, 1912 );
insert into tContratos Values( 1019, '11-01-2005', 'A', 170, 60, 600 );
insert into tContratos Values( 1020, '12-01-2005', 'A', 180, null, 4000 );

rem ----------------------------------------------------------------

create table tCursos
( id            Number( 4 ) not null
, nome          VarChar2( 100 )
, cod_trg       VarChar2( 8 )
, preco         Number( 7, 2 ) constraint tcs_preco_ck         check ( preco >= 0 )
, carga_horaria Number( 3 )    constraint tcs_carga_horaria_ck check ( carga_horaria >= 0 )
, dt_criacao    Date
, pre_requisito Number( 4 )    constraint tcs_pre_requisito_fk references tCursos ( id )
, constraint tCursos_id_pk primary key ( id ) );

rem ----------------------------------------------------------------

insert into tCursos Values( 1, 'Introdução ao Oracle 10G I: Conceitos básicos do Oracle e SQL*PLUS, SQL e SQL Avançado', 'TO10G1', 1800, 30, '14-01-2004', null );
insert into tCursos Values( 2, 'Introdução ao Oracle 10G II:  Linguagem PL/SQL, Procedures, Funções, Packages e Database Trigers', 'TO10G2', 1800, 30, '24-01-2004', 1 );
insert into tCursos Values( 3, 'Oracle 10G Developer: Forms - Parte I', 'TF6I', 1275, 30, '13-10-2003', 2 );
insert into tCursos Values( 4, 'Oracle 10G Developer: Reports', 'TR6I', 1275, 30, '14-10-2003', 2 );
insert into tCursos Values( 5, 'Oracle 10G Developer: Forms  - Parte II Avançado', 'TF6I-A', 956, 18, '22-03-2004', 3 );
insert into tCursos Values( 45, 'SQL Standard', 'TSQLST', 1000, 20, '02-04-2004', null );
insert into tCursos Values( 6, 'SQL Standard Avançado', 'TSQLAV', 1000, 20, '18-01-2004', 45 );
insert into tCursos Values( 7, 'Otimização de Aplicativos Oracle', 'TAT8I', 956, 18, '24-03-2004', 3 );
insert into tCursos Values( 52, 'Modelagem de Dados e Projeto de Banco de Dados', 'TMDPBD', 800, 20, '18-01-2005', null );
insert into tCursos Values( 8, 'Oracle 10G Designer: Modelagem de Sistemas', 'TDR6IM', 956, 18, '04-02-2004', 52 );
insert into tCursos Values( 9, 'Oracle 10G Designer: Design e Geração do Banco de Dados', 'TDR6ID', 956, 18, '21-03-2004', 8 );
insert into tCursos Values( 10, 'Oracle 10G Designer: Design e Geração da Aplicação', 'TDR6IG', 1594, 30, '06-05-2003', 9 );
insert into tCursos Values( 11, 'Oracle 10G Designer: Design e Geração de Reports', 'TD6IREP', 956, 18, '21-03-2004', 10 );
insert into tCursos Values( 12, 'Oracle 10G Designer: Design e Geração de Aplicações para Web', 'TDR6IW', 956, 18, '21-03-2004', 11 );
insert into tCursos Values( 54, 'Oracle 10G: Administração e Arquitetura do Banco de Dados', 'TO10G3', 1800, 30, '15-03-2004', 2 );
insert into tCursos Values( 13, 'Oracle 10G: Backup e Recovery e Administração de Redes Oracle', 'TO10G4', 1800, 30, '13-12-2004', 54 );
insert into tCursos Values( 14, 'Oracle 10G: Otimização e Performance do Banco de Dados', 'TO10G5', 1800, 30, '24-01-2005', 13 );
insert into tCursos Values( 17, 'Desenvolvimento de Aplicações Web em PL/SQL', 'TDAWPL', 956, 18, '04-04-2004', 2 );
insert into tCursos Values( 19, 'Oracle 10G Discover para Administradores', 'TD31A', 956, 18, '29-03-2004', null );
insert into tCursos Values( 20, 'Oracle 10G Discover para Usuários', 'TD31U', 638, 12, '05-09-2004', null );
insert into tCursos Values( 21, 'Orientação a Objetos - Fundamentos UML, Análise e Projetos de Sistemas', 'TOOUML', 1000, 20, '09-03-2004', null );
insert into tCursos Values( 22, 'Java Fundamentals', 'TJFUND', 1000, 20, '27-02-2004', 21 );
insert into tCursos Values( 23, 'Java Advanced e Acesso a Banco de Dados', 'TJADVN', 1500, 30, '22-06-2003', 22 );
insert into tCursos Values( 48, 'Introdução ao Linux', 'TIL', 277, 16, '02-04-2004', null );
insert into tCursos Values( 27, 'Fundamentos de Administração de Sistemas Linux', 'TLFADS', 498, 30, '14-10-2004', 48 );
insert into tCursos Values( 28, 'Administração de Sistemas Linux', 'TLASLX', 498, 30, '05-11-2004', 27 );
insert into tCursos Values( 29, 'Administração de Redes Linux', 'TLARLN', 498, 30, '05-11-2004', 28 );
insert into tCursos Values( 30, 'Samba - Integração de Linux e Windows', 'TLSAMB', 665, 24, '02-09-2004', 27 );
insert into tCursos Values( 31, 'Apache - Administração de Servidor Web', 'TLAPAC', 665, 24, '17-08-2004', null );
insert into tCursos Values( 32, 'Segurança de Redes - Firewall', 'TSRF', 775, 24, '11-01-2005', null );
insert into tCursos Values( 33, 'Segurança de Redes - Ferramentas e Serviços', 'TSRFS', 775, 24, '12-01-2005', null );
insert into tCursos Values( 47, 'HTML 4', 'THTML4', 600, 20, '21-10-2004', null );
insert into tCursos Values( 40, 'JavaScript - Programação Java através de Scripts', 'TJASCR', 600, 20, '07-09-2004', 47 );
insert into tCursos Values( 34, 'Dreamweaver MX - Criação e diagramação de Web Sites', 'TDRWMX', 600, 20, '08-09-2004', 40 );
insert into tCursos Values( 35, 'Fireworks MX - Preparação de Imagens para Web', 'TFWRMX', 600, 20, '09-10-2004', null );
insert into tCursos Values( 36, 'Flash MX - Animações vetoriais para Web com som e interatividade', 'TFLSMX', 600, 20, '10-10-2004', null );
insert into tCursos Values( 37, 'Dreamweaver MX acessando Banco de Dados', 'TDDBMX', 600, 20, '17-09-2004', 34 );
insert into tCursos Values( 38, 'Dreamweaver MX Avançado - Recursos avançados em Dreamweaver  para criação de Web sites', 'TDRMXA', 600, 20, '15-09-2004', 37 );
insert into tCursos Values( 39, 'Flash MX Avançado - Recursos avançados em Flash  para criação de Web sites', 'TFLMXA', 600, 20, '17-09-2004', 36 );
insert into tCursos Values( 41, 'ASP - Criando uma Loja Virtual em Banco de Dados', 'TASP00', 1000, 20, '27-02-2004', 40 );
insert into tCursos Values( 42, 'ASP Avançado', 'TASPAV', 1000, 20, '27-02-2004', 41 );
insert into tCursos Values( 43, 'XML', 'TXML00', 1000, 20, '22-02-2004', 47 );
insert into tCursos Values( 62, 'Oracle 10G: Novas características do Oracle 10G para Administradores', 'TO10G7', 1800, 30, '11-03-2004', 62 );
insert into tCursos Values( 63, 'Oracle 10G: Novas características do Oracle 10G para Desenvolvedores', 'TO10G6', 1800, 30, '11-03-2004', 14 );
insert into tCursos Values( 50, 'StarOffice I', 'TSO-I', 332, 24, '07-03-2004', null );
insert into tCursos Values( 51, 'StarOffice II', 'TSO-II', 332, 24, '27-01-2004', 50 );
insert into tCursos Values( 49, 'PHP', 'TPHPOO', 1000, 20, '07-03-2004', 40 );
insert into tCursos Values( 55, 'PHP Avançado', 'TPHPAV', 1000, 20, '04-03-2004', 49 );
insert into tCursos Values( 56, 'Administração do Oracle 10G Application Server', 'TAOAS', 956, 18, '05-05-2004', null );
insert into tCursos Values( 57, 'Oracle 10G Portal - Construindo Portais Corporativos', 'TOPC', 956, 18, '06-05-2004', null );
insert into tCursos Values( 58, 'Oracle 10G Portal  - Construindo Portlets', 'TOPP', 956, 18, '07-05-2004', null );
insert into tCursos Values( 60, 'Gerenciamento de XML  com Java', 'TGXMLJ', 400, 8, '09-01-2004', 43 );
insert into tCursos Values( 66, 'PostgreSQL: Linguagem Procedural e Unidades de Programa', 'TPOSUP', 1000, 20, '27-04-2004', 6 );
insert into tCursos Values( 67, 'PostgreSQL: Administração do Banco de dados', 'TPOSAD', 1000, 20, '27-02-2004', 66 );
insert into tCursos Values( 71, 'Arquitetura e Projeto de Aplicações J2EE', 'TAJ2EE', 2240, 30, '05-08-2003', 22 );
insert into tCursos Values( 70, 'Padrões de Projeto J2EE', 'TPJ2EE', 2240, 30, '16-06-2003', 71 );
insert into tCursos Values( 68, 'Desenvolvimento de Aplicações J2EE', 'TDJ2EE', 2240, 30, '15-06-2003', 70 );
insert into tCursos Values( 72, 'WebSphere Administração do WebSphere Application Server V4.0', 'TWAWAS', 1200, 30, '19-01-2004', null );
insert into tCursos Values( 73, 'WebSphere Studio Application Developer V4.0 - Desenvolvimento de Servlet e JSP', 'TWSADV', 1200, 30, '19-11-2003', 72 );
insert into tCursos Values( 74, 'WebSphere Portal Server V4.0 - Desenvolvimento de Portais e Intranets', 'WSphPort', 1200, 30, '19-11-2003', 73 );
insert into tCursos Values( 75, 'ColdFusion', 'TCOLMX', 1000, 20, '26-03-2004', 47 );
insert into tCursos Values( 77, 'Freehand 10', 'TFRH10', 600, 20, '20-11-2004', null );

rem ----------------------------------------------------------------

create table tItens
( tcontratos_id Number( 4 ) not null
, seq           Number( 4 ) not null
, tcursos_id    Number( 6 )
, qtde          Number( 3 )    constraint item_qtde_ck  check ( qtde  >= 0 )
, total         Number( 8, 2 ) constraint item_total_ck check ( total >= 0 )
, constraint tit_tcontratos_id_fk     foreign key ( tcontratos_id ) references tContratos ( id )
, constraint tit_tcursos_id_fk        foreign key ( tcursos_id )    references tCursos ( id )
, constraint tit_tcontratos_id_seq_pk primary key( tcontratos_id, seq ) );

rem ----------------------------------------------------------------

insert into tItens Values( 1000, 1, 1, 1, 1800 );
insert into tItens Values( 1000, 2, 2, 1, 1800 );
insert into tItens Values( 1001, 1, 21, 1, 1000 );
insert into tItens Values( 1001, 2, 22, 1, 1000 );
insert into tItens Values( 1001, 3, 23, 1, 1500 );
insert into tItens Values( 1001, 4, 27, 1, 1000 );
insert into tItens Values( 1002, 1, 47, 1, 600 );
insert into tItens Values( 1002, 2, 40, 1, 600 );
insert into tItens Values( 1002, 3, 34, 1, 600 );
insert into tItens Values( 1003, 1, 31, 3, 1995 );
insert into tItens Values( 1004, 1, 1, 1, 1800 );
insert into tItens Values( 1004, 2, 2, 1, 1800 );
insert into tItens Values( 1004, 3, 54, 1, 1800 );
insert into tItens Values( 1004, 4, 13, 1, 1800 );
insert into tItens Values( 1004, 5, 14, 1, 1800 );
insert into tItens Values( 1005, 1, 48, 1, 277 );
insert into tItens Values( 1005, 2, 27, 1, 498 );
insert into tItens Values( 1005, 3, 28, 1, 498 );
insert into tItens Values( 1005, 4, 29, 1, 498 );
insert into tItens Values( 1005, 5, 30, 1, 665 );
insert into tItens Values( 1005, 6, 32, 1, 755 );
insert into tItens Values( 1006, 1, 45, 1, 1000 );
insert into tItens Values( 1006, 2, 6, 1, 1000 );
insert into tItens Values( 1007, 1, 52, 1, 800 );
insert into tItens Values( 1007, 2, 21, 1, 100 );
insert into tItens Values( 1007, 3, 22, 1, 100 );
insert into tItens Values( 1008, 1, 52, 1, 800 );
insert into tItens Values( 1008, 2, 8, 1, 956 );
insert into tItens Values( 1008, 3, 9, 1, 956 );
insert into tItens Values( 1008, 4, 10, 1, 1594 );
insert into tItens Values( 1008, 5, 11, 1, 956 );
insert into tItens Values( 1008, 6, 12, 1, 956 );
insert into tItens Values( 1009, 1, 47, 1, 600 );
insert into tItens Values( 1009, 2, 40, 1, 600 );
insert into tItens Values( 1010, 1, 31, 1, 665 );
insert into tItens Values( 1010, 2, 32, 1, 775 );
insert into tItens Values( 1010, 3, 33, 1, 775 );
insert into tItens Values( 1011, 1, 77, 5, 3000 );
insert into tItens Values( 1012, 1, 47, 1, 600 );
insert into tItens Values( 1013, 1, 47, 1, 600 );
insert into tItens Values( 1013, 2, 40, 1, 600 );
insert into tItens Values( 1013, 3, 43, 1, 1000 );
insert into tItens Values( 1013, 4, 60, 1, 400 );
insert into tItens Values( 1014, 1, 56, 1, 956 );
insert into tItens Values( 1015, 1, 47, 1, 600 );
insert into tItens Values( 1015, 2, 40, 1, 600 );
insert into tItens Values( 1015, 3, 34, 1, 600 );
insert into tItens Values( 1015, 4, 37, 1, 600 );
insert into tItens Values( 1015, 5, 38, 1, 600 );
insert into tItens Values( 1015, 6, 35, 1, 600 );
insert into tItens Values( 1015, 7, 36, 1, 600 );
insert into tItens Values( 1016, 1, 21, 1, 1000 );
insert into tItens Values( 1016, 2, 22, 1, 1000 );
insert into tItens Values( 1016, 3, 23, 1, 1500 );
insert into tItens Values( 1016, 4, 30, 1, 1000 );
insert into tItens Values( 1016, 5, 31, 1, 1500 );
insert into tItens Values( 1016, 6, 32, 1, 1000 );
insert into tItens Values( 1016, 7, 33, 1, 2240 );
insert into tItens Values( 1016, 8, 71, 1, 2240 );
insert into tItens Values( 1016, 9, 70, 1, 2240 );
insert into tItens Values( 1016, 10, 68, 1, 2240 );
insert into tItens Values( 1017, 1, 1, 1, 1800 );
insert into tItens Values( 1017, 2, 2, 1, 1800 );
insert into tItens Values( 1018, 1, 57, 1, 956 );
insert into tItens Values( 1018, 2, 58, 1, 956 );
insert into tItens Values( 1019, 1, 77, 1, 600 );
insert into tItens Values( 1020, 1, 45, 1, 1000 );
insert into tItens Values( 1020, 2, 6, 1, 1000 );
insert into tItens Values( 1020, 3, 66, 1, 1000 );
insert into tItens Values( 1020, 4, 67, 1, 1000 );

rem ----------------------------------------------------------------

create view vtop_clientes
as
select tcl.nome         cliente
     , Sum( tcn.total ) total
  from tclientes  tcl
     , tcontratos tcn
where tcl.id = tcn.tclientes_id
group by tcl.nome
       , tcn.total
order by 2 desc;

rem ----------------------------------------------------------------

create view vcontratos_top
as
select id, desconto, total
  from tcontratos
 where total > 5000;

rem ----------------------------------------------------------------

create view vcursos_basicos
as
select id, cod_trg trg, preco valor
  from tcursos
 where pre_requisito is null;

rem ----------------------------------------------------------------

create view vcontratos ( data, min, max, avg )
as 
select dt_compra, Min( total ), Max( total ), Avg( total )
  from tcontratos
 group by dt_compra;

rem ----------------------------------------------------------------

create view vcursos1000ck
as
select *
  from tcursos
 where preco = 1000
  with check option constraint vcursos1000_ck;

rem ----------------------------------------------------------------

create view vcursos1000ro
as
select *
  from tcursos
 where preco = 1000
  with read only;

rem ----------------------------------------------------------------
