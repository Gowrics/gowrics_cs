-- 1 CREATE
 
 
 CREATE TABLE ex_tb
 (
  stud_id NUMBER
 ,stud_name VARCHAR2(20)
 ,dob DATE
 ,gender CHAR(4)
 ,dept_id NUMBER
 );
 
 DESC ex_tb;
 -- 2 ALTER
 --- ADD RENAME MODIFY DROP
 
      ALTER TABLE ex_tb ADD feedback LONG;
      ALTER TABLE ex_tb RENAME COLUMN dept_id TO dept_num;
      ALTER TABLE ex_tb MODIFY feedback VARCHAR2(100);
      ALTER TABLE ex_tb DROP COLUMN feedback ;
  
 --3 RENAME 
 --4 DROP 
 --5 TRUNCATE
 
 RENAME ex_tb TO stud_tb;
 DROP TABLE stud_tb;
 TRUNCATE TABLE stud_tb;
 
  DESC stud_tb;

--CREATE TABLE using sub query
CREATE TABLE DEPT 
AS
SELECT * FROM departments;

SELECT * FROM dept;

DROP TABLE dept;

-- creating tb without data
CREATE TABLE DEPT 
AS
SELECT * FROM departments
WHERE 1=3;

DESC dept;

-- creating tb with data

CREATE TABLE DEPT1 
AS
SELECT * FROM departments
WHERE 1=1;

SELECT * FROM dept1;

-- DML

--insert
SELECT * FROM stud_tb;

INSERT INTO  stud_tb VALUES(10,'ravi','12-08-89','male',101);

INSERT INTO  stud_tb(stud_id,stud_name,dob,gender,dept_id)
              VALUES(11,'kavi','11-08-89','femal',105);
-- error for gender
ALTER TABLE stud_tb MODIFY gender CHAR(6);


INSERT INTO  stud_tb(stud_id,stud_name,dob,gender,dept_id)
              VALUES(11,'kavi','11-08-89','femal',105);

DELETE FROM stud_tb WHERE dept_id= 105;


INSERT INTO  stud_tb(stud_id,stud_name,dob,gender,dept_id)
              VALUES(11,'kavi','11-08-89','female',105);

SELECT * FROM stud_tb;


INSERT INTO  stud_tb(stud_id,stud_name,gender,dept_id)
              VALUES(12,'pavi','female',103);

--insert values with sub query

SELECT * FROM dept1;

TRUNCATE TABLE dept1;

INSERT INTO dept1 (SELECT * FROM departments);
--insert needed columns of values with sub query
DROP table dpt2;
CREATE  TABLE dpt1(id NUMBER(7),name VARCHAR2(25));
CREATE  TABLE dpt2(id NUMBER(7),name VARCHAR2(25));

DESC dpt;

INSERT ALL
INTO dpt1(id,name)
VALUES
(SELECT department_id,department_name FROM departments WHERE department_id<60)
INTO dpt2(id,name)
VALUES
(SELECT department_id,department_name FROM departments WHERE department_id>60);


SELECT * FROM dpt2;

--some example of insert
/*
Retrieve the details of the employee ID, hire date, salary, and manager ID of those
employees whose employee ID is less than 125 from the EMPLOYEES table.
– If the salary is more than $20,000, insert the details of employee ID and salary into the
SPECIAL_SAL table.
– Insert the details of the employee ID, hire date, and salary into the SAL_HISTORY
table.
– Insert the details of the employee ID, manager ID, and SYSDATE into the
MGR_HISTORY table.
*/

CREATE TABLE emp_table(empno NUMBER PRIMARY KEY,empname VARCHAR2(100));



INSERT INTO emp_table 
   SELECT LEVEL,'emp_name'|| LEVEL FROM DUAL
   CONNECT BY LEVEL <=100;
SELECT * FROM emp_table;

SELECT * FROM special_history;


INSERT ALL
WHEN salary > 20000 THEN
INTO special_history VALUES(employee_id,salary)
ELSE
INTO sal_history VALUES(employee_id,hire_date,salary)
INTO mngr_history VALUES(employee_id,manager_id,salary)
 SELECT employee_id,hire_date,salary,manager_id 
 FROM employees
 WHERE employee_id < 125;


DROP TABLE dpt2;

CREATE  TABLE dpt1(id NUMBER(7),name VARCHAR2(25));
CREATE  TABLE dpt2(id NUMBER(7),name VARCHAR2(25));
INSERT ALL
WHEN department_id<60 THEN
INTO dpt1(id,name)
VALUES (department_id,department_name )
WHEN department_id>60 THEN
INTO dpt2(id,name)
VALUES (department_id,department_name)
SELECT department_id,department_name FROM departments;


commit;

rollback;

SELECT * FROM dpt2;

DROP TABLE dept_70;
CREATE TABLE dept_80(emp_name VARCHAR2(30),emp_id NUMBER(20),dept_id NUMBER(20),salary NUMBER(20),hire_date DATE);
CREATE TABLE dept_70(emp_name VARCHAR2(30),emp_id NUMBER(20),dept_id NUMBER(20),salary NUMBER(20),hire_date DATE);

INSERT ALL
WHEN department_id =80 THEN
INTO dept_80(emp_name,emp_id,dept_id,salary,hire_date) 
VALUES(first_name,employee_id,department_id,salary,hire_date)
WHEN department_id =70 THEN
INTO dept_70(emp_name,emp_id,dept_id,salary,hire_date) 
VALUES(first_name,employee_id,department_id,salary,hire_date)
SELECT first_name,employee_id,department_id,salary,hire_date FROM employees ;
select * from dept_80;





DROP TABLE dept_80;
CREATE TABLE dept_low_sal(emp_name VARCHAR2(30),emp_id NUMBER(20),dept_id NUMBER(20),salary NUMBER(20),hire_date DATE);
CREATE TABLE dept_high_sal(emp_name VARCHAR2(30),emp_id NUMBER(20),dept_id NUMBER(20),salary NUMBER(20),hire_date DATE);

INSERT ALL
WHEN salary<10000 THEN
INTO dept_low_sal(emp_name,emp_id,dept_id,salary,hire_date) 
VALUES(first_name,employee_id,department_id,salary,hire_date)
WHEN salary>10000 THEN
INTO dept_high_sal(emp_name,emp_id,dept_id,salary,hire_date) 
VALUES(first_name,employee_id,department_id,salary,hire_date)
SELECT first_name,employee_id,department_id,salary,hire_date FROM employees ;
sselect * from dept_low_sal;
select * from dept_high_sal;


--insert first

CREATE TABLE dept_90(emp_name VARCHAR2(30),emp_id NUMBER(20),dept_id NUMBER(20),salary NUMBER(20),hire_date DATE);
CREATE TABLE dept_70(emp_name VARCHAR2(30),emp_id NUMBER(20),dept_id NUMBER(20),salary NUMBER(20),hire_date DATE);
CREATE TABLE dept_others(emp_name VARCHAR2(30),emp_id NUMBER(20),dept_id NUMBER(20),salary NUMBER(20),hire_date DATE);

INSERT ALL
WHEN department_id =90 THEN
INTO dept_90(emp_name,emp_id,dept_id,salary,hire_date) 
VALUES(first_name,employee_id,department_id,salary,hire_date)
WHEN department_id =70 THEN
INTO dept_70(emp_name,emp_id,dept_id,salary,hire_date) 
VALUES(first_name,employee_id,department_id,salary,hire_date)
ELSE
INTO dept_others(emp_name,emp_id,dept_id,salary,hire_date) 
VALUES(first_name,employee_id,department_id,salary,hire_date)
SELECT first_name,employee_id,department_id,salary,hire_date FROM employees ;

select * FROM dept_90;
select * FROM dept_70;
select * FROM dept_others;
``````````````````````````````````````````````````````````````````````````````````````````
create table dept_all(emp_id NUMBER(20),name VARCHAR2(30));
insert into dept_all (select employee_id,first_name||' '||last_name FROM employees);
select * FROM dept_all;


--insert data using with pivot table

CREATE TABLE region_sales
(
prd_id VARCHAR2(30),
india NUMBER,
americ NUMBER,
london NUMBER,
canada NUMBER
);
INSERT INTO region_sales VALUES('prod1',100,200,300,400);
INSERT INTO region_sales VALUES('prod2',500,600,700,800);
select * FROM region_sales;

CREATE TABLE region_sales_list(prod_id VARCHAR2(20),region VARCHAR2(20),tot_val NUMBER);
drop table region_sales_list;

/

INSERT INTO region_sales_list 
(
select * FROM
(
select prd_id,india,americ,london,canada FROM region_sales
)
UNPIVOT (coumn_value FOR column_name IN(india,americ,london,canada))
);


select * FROM region_sales_list ;
TRUNCATE  TABLE region_sales_list;

/
INSERT ALL
    INTO  region_sales_list VALUES(prd_id,'india',india)
    INTO  region_sales_list VALUES(prd_id,'americ',americ)
    INTO  region_sales_list VALUES(prd_id,'london',london)
    INTO  region_sales_list VALUES(prd_id,'canada',canada)
SELECT * FROM region_sales;



```````````````````````````````````````

---UPDATE 

UPDATE dept1
SET department_name = 'Admin'
WHERE department_id=10;

UPDATE dept1
SET department_name = 'Admin' 
    ,manager_id = 202
WHERE department_id=10;

-- ERROR SPOT

UPDATE dept1
SET department_name = 'Admin';

-- entire dept name changed

--------------------------------------------------------------------
--multiple column update
update emp_c 
set first_name ='Gowri', salary =10000, email='GOWRICS'
where employee_id=104;

----------------------------------------------------------------------


--DELETE

SELECT * FROM dept1;

DELETE FROM dept1
WHERE department_id IN (10,20,30,40,50);
DELETE FROM dept1;

--TCL

--commit
--rollback
--savepoint 

CREATE TABLE ex_tb(staff_id NUMBER(20));

>> SELECT * FROM ex_tb; 
>> table create                          
INSERT INTO ex_tb VALUES (10);
INSERT INTO ex_tb VALUES (20);
INSERT INTO ex_tb VALUES (30);
INSERT INTO ex_tb VALUES (40);
INSERT INTO ex_tb VALUES (50);

 SELECT * FROM ex_tb;
 DROP TABLE ex_tb;
 >> SELECT * FROM ex_tb;
>> no values

COMMIT;
 >> SELECT * FROM ex_tb;
>> values inserted
>>INSERT INTO ex_tb VALUES (40);
--insert values in cmd prompt
--ROLLBACK
rollback;

INSERT INTO ex_tb VALUES (60);
rollback;
CREATE TABLE st_tn(id_num NUMBER); 
 rollback;
--rollback not work in ddl
SELECT * FROM st_tn;
DROP TABLE st_tn;

--savepoint 

 SELECT * FROM ex_tb;

CREATE TABLE st_tn(id_num NUMBER); 
 
 INSERT INTO st_tn VALUES (10);
 INSERT INTO st_tn VALUES (20);
 INSERT INTO st_tn VALUES (30);
 INSERT INTO st_tn VALUES (40);
 INSERT INTO st_tn VALUES (50);
SAVEPOINT s1;

 INSERT INTO st_tn VALUES (60);
 INSERT INTO st_tn VALUES (70);
 INSERT INTO st_tn VALUES (80);
 INSERT INTO st_tn VALUES (90);
 INSERT INTO st_tn VALUES (100);
SAVEPOINT s2;
 INSERT INTO st_tn VALUES (110);
 INSERT INTO st_tn VALUES (120);
 INSERT INTO st_tn VALUES (130);
 INSERT INTO st_tn VALUES (140);
 INSERT INTO st_tn VALUES (150);
SAVEPOINT s3;
 INSERT INTO st_tn VALUES (160);
 INSERT INTO st_tn VALUES (170);

SELECT * FROM st_tn;
commit;

ROLLBACK;
 SELECT * FROM ex_tb;

ROLLBACK TO s3;
;

DROP TABLE s2;
--interview
DROP TABLE s1;
CREATE TABLE s1(num NUMBER);
INSERT INTO s1 VALUES (1);
INSERT INTO s1 VALUES (2);
INSERT INTO s1 VALUES (3);
COMMIT;
INSERT INTO s1 VALUES (4);
INSERT INTO s1 VALUES (5);

DROP TABLE s2;
CREATE TABLE s2(num NUMBER);
commit;
INSERT INTO s2 VALUES (21);
INSERT INTO s2 VALUES (22);
INSERT INTO s2 VALUES (23);

ROLLBACK;

SELECT * FROM S1;
SELECT * FROM S2;
SELECT table_name,tablespace_name 



--DCL
--create  user ..
--go to admin system


CREATE USER gowrics20
IDENTIFIED BY gcs
DEFAULT TABLESPACE USERS
QUOTA 10M ON USERS
TEMPORARY TABLESPACE TEMP;

--this for system admin details
SELECT * FROM dba_users;
SELECT username FROM dba_users;

-- then connect to our user gowrics31
-- create table not possible
--before that
sql> connect /system /open
--thenshow user

sql>GRANT CONNECT,CREATE TABLE TO gowrics31; 

-- to change the pasword or quata m
USER is "SYSTEM"
SQL> ALTER USER gowrics31
  2  IDENTIFIED BY gcs
  3  QUOTA 10M ON SYSAUX;

User altered.

SQL>
SQL> exit
Enter user-name: gowrics31
Enter password:

Connected to:

Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production

SQL> create table tee1 (id NUMBER);


Table created.
INSERT INTO tee1 VALUES(10);

SELECT * FROM tee1;

create table tee1 (id NUMBER);
DROP USER GOWRIC


SQL> create table tee2 (id NUMBER) TABLESPACE SYSAUX;

Table created.

select table_name, tablespace_name FROM user_tables;

SELECT * FROM dba_users;


GOWRICS31
GOWRIPATHI
HR
GOWRICS
GOWRICS30