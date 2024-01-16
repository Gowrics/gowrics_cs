--date data types

--INTERVAL  --->interval year to month
            --->interval day to seconds
            
drop table candidated;
truncate table candidated;
create table candidated(
                        cnd_id  number not null,
                        cnd_name varchar2(20) not null,
                        cnd_job varchar2(20) not null,
                        cnd_expr interval year to month, primary key (cnd_id),
                        meeting_time  interval day to second
                        );


alter table candidates add meeting_time interval day to second;
insert into candidated values(1,'ravi','manager',interval '12-03' year to month,interval  '01 02:12:09' day to second);
insert into candidated values(2,'kavi','ass_manager',interval '09-09' year to month,interval '01 04:10' day to minute);
insert into candidated values(3,'yavi','hr_manager',interval '04' year  , interval '12' day );
insert into candidated values(4,'gavi','fn_manager',interval '250'month , interval '05 04' day to hour);
insert into candidated values(5,'lavi','sales_manager',interval '12-00' year to month,interval '03 12:30' day to minute);

select * from candidated;

`````````````````````````````````````````````````````````````````````````````````
--set verify on

> select &a + &b from dual;
Enter value for a: 12
Enter value for b: 12
old   1: select &a + &b from dual
new   1: select 12 + 12 from dual

     12+12
----------
        24

SQL> set verify off;               


SQL> select &a + &b from dual;
Enter value for a: 20
Enter value for b: 30

     20+30
----------
        50
`````````````````````````````````````````````````````````````````````````````
--flashback

select * from 1;
drop table t1;   -- can recover

drop table emp1 purge;  --cannot recover

flashback table emp1 to before drop;
rollback;

``````````````````````````````````````````````````````````````````````````````;
--we can use where cls and having cls together

select job_id, sum(salary) from employees
where  job_id in('AC_MGR',
'AD_ASST','AD_PRES','AD_VP')
group by job_id
having sum(salary)>=10000;

select distinct job_id from employees;

``````````````````````````````````````````````````````````````````````````````````


create  table t1(ids number);

insert into t1 values(10);
insert into t1 values(20);
insert into t1 values(30);
insert into t1 values('');
insert into t1 values(50);
insert into t1 values(20);

select * from t1;


select count(*) "1s", count(ids) "2s", count(1)"3s", count(null) "4s",count(distinct ids) "5s" from t1;
``````````````````````````````````


declare
a number;
procedure squr (x in out number) is
begin
x:=x*x;
end;
begin
a:=20;
squr(a);
 dbms_output.put_line('sq of the 10 is  :'||a);
end;
/


