SELECT * FROM V$VERSION
/
SELECT version FROM V$INSTANCE
/
SET SERVEROUTPUT ON;
BEGIN DBMS_OUTPUT.PUT_LINE(DBMS_DB_VERSION.VERSION || '.' || DBMS_DB_VERSION.RELEASE); END;
/

SELECT *FROM v$parameter ORDER BY 2 DESC