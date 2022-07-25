SET LINESIZE 1000 TRIMSPOOL ON PAGESIZE 0 FEEDBACK OFF

SPOOL c:\tmp\orcl\emp.csv

SELECT employee_id || ',' ||
       first_name || ' ' || last_name || ',' ||
       job_id || ',' ||
       TO_CHAR(hire_date,'DD-MON-YYYY') || ',' ||
       salary || ',' ||
       department_id
FROM   employees
ORDER BY first_name;

SPOOL OFF

SET PAGESIZE 14

/








CREATE OR REPLACE PROCEDURE EMP_CSV AS
  CURSOR c_data IS
    SELECT empno,
           ename,
           job,
           mgr,
           TO_CHAR(hiredate,'DD-MON-YYYY') AS hiredate,
           sal,
           comm,
           deptno
    FROM   emp
    ORDER BY ename;
    
  v_file  UTL_FILE.FILE_TYPE;
BEGIN
  v_file := UTL_FILE.FOPEN(location     => 'EXTRACT_DIR',
                           filename     => 'emp_csv.txt',
                           open_mode    => 'w',
                           max_linesize => 32767);
  FOR cur_rec IN c_data LOOP
    UTL_FILE.PUT_LINE(v_file,
                      cur_rec.empno    || ',' ||
                      cur_rec.ename    || ',' ||
                      cur_rec.job      || ',' ||
                      cur_rec.mgr      || ',' ||
                      cur_rec.hiredate || ',' ||
                      cur_rec.empno    || ',' ||
                      cur_rec.sal      || ',' ||
                      cur_rec.comm     || ',' ||
                      cur_rec.deptno);
  END LOOP;
  UTL_FILE.FCLOSE(v_file);
  
EXCEPTION
  WHEN OTHERS THEN
    UTL_FILE.FCLOSE(v_file);
    RAISE;
END;
/


-- Query.
EXEC csv.generate('UTL_DIR', 'emp1.csv', p_query => 'SELECT * FROM employees');

-- REF CURSOR.
DECLARE
  l_refcursor  SYS_REFCURSOR;
BEGIN
  OPEN l_refcursor FOR
    SELECT * FROM employees;

  csv.generate_rc('UTL_DIR','emp2.csv', l_refcursor);
END;
/


spool C:\tmp\orcl\sql_out.txt

select employee_id, first_name, salary from employees where department_id= 100;

spool off;




