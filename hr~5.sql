create or replace procedure sp1
is 
begin
dbms_output.put_line('Executing sp1..');
dbms_output.put_line(RPAD ('#',25,'#'));
dbms_output.put_line(dbms_utility.format_call_stack);
end;
/

create or replace procedure sp2
is 
begin
dbms_output.put_line('Executing sp2..');
dbms_output.put_line('Calling sp1..');
dbms_output.put_line(RPAD ('#',25,'#'));
sp1;
end;
/

create or replace procedure sp3
is 
begin
dbms_output.put_line('Executing sp3..');
dbms_output.put_line('Calling sp2..');
dbms_output.put_line(RPAD ('#',25,'#'));
sp2;
end;
/

set SERVEROUTPUT ON

begin
sp3;
end;