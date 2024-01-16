

--regexp_ like is asvanced version of like opr
--regexp_like --its return rows that match a regular expression
--REGEXP_LIKE

select * from regexp;


.  --> somthing a.c
--3rd parameter i is make case insensitive 
SELECT * FROM employees WHERE REGEXP_LIKE(first_name,'ste(v|ph)en','i');
SELECT * FROM employees WHERE REGEXP_LIKE(first_name,'ste(v|ph)en');

create table reg_tb (rgname varchar2(20), reid number);
insert into reg_tb values('heki',100);
insert into reg_tb values('deki',101);
insert into reg_tb values('he45fk',102);
insert into reg_tb values('jeki231',103);
insert into reg_tb values('234feki',104);
insert into reg_tb values('3445',105);
insert into reg_tb values('heki',106);
select * from reg_tb;

SELECT * FROM reg_tb WHERE regexp_like (rgname,'[a-z]');
SELECT * FROM reg_tb WHERE regexp_like (rgname,'^[a-z]+');
SELECT * FROM reg_tb WHERE regexp_like (rgname,'[0-1]+');


drop table reg_tb;
create table reg_tb (rgname varchar2(20), reid number);
insert into reg_tb values('color',100);
insert into reg_tb values('colour',101);
insert into reg_tb values('colours',102);
insert into reg_tb values('coloress',103);
insert into reg_tb values('colouress',104);
insert into reg_tb values('colored',105);
insert into reg_tb values('coloured',106);
select * from reg_tb;


SELECT * FROM reg_tb WHERE regexp_like (rgname,'colou?r$');



SELECT * FROM reg_tb WHERE regexp_like (rgname,'[0-9]+');
SELECT * FROM reg_tb WHERE regexp_like (rgname,'[^0-9]');
/

+   --> more than one letter 

--------------------------------------------------------------------------------
SELECT * FROM employees WHERE REGEXP_LIKE(phone_number,'[0-9]{1}.[0-9]{3}.[0-9]{3}');
SELECT * FROM employees; WHERE REGEXP_LIKE(phone_number,'[0-9]{3}/.[0-9]{2}/.[0-9]{3}');

SELECT phone_number FROM employees; WHERE REGEXP_LIKE(phone_number,'^[0-9]{3}');


SELECT REGEXP_substr('SDF56789','...',1,2) FROM employees;




SELECT * FROM employees WHERE REGEXP_LIKE(first_name,'A+');
? --> zero or one


SELECT * FROM employees; WHERE REGEXP_LIKE(first_name,'n');



SELECT * FROM emp WHERE REGEXP_LIKE(first_name,'Al');

SELECT 'Aagaryyhbj' FROM dual WHERE REGEXP_LIKE(LOWER('agaryyhbj'),'^A');    -- (^^) is starting letter
SELECT 'Aagaryyhbj' FROM dual WHERE REGEXP_LIKE('Aagaryyhbj','^^A');    -- (^^) is starting letter


SELECT * FROM employees WHERE REGEXP_LIKE(LOWER(first_name),'^a');    -- (^^) is starting letter
SELECT * FROM emp WHERE REGEXP_LIKE(LOWER(first_name),'a$');    -- ($$) in ending letter

SELECT * FROM employees WHERE REGEXP_LIKE(LOWER(first_name),'^a|^c');    -- ('^a|^c') is starting with two letter a and c
SELECT * FROM employees WHERE REGEXP_LIKE(first_name,'s{2}','i');    -- L 1 times accur i is used to case sensitive
SELECT * FROM emp WHERE REGEXP_LIKE(LOWER(first_name),'l{1}','i');    -- L 2 times accur
SELECT * FROM employees WHERE REGEXP_LIKE(LOWER(first_name),'e{2}','i');    -- E 2 times accur

--REGEXP_COUNG

SELECT REGEXP_COUNT('oracle found at 1969-70. its developed by c language it is a schema object','s') "1st"  FROM dual;


SELECT REGEXP_COUNT('oracle found at 1969-70. Its developed by c language it is a schema object','it',1,'i') FROM dual;

SELECT REGEXP_COUNT('oracle found at 1969-70. Its developed by c language it is a schema object','it|is',1,'i') FROM dual;
------------------------------------------------------------------------------------
SELECT REGEXP_COUNT('oracle found at 1969-70. Its developed by c language it is a schema object','[a-z0-9]+') FROM dual;
-------------------------------------------------------------------------------------------------

select regexp_count('hai dear pathi','^[a-z]') from dual;


----REGEXP_SUBSTR

select REGEXP_SUBSTR('TechOnTheNet is a great resource in 2022','(\S*)(\s)')from dual;
select * from emp_task
order by employee_id;
SELECT 
(select REGEXP_SUBSTR('TechOnTheNet is a great resource in 2022','(\S*)(\s)',1,1)  from dual) "1st",
(select REGEXP_SUBSTR('TechOnTheNet is a great resource in 2022','(\S*)(\s)',1,2)  from dual) "2st",
(select REGEXP_SUBSTR('TechOnTheNet is a great resource in 2022','(\S*)(\s)',1,3)  from dual) "3st",
(select REGEXP_SUBSTR('TechOnTheNet is a great resource in 2022','(\S*)(\s)',1,4)  from dual) "4st",
(select REGEXP_SUBSTR('TechOnTheNet is a great resource in 2022','(\S*)(\s)',1,5)  from dual) "5st",
(select REGEXP_SUBSTR('TechOnTheNet is a great resource in 2022','(\S*)(\s)',1,6)  from dual) "6st",
(select REGEXP_SUBSTR('TechOnTheNet is a great resource in 2022','(\d)(\d)(\d)(\d)',1,1)  from dual) "7st",
(select REGEXP_SUBSTR('TechOnTheNet is a great resource in 2022','(\w)',1,1)  from dual) "6st"
 from dual;
-------------------------------------------------------------------------/
/
select REGEXP_SUBSTR('TechOnTheNet is a great resource in 2022','(\S)',3)  from dual;
select regexp_substr('http://www.gresrggs.com','[a-z0-9],1') from dual;


select regexp_substr('http://www.gresrggs2344.com','www\.[a-z0-9]+\.[a-z]+') from dual;
select regexp_substr('http://www.gresrggs2344.com','[0-9]+') from dual;
/
select regexp_substr('http://www.gresrggs2344.com','[^0-9]+') from dual;
select regexp_substr(phone_number,'\.[0-9]+',1,2) from employees;   --SELECT THE LETTERS WITH PATTERN MATCHING..
select regexp_substr(phone_number,'[0-9]+',1,3) from employees;   --SELECT THE LETTERS WITH (515)PATTERN MATCHING..
select regexp_substr(phone_number,'[0-9]+\.',1,2) from employees;   --SELECT THE LETTERS WITH (515.)PATTERN MATCHING..

SELECT phone_number FROM employees;


select regexp_substr('hai dear pathi','[a-z]',1,level) from dual
connect by level<=length( 'hai dear pathi');

select regexp_substr('hai dear pathi','[a-z]+',1,level) from dual
connect by level<=regexp_count('hai dear pathi','[a-z]+') ;

select regexp_count('hai dear pathi','[a-z]+') from dual;





515.123.4567
515.123.4568
515.123.4569
590.423.4567
590.423.4568
590.423.4569
590.423.4560
590.423.5567
515.124.4569



FROM dual;

----REGEXP_INSTR
                                                                   
select REGEXP_INSTR('TechOnTheNet is a great netresource in 2022','net'--pattern,1--starting pos,1--nth appearance,0--,'i')from dual;;
;
select REGEXP_INSTR('TechOnTheNet is a great netresource in 2022','net',1,1,0,'i')from dual;


select REGEXP_INSTR('TechOnTheNet is a great netresource in 2022','t',1,2,0)from dual;



------REGEXP_REPLACE
select REGEXP_REPLACE('TechOnTheNet is a great resource in 2022','^(\S*)(\s)','please check ') "1st"from dual;

select REGEXP_REPLACE('TechOnTheNet is a great resource in 2022','TechOnTheNet','please check ') "1st"from dual;

select REGEXP_REPLACE('TechOnTheNet is a great resource icn 2022','resource','Organisation ') "1st"from dual;
select regexp_replace('g!gf@h$j#gj','[^a-z]+',' ') from dual;
select regexp_replace('g!gf@h$j#gj','[a-z]+','') from dual;


--regexp_substr --11g

--input =a,b,c,d,e
--result =insert into table one by one

drop table s1 purge;
create table s1(sname varchar2(40));


select regexp_substr('hi,dr,pa','[a-z]+',1,level) from dual
connect by level<=regexp_count('hi,dr,pa','[a-z]+') ;


select REGEXP_SUBSTR('a,d,f,g,h','[a-z]+',1,level) from dual
connect by level<=regexp_count('a,d,f,g,h','[a-z]+') ;
           
create or replace procedure sp_insert(p_input in varchar2)
as
begin  
for i in (   select REGEXP_SUBSTR(p_input,'[a-z]+',1,level)  value from dual
             connect by level<=regexp_count(p_input,'[a-z]+')    )
loop
insert into s1 values(i.value);
end loop;

end;
/





exec sp_insert('as,ds,fd,fd,fdd');

select * from s1;

insert into s1(sname)(select REGEXP_SUBSTR('as,ds,fd,fd,fdd','[^,]+',1,level) as value from dual
           connect by REGEXP_SUBSTR('as,ds,fd,fd,fdd','[^,]+',1,level) is not null);
 

----------------------------------------------------------------------------------------

ID:GHF45234
ID:KSJ34456
ID:LKS23666
ID:JDD65788

drop table s1 purge;
create table s1(sname varchar2(3) constraints chk_len1 check(length(sname)=3),
                ref_val number(3)constraints chk_len2 check(length(ref_val)=2),
                b_year number(3) constraints chk_len3 check(length(b_year)=3));



create or replace procedure sp_insert(p_input in varchar2)
as
cnts1 number;
cnts2 number;

begin 

select count(*) into cnts1  from s1;

if (length(p_input)=8) then 

for i in (    select REGEXP_SUBSTR(p_input,'...',1,1) sname, 
                     REGEXP_substr(p_input,'..',2,2)ref_val,
                     REGEXP_substr(p_input,'...',3,2)b_year from dual
    )
loop
insert into s1 values(i.sname,i.ref_val,i.b_year);
end loop;
else
dbms_output.put_line('give the proper id value');
end if;

select count(*) into cnts2  from s1;
if (cnts1 < cnts2) then
dbms_output.put_line('values inserted in s1 table');
else 
dbms_output.put_line('values not inserted in s1 table');

end if ;
end;
/

set serveroutput on;
exec sp_insert('QWG83258');






select * from s1;

 select REGEXP_SUBSTR('JDD65788','...',1,1), REGEXP_substr('JDD65788','..',2,2),REGEXP_substr('JDD65788','...',3,2) from dual;



create sequence name_seq
start with 1
increment by 1
maxvalue 26
minvalue 1
cycle;

select regexp_substr('abcdefghijklmnopqrstuvwxyz','[a-z]',1,name_seq.nextval) from dual
select regexp_substr('0123456789','[a-z]',1,name_seq.nextval) from dual

connect by level<=200;
select
(select REGEXP_SUBSTR('TechOnTheNet is a great resource in 2022','(\S*)(\s)',1,6)  from dual) "6st",
(select REGEXP_SUBSTR('TechOnTheNet is a great resource in 2022','(\d)(\d)(\d)(\d)',1,1)  from dual) "7st",
(select REGEXP_SUBSTR('TechOnTheNet is a great resource in 2022','(\w)',1,1)  from dual) "6st"
 from dual;

select regexp_substr('abcdefghijklmnopqrstuvwxyz','[a-z]',1,name_seq.nextval) from dual;


select REGEXP_SUBSTR('ABCDEFGHILKLMNOPQRSTUVWXYZ','[A-Z]',1,1)name_seq.nextval  from dual

