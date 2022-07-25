select owner
, object_type
, status
from all_objects
where object_name = 'UTL_FILE';

select *
from all_tab_privs
where table_name = 'UTL_FILE';

select *from all_objects where owner = 'SYS' and object_type = 'PROCEDURE'
