select cs.nome
,      cs.estado 
 from tclientes cs
where cs.estado != 'SP';

select cs.nome
,      cs.estado 
 from tclientes cs
where cs.estado in('SP', 'RS');


select T.total
,      T.desconto
,      T.total - T.desconto
,      T.ID 
  from tcontratos t
  where T.total > 2000;

select T.total
,      T.desconto
,      T.total - nvl(T.desconto, 0) "Preço Curso"
,      T.ID 
  from tcontratos t
  where T.total > 2000
    and T.dt_compra = '10/01/05';



select T.total
,      T.desconto
,      T.total - nvl(T.desconto, 0) "Preço Curso"
,      T.ID 
  from tcontratos t
  where T.total between 2000 and 3000;

select T.total
,      T.desconto
,      T.total - nvl(T.desconto, 0) "Preço Curso"
,      T.ID 
  from tcontratos t
  where T.total in(2000,2215,3600,1100 );


select T.total
,      T.desconto
,      T.total - nvl(T.desconto, 0) "Preço Curso"
,      T.ID 
  from tcontratos t
  where T.total like '2%';


select cs.nome
,      cs.estado 
 from tclientes cs
where cs.nome like '%';



select T.total
,      T.desconto
,      T.total - nvl(T.desconto, 0) "Preço Curso"
,      T.ID 
  from tcontratos t
  where T.desconto is not null;
  
  
  select T.total
,      T.desconto
,      T.total - nvl(T.desconto, 0) "Preço Curso"
,      T.ID 
  from tcontratos t
  where T.total > 2000
    and T.dt_compra < '10/01/05'
    and T.desconto is null or T.desconto = 191;

 select T.total
,      T.desconto
,      T.total - nvl(T.desconto, 0) "Preço Curso"
,      T.ID 
  from tcontratos t
  where T.total > 2000
    and T.dt_compra < '10/01/05'
    and T.desconto is not null or T.desconto = 191 -20;
    
    
    
    SELECT c.preco, c.cod_trg, C.pre_requisito
      FROM tcursos c
     WHERE C.preco < 750 
       or  C.preco > 1500  and C.pre_requisito is null;
        

select cs.estado 
,      cs.nome     
 from tclientes cs
 order by cs.estado, cs.nome desc;

select cs.estado 
,      cs.nome
,      cs.*
 from tclientes cs
 order by 5 desc;




 select T.total
,      T.desconto
,      T.total - nvl(T.desconto, 0) "Preço Curso"
,      T.ID 
  from tcontratos t
order by 2 nulls FIRST;  