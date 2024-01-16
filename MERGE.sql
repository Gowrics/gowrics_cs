MERGE tmnt is very populr clause itnis used to handle insert update delete stmt in a single transaction
without any singke transaction.





drop TABLE emp_c;


create table emp_c
as
select employee_id ,first_name,salary,email from employees 
where department_id in (40,60);

select * from emp_c;

create table emp_trgt
as
select employee_id ,first_name,salary,email from employees 
where department_id in (40,60)
and 1=2;

select * from emp_trgt;
drop table  emp_trgt;

merge into emp_trgt t
using emp_c s'
on (s.employee_id=t.employee_id)
when matched then 
update set t.salary=s.salary;
when not matched then
insert values(s.employee_id,s.first_name,s.salary,s.email)

--insert success

update emp_c 
set salary = 15000
where employee_id=103;


merge into emp_trgt t
using emp_c s
on (s.employee_id=t.employee_id)
when not matched then
insert values(s.employee_id,s.first_name,s.salary,s.email)
when matched then 
update set t.salary=s.salary;

select * from emp_trgt;



--multiple column update
update emp_c 
set first_name ='pathi', salary =13000, email='pathiEEE'
where employee_id=104;

select * from emp_c;c


merge into emp_trgt t
using emp_c s
on (s.employee_id=t.employee_id)
when not matched then
insert values(s.employee_id,s.first_name,s.salary,s.email)
when matched then 
update set t.first_name=s.first_name,t.salary=s.salary,t.email=s.email;

select * from emp_trgt;

--update success

--if we want not update again and again

merge into emp_trgt t
using (select * from emp_c
minus
select * from emp_trgt) s
on (s.employee_id=t.employee_id)
when not matched then
insert values(s.employee_id,s.first_name,s.salary,s.email)
when matched then 
update set t.first_name=s.first_name,t.salary=s.salary,t.email=s.email;





select * from emp_trgt
minus
select * from emp_c;

truncate table emp_trgt;
--
merge into emp_trgt t
using emp_c s
on (s.employee_id=t.employee_id)
when not matched by t then
insert values(s.employee_id,s.first_name,s.salary,s.email)
when matched then 
update set t.first_name=s.first_name,t.salary=s.salary,t.email=s.email
when not matched with t then
delete;

select * from emp_trgt;


update emp_c 
set first_name ='Gowri', salary =10000, email='GOWRICS'
where employee_id=104;

delete emp_c
where employee_id=106;

 --WE ARE CREATING 2 TABLE ONE TABLE GETS UPDATED HOW WILL ANOTHER TAB UPDATE
 
 DROP TABLE student_trg;


CREATE TABLE student_src(id NUMBER,name VARCHAR2(20),salary NUMBER(10));
 INSERT INTO student_src VALUES(1,'ravi',1000);
 INSERT INTO student_src VALUES(2,'bavi',2000);
 INSERT INTO student_src VALUES(3,'savi',3000);
 INSERT INTO student_src VALUES(4,'yavi',4000);
 

 CREATE TABLE student_trg(id NUMBER,name VARCHAR2(20),salary NUMBER(10));
 INSERT INTO student_trg VALUES(1,'ravi',1000);
 INSERT INTO student_trg VALUES(2,'bavi',2000);
 INSERT INTO student_trg VALUES(3,'savi',3000);
 INSERT INTO student_trg VALUES(4,'yavi',4000);

 
 SELECT * FROM student_src;
 SELECT * FROM student_trg;
 1	ravi	1000
2	bavi	2500
3	savi	3000
4	yavi	4000
6	vavi	6000
7	cavi	7000
5	kavi	5000
 
 
 UPDATE student_src
 SET salary =2500
 WHERE id=2;
 
 
 
 UPDATE student_trg
 SET salary = (SELECT src.salary FROM student_src src WHERE src.id=student_trg.id);
 
 INSERT INTO student_src VALUES(5,'kavi',5000); 
 INSERT INTO student_src VALUES(6,'vavi',6000);
 INSERT INTO student_src VALUES(7,'cavi',7000);

DELETE student_src where id=3;

 
INSERT INTO student_trg
(SELECT * FROM student_src WHERE id NOT IN (SELECT id FROM student_trg) );
-- MERGE STATEMENT
--we can compine multiple operation

truncte table student_trg;

SELECT * FROM student_trg;

MERGE INTO student_trg t
USING student_src s
ON (s.id=t.id)
WHEN NOT MATCHED THEN
INSERT VALUES(s.id,s.name,s.salary)
WHEN MATCHED THEN 
UPDATE set t.id=s.id,t.name=s.name,t.salary=s.salary ;
 
 commit;
 ROLLBACK;
 
--how to handle the errors in merge clause
/


CREATE TABLE student_src(id NUMBER PRIMARY KEY,name VARCHAR2(30),salary NUMBER(10));
 INSERT INTO student_src VALUES(1,'ravi',1000);
 INSERT INTO student_src VALUES(2,'bavi',2000);
 INSERT INTO student_src VALUES(3,'savi',3000);
 INSERT INTO student_src VALUES(4,'yavi',4000);
 

CREATE TABLE student_trg(id NUMBER PRIMARY KEY,name VARCHAR2(10),salary NUMBER(10));
 INSERT INTO student_trg VALUES(1,'ravi',1000);
 INSERT INTO student_trg VALUES(2,'bavi',2000);
 INSERT INTO student_trg VALUES(3,'savi',3000);
 INSERT INTO student_trg VALUES(4,'yavi',4000);

alter table student_trg modify name varchar2(20);


 UPDATE student_src
 SET salary =2500
 WHERE id=2;


 INSERT INTO student_src VALUES(5,'kavi',5000); 
 INSERT INTO student_src VALUES(6,'kavi rajakumar',6000); 

DELETE student_src where id=3;


 SELECT * FROM student_src;



MERGE INTO student_trg
USING student_src
ON (student_trg.id=student_src.id)
WHEN NOT MATCHED BY student_trg THEN
INSERT VALUES(student_src.id,student_src.name,student_src.salary)
WHEN MATCHED THEN
UPDATE SET salary= student_src.salary
WHEN NOT MATCHED  THEN
DELETE;


LOG ERRORS INTO err$_student_trg REJECT LIMIT UNLIMITED;
--$$$$$$$$$$$$  error logging table--

BEGIN
 DBMS_ERRLOG.create_error_log (dml_table_name=>'STUDENT_TRG');
END;
/
 
SELECT * FROM STUDENT_TRG;
SELECT * FROM STUDENT_SRC;
 
SELECT * FROM ERR$_STUDENT_TRG;
DBMS _ERRLOG.create_error_log(dmlk_table_name=>'table name');
LOG ERRORS INTO  err$_student_trg REJECT LIMIT UNLIMITED;


















