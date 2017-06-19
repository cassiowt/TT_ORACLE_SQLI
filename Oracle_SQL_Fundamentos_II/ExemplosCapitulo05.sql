-- Record set

set serveroutput on
ACCEPT pid PROMPT 'Digite o Id do cliente: '
DECLARE
cliente_record   tclientes%rowtype;
BEGIN
SELECT  * 
INTO    cliente_record
FROM    tclientes
WHERE   id = &pid;
DBMS_OUTPUT.PUT_LINE(cliente_record.id || ' ' || cliente_record.nome || ' ' || 
cliente_record.cidade || ' ' || cliente_record.estado);
END;

-- Associative Array

Set Serveroutput On
set verify off
Declare
  Type  Numero_Table_Type  Is Table Of  Integer(2)
  Index By Binary_Integer;
  numero_table  numero_table_type;
Begin
  For  I In  1..10  Loop
     Numero_Table(I) := I;
  End Loop;
  -- Processa outras coisas
  For  I In  1..10  Loop
     Dbms_Output.Put_Line('Associative Array: Indice = ' || To_Char(I) 
     || ', Valor = ' || TO_CHAR(Numero_Table(I)));
  End Loop;
End;

-- Associative Array

Set Serveroutput On
set verify off
DECLARE
   TYPE tclientes_table_type IS TABLE OF tclientes%ROWTYPE
      INDEX BY BINARY_INTEGER;

   tclientes_table   tclientes_table_type;
   
Begin
  For  I In  1..10  Loop
     tclientes_table(I).id := I;
     tclientes_table(I).nome := I || '-a';
  End Loop;
   For  I In  1..10  Loop
     Dbms_Output.Put_Line('Id = ' || TO_CHAR(tclientes_table(I).id) || ', Nome = ' || tclientes_table(I).nome);
  End Loop;
End;

-- Nested Table

Set Serveroutput On
set verify off
Declare
  Type  Numero_Table_Type  Is Table Of  Integer(2);

  numero_table  numero_table_type := numero_table_type();
Begin
  For  I In  1..10  Loop
     numero_table.extend;
     Numero_Table(I) := I;
  End Loop;
  -- Processa outras coisas
  For  I In  1..10  Loop
     Dbms_Output.Put_Line('Nested Table: Indice = ' || To_Char(I) 
     || ', Valor = ' || TO_CHAR(Numero_Table(I)));
  End Loop;
End;

-- Varrays

Set Serveroutput On
set verify off
Declare
  Type  Numero_Table_Type  Is VARRAY (10)  Of  Integer(2);

  numero_table  numero_table_type := numero_table_type();
Begin
  For  I In  1..10  Loop
     numero_table.extend;
     Numero_Table(I) := I;
  End Loop;
  -- Processa outras coisas
  For  I In  1..10  Loop
     Dbms_Output.Put_Line('Varyng Array: Indice = ' || To_Char(I) 
     || ', Valor = ' || TO_CHAR(Numero_Table(I)));
  End Loop;
End;

-- Exemplos

set serveroutput on
DECLARE
  TYPE numero_table_type IS TABLE OF INTEGER(2);
  numero_table  numero_table_type := numero_table_type();
BEGIN
  numero_table.extend(10);
  FOR i IN 1..10  LOOP
      numero_table(i) := i;
  END LOOP;
  numero_table.delete(7);
  FOR i IN numero_table.first..numero_table.last  LOOP
      IF  numero_table.exists(i)  THEN  
          DBMS_OUTPUT.PUT_LINE('Numero =  ' || TO_CHAR(numero_table(i)));
      END IF;
  END LOOP;
END;
/