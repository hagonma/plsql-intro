DECLARE
   c_limit PLS_INTEGER := 10;

   CURSOR employees_cur
   IS
      SELECT employee_id
        FROM employees
       WHERE department_id = 50;

   TYPE employee_ids_t IS TABLE OF 
      employees.employee_id%TYPE;

   l_employee_ids   employee_ids_t;
BEGIN
   OPEN employees_cur;

   LOOP
      FETCH employees_cur
      BULK COLLECT INTO l_employee_ids
      LIMIT c_limit;

      DBMS_OUTPUT.PUT_LINE (l_employee_ids.COUNT || ' fetched');

      EXIT WHEN l_employee_ids.COUNT = 0;
   END LOOP;
END;
/


DECLARE
        vEmployeeName   EMPLOYEES.First_Name%TYPE;
BEGIN
        SELECT first_name||' '||last_name "Name" 
        INTO   vEmployeeName
        FROM   EMPLOYEES
        WHERE  RowNum = 1;
        
        DBMS_OUTPUT.PUT_LINE(vEmployeeName);
END;
/


DECLARE
        rEmployee     Employees%ROWTYPE;
BEGIN
        rEmployee.first_Name := 'Matt';
        rEmployee.salary := 3100;
        
        DBMS_OUTPUT.PUT_LINE(rEmployee.first_Name);
        DBMS_OUTPUT.PUT_LINE(rEmployee.salary);
END;
/


