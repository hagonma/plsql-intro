select *
from table(csv_util_pkg.clob_to_csv(httpuritype('http://www.foo.example/bar.csv').getclob()))


--alter session set "_ORACLE_SCRIPT"=true;


create user hagonma identified by hagonma;
GRANT CONNECT TO hagonma;
GRANT CONNECT, RESOURCE, DBA TO hagonma;
GRANT CREATE SESSION TO hagonma;
GRANT ANY PRIVILEGE TO hagonma;
GRANT UNLIMITED TABLESPACE TO hagonma;