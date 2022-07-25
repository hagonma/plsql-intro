-- Simple PLSQL to open a file,
-- write two lines into the file,
-- and close the file
set serveroutput on;
declare
  fhandle  utl_file.file_type;
begin
  fhandle := utl_file.fopen(
                'UTL_DIR'     -- File location
              , 'test.log' -- File name
              , 'w' -- Open mode: w = write. 
                  );
 
  utl_file.put(fhandle, 'Hello world!'
                      || CHR(10));
  utl_file.put(fhandle, 'Hello again!');
 
  utl_file.fclose(fhandle);
exception
  when others then
    dbms_output.put_line('ERROR: ' || SQLCODE 
                      || ' - ' || SQLERRM);
    raise;
end;
/


Select *from user_source

Select *from all_source