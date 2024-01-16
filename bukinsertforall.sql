select * from pro_tb;
select * from test_obj;
create table test_obj TABLESPACE users
as
select * from pro_tb
where sers ='"Confectionery';


create table test1_obj TABLESPACE users
as
select * from pro_tb
where 1=2;


drop table test_obj;
select count(*) from test_obj;
/
--------------------------------------------------------------------------------
declare
type obj_tb is table of test_obj%rowtype;
obj obj_tb:=obj_tb();
start_time number;
end_time number;
begin
select * BULK COLLECT into obj from test_obj;

EXECUTE IMMEDIATE 'truncate table test_obj';

start_time:=dbms_utility.get_time;

FORALL i in obj.first.. obj.last
insert into test_obj values obj(i);

-- testing
--insert into test_obj values ('CMIQ.SE901305',1994.06,648.4,'FINAL','Index','CPI','CPI Level 3 Classes for New Zealand','Confectionery');
end_time:=dbms_utility.get_time;

dbms_output.put_line('bulking time  '||to_char(end_time)||to_char(start_time));

dbms_output.put_line('bulking time  '||to_char(end_time-start_time));


start_time:=dbms_utility.get_time;

FORALL i in obj.first.. obj.last
insert into test1_obj values obj(i);

-- testing
--insert into test_obj values ('CMIQ.SE901305',1994.06,648.4,'FINAL','Index','CPI','CPI Level 3 Classes for New Zealand','Confectionery');
end_time:=dbms_utility.get_time;

dbms_output.put_line('bulking time  '||to_char(end_time)||to_char(start_time));


end;
/

set SERVEROUTPUT ON;



