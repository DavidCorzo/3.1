select * from dual;

declare
  x number;
  cursor cl is select owner, object_name, object_type from dba_objects;
begin
  for i in cl loop
    select count(*) into x from dba_objects;
    --dbms_session.sleep(1);
  end loop;
end;