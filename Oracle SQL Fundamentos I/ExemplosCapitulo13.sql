select * from user_views;

desc vtop_clientes;

select tcl.nome         cliente
     , Sum( tcn.total ) total
  from tclientes  tcl
     , tcontratos tcn
where tcl.id = tcn.tclientes_id
group by tcl.nome
       , tcn.total
order by 2 desc;

delete from pessoas where id_pessoa = 100;
select ROWNUM, p.* from pessoas p order by id_pessoa;