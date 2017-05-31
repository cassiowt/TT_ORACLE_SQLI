accept puser prompt 'Nome do usuario: '
drop user &puser cascade;
create user &puser
identified by &puser
default tablespace users
temporary tablespace temp
quota 0 on system
quota unlimited on users;

grant connect, resource, create view to &puser;


