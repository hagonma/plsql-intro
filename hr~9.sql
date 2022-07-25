--SELECT DBMS_METADATA.GET_DDL('TABLE','EMPLOYEES') FROM USER_TABLES;

select dbms_metadata.get_ddl('TABLE','EMPLOYEES','HR') from dual;

select to_char(to_date('29-Mar-2013','dd-mon-yyyy'),'J') as julian from dual;


spool C:\tmp\orcl\hr_employee.sql

select dbms_metadata.get_ddl('TABLE','EMPLOYEES','HR') from dual;

spool off;
