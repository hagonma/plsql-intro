CREATE PROCEDURE get_employee_details @salary nvarchar(30)
AS
BEGIN
   SELECT * FROM ib_employee WHERE salary = @salary;
END;


exec get_employee_details(30000);


select employee_id, salary,
  dense_rank() over (
    partition by department_id order by salary desc nulls last
    ) as dense_rank
from employees
order by 2, dense_rank


SET SERVER OUTPUT ON
DECLARE
BEGIN
FOR i IN REVERSE 1..99
LOOP
IF Mod(i,3) = 0 THEN
DBMS_OUTPUT.PUT_LINE(i);
END IF;
END LOOP;
END;
/


begin
declare z number(10);
begin
z:= '&x' + '&y';
dbms_output.put_line(z);
exception 
when value_error then 
dbms_output.put_line('enter numeric data value for x & y only');
end;
/