SELECT DISTINCT Owner, Object_Type, Object_Name FROM DBA_Objects_AE
     WHERE  Object_Type IN ('PACKAGE', 'TYPE')
     ORDER BY Owner, Object_Type, Object_Name;
     /