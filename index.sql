
create or replace view empname_vw
as
select department_id,first_name from employees
group by department_id,first_name
order by 1;

create or replace view empname_vw
as
select rowid ids,employee_id from employees;
order by 1;
select * from empname_vw;


/*  INDEX index is like aindex of book or hints
ind used for get the data faster 
we cant creat ind for all the column when we need we can create
whenever a col called frequetly in where clas  can creat ind for the column

type
b tree
bit map
unique
composite
reversekey
function
after creation ind we can analyse
1.freq..?
2.which ind..?
data flow structure valume type
*/


ALTER INDEX PROD_ID REBUILD

ALTER INDEX PROD_ID ENABLE

ALTER INDEX PROD_ID DISABLE

DROP INDEX PROD_ID

SELECT * FROM employees; 
CREATE TABLE emp AS 
SELECT * FROM employees;
DROP TABLE emp; 
SELECT * FROM emp; WHERE first_name ='Steven';
SET AUTOT ON

--high cardianility  -- more uniq val and less dupilcates so b tree

SELECT * FROM emp WHERE first_name ='Steven';

CREATE INDEX ind_emp ON emp(first_name);                                                     

SELECT * FROM emp WHERE first_name ='Steven';

select index_name FROM user_indexes WHERE table_name='EMP';   

INDEX_NAME
------------------------------
IND_EMP

--bit map index-->low cardianality col more duolicates =bitmap ind

SELECT * FROM employees; WHERE department_id =80;

CREATE BITMAP INDEX btind_emp ON emp(department_id);
--check cost explain plan
SELECT * FROM emp WHERE department_id =80;
-- UNIQUE INSEX  unque value holder emp id
                                                  
CREATE UNIQUE INDEX unind_emp ON emp(employee_id);

drop index unind_emp;
SELECT * FROM emp WHERE employee_id <=180;

--composite index  using more econdition in where cluse

CREATE  INDEX cmpind_emp ON emp(last_name,salary);
  
drop index cmpind_emp;

SELECT * FROM emp WHERE last_name ='King' AND salary >15000;
--reverse index

SELECT * FROM emp; ORDER BY hire_date desc;
drop index rvsind_emp;


Execution Plan
----------------------------------------------------------
Plan hash value: 150391907

---------------------------------------------------------------------------
| Id  | Operation          | Name | Rows  | Bytes | Cost (%CPU)| Time     |
---------------------------------------------------------------------------
|   0 | SELECT STATEMENT   |      |    77 |  5544 |     4  (25)| 00:00:01 |
|   1 |  SORT ORDER BY     |      |    77 |  5544 |     4  (25)| 00:00:01 |
|   2 |   TABLE ACCESS FULL| EMP  |    77 |  5544 |     3   (0)| 00:00:01 |
---------------------------------------------------------------------------
--creation of reverse index
CREATE INDEX rvsind_emp ON emp(hire_date) REVERSE;

 --hint suppose in execution index not read when we use hints to force to use index

SELECT * FROM emp ORDER BY hire_date desc;

Execution Plan
----------------------------------------------------------
Plan hash value: 67393318
----------------------------------------------------------
| Id  | Operation                    | Name       | Rows  | Bytes | Cost (%CPU)| Time     |
------------------------------------------------------------------------------

|   0 | SELECT STATEMENT             |            |    77 |  5544 |     9  (12)|00:00:01 |
|   1 |  SORT ORDER BY               |            |    77 |  5544 |     9  (12)| 00:00:01 |
|   2 |   TABLE ACCESS BY INDEX ROWID| EMP        |    77 |  5544 |     8   (0)| 00:00:01 |
|   3 |    INDEX FULL SCAN           | RVSIND_EMP |    77 |       |     1   (0)| 00:00:01 |
-----------------------------------------------------------------------------------------------------

 SELECT /*+ INDEX(emp rvsind_emp)*/* FROM emp ORDER BY salary desc; 
drop index rvsind_emp;
SET AUTOT ON

commit;
 
 --2 example
 select * from emp order by salary DESC;
---------------------------------------------------------------------------
| Id  | Operation          | Name | Rows  | Bytes | Cost (%CPU)| Time     |
---------------------------------------------------------------------------
|   0 | SELECT STATEMENT   |      |    77 |  5544 |     4  (25)| 00:00:01 |
|   1 |  SORT ORDER BY     |      |    77 |  5544 |     4  (25)| 00:00:01 |
|   2 |   TABLE ACCESS FULL| EMP  |    77 |  5544 |     3   (0)| 00:00:01 |
---------------------------------------------------------------------------

--before index creation
explain plan for
select * from emp_as order by salary DESC;


select * from  table(dbms_xplan.display());  --cost is 3 

--after index creation

CREATE INDEX rvssal_emp ON emp_as(salary) REVERSE;

explain plan for
select * from emp_as where salary between 2000 and 9000;

select * from  table(dbms_xplan.display());  --cost is 3 

 drop index rvssal_emp;
 explain plan for
 SELECT /*+ INDEX(ep)*/* FROM emp_as ep where salary between 2000 and 9000;

 SELECT /*+ NOINDEX(ep)*/* FROM emp_as e

 
select * from  table(dbms_xplan.display());  --cost is 3 

 --function index
CREATE INDEX fnind_emp ON emp(UPPER(first_name));                                                     
                           ww                                                                                                          
SELECT * FROM emp WHERE UPPER(first_name)='NEENA';


SELECT index_name     FROM user_indexes WHERE table_name='EMPLOYEES';


--reverse
explain plan for 
 select * from emp_as order by salary DESC;

--index not access

select * from table(dbms_xplan.display());

--use hints
explain plan for
 SELECT /*+ INDEX(ep)*/* FROM emp_as ep where salary <10000;

select * from table(dbms_xplan.display());
























