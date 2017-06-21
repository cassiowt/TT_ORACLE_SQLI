create or replace PACKAGE pck_cliente
IS
  
  PROCEDURE insere_cliente (pid       IN tclientes.id%TYPE,
                            pnome     IN tclientes.nome%TYPE,
                            pendereco IN tclientes.endereco%TYPE,
                            pcidade   IN tclientes.cidade%TYPE,
                            pestado   IN tclientes.estado%TYPE);
  
  PROCEDURE remove_cliente (pid IN tclientes.id%TYPE);

  PROCEDURE exibe_cliente  (pid     IN OUT tclientes.id%TYPE,
                            pnome      OUT tclientes.nome%TYPE,
                            pendereco  OUT tclientes.endereco%TYPE,
                            pcidade    OUT tclientes.cidade%TYPE,
                            pestado    OUT tclientes.estado%TYPE);
                            
  FUNCTION existe_cliente( pId IN tclientes.id%TYPE) RETURN BOOLEAN;
  
END pck_cliente;
/

create or replace PACKAGE BODY pck_cliente
IS
   PROCEDURE insere_cliente (pid       IN tclientes.id%TYPE,
                             pnome     IN tclientes.nome%TYPE,
                             pendereco IN tclientes.endereco%TYPE,
                             pcidade   IN tclientes.cidade%TYPE,
                             pestado   IN tclientes.estado%TYPE)
   IS
   BEGIN
     IF( NOT existe_cliente(pid) ) THEN
         INSERT INTO tclientes (id, nome, endereco, cidade, estado)
         VALUES ( pid, pnome, pendereco, pcidade, pestado);
     ELSE
         RAISE too_many_rows;
     END IF;
   EXCEPTION
     WHEN no_data_found THEN
       RAISE_APPLICATION_ERROR(-20001, 'Cliente Inexistente! ');
     WHEN too_many_rows THEN
       RAISE_APPLICATION_ERROR(-20002, 'Cliente Duplicado! ');
    WHEN others THEN
      RAISE_APPLICATION_ERROR(-20003, 'Exce��o Desconhecida!'||SQLCODE||' '
                                     ||SQLERRM);
  END insere_cliente;
 
  PROCEDURE remove_cliente(pid IN tclientes.id%TYPE)
  IS
   BEGIN
     IF (existe_cliente(pid)) THEN
        DELETE FROM tclientes
         WHERE id = pid;
     ELSE 
        RAISE no_data_found;
     END IF;
   EXCEPTION
     WHEN no_data_found THEN
       RAISE_APPLICATION_ERROR(-20001, 'Cliente Inexistente! ');
     WHEN too_many_rows THEN
       RAISE_APPLICATION_ERROR(-20002, 'Cliente Duplicado! ');
    WHEN others THEN
      RAISE_APPLICATION_ERROR(-20003, 'Exce��o Desconhecida!'||SQLCODE||' '
                                     ||SQLERRM);
  END;
  PROCEDURE exibe_cliente(pid     IN OUT tclientes.id%TYPE,
                          pnome      OUT tclientes.nome%TYPE,
                          pendereco  OUT tclientes.endereco%TYPE,
                          pcidade    OUT tclientes.cidade%TYPE,
                          pestado    OUT tclientes.estado%TYPE)
  IS
  BEGIN
     IF (existe_cliente(pid)) THEN
        Select id, nome, endereco, cidade, estado 
          into pid, pnome, pendereco, pcidade, pestado
          FROM tclientes
         WHERE id = pid;
         
     ELSE 
         RAISE no_data_found;
     END IF;
  EXCEPTION
     WHEN no_data_found THEN
       RAISE_APPLICATION_ERROR(-20001, 'Cliente Inexistente! ');
     WHEN too_many_rows THEN
       RAISE_APPLICATION_ERROR(-20002, 'Cliente Duplicado! ');
    WHEN others THEN
      RAISE_APPLICATION_ERROR(-20003, 'Exce��o Desconhecida!'||SQLCODE||' '
                                     ||SQLERRM);
  END;
  
  FUNCTION existe_cliente( pId IN tclientes.id%TYPE) RETURN BOOLEAN
  IS
    vvar   NUMBER(1);
  BEGIN
    SELECT 1
      INTO   vvar
      FROM   tclientes
     WHERE  id = pId;
 
    RETURN( TRUE );

  EXCEPTION
    WHEN others THEN
      RETURN( FALSE );
  END;
 END pck_cliente;
 /
