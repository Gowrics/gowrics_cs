--set operator
--UNION allow us to combine the results of 2 query and remove duplicates
--UNION ALL not remove dublicates
--MINUS will display the results of query1 and remove thoese match any records from query2.
--INTERSECT will display the records that appear in both q1 and q2




--display the unique records in ascending order
create table t1(a_num NUMBER ,b_num NUMBER);
create table t2(c_num NUMBER ,d_num NUMBER);
DROP TABLE t1;
DROP TABLE t2;

INSERT INTO t1 VALUES(1,1);
INSERT INTO t1 VALUES(2,3);
INSERT INTO t1 VALUES(5,4);
INSERT INTO t1 VALUES(6,6);
INSERT INTO t1 VALUES(2,9);

`SELECT * FROM t1;

INSERT INTO t2 VALUES(2,1);
INSERT INTO t2 VALUES(4,2);
INSERT INTO t2 VALUES(4,5);
INSERT INTO t2 VALUES(7,7);
INSERT INTO t2 VALUES(8,3);

SELECT * FROM t2;

SELECT c_num,d_num FROM T2 
UNION
SELECT a_num, b_num FROM t1; 


SELECT d_num FROM T2 
UNION
SELECT a_num FROM t1; 
-- union all

SELECT c_num,d_num FROM T2 
UNION ALL
SELECT a_num, b_num FROM t1; 


SELECT d_num FROM T2 
UNION ALL
SELECT a_num FROM t1; 

--intersect

SELECT c_num,d_num FROM T2 
INTERSECT
SELECT a_num, b_num FROM t1; 


SELECT d_num FROM T2 
INTERSECT
SELECT a_num FROM t1; 

--minus
SELECT c_num,d_num FROM T2 
MINUS
SELECT a_num, b_num FROM t1; 


SELECT d_num FROM T2 
MINUS
SELECT a_num FROM t1; 

select first_name  from employees
UNION 
select first_name  from employees; 

select first_name  from employees
UNION ALL
select first_name,last_name  from employees; 


select first_name  from employees
INTERSECT
select first_name  from employees; 

select first_name,department_id  from (select first_name,salary,department_id from employees where department_id in(10,20,30,40))
intersect
select first_name,department_id  from (select first_name,salary,department_id from employees where department_id in(10,50,60,70));

SELECT a_num FROM T1 
INTERSECT
SELECT a_num FROM t1; 



--display only unmatched records only from both tables

SELECT e.employee_id,e.first_name,e.salary,e.department_id,d.department_name FROM employees e FULL JOIN departments d
ON e.department_id=d.department_id
MINUS
SELECT e.employee_id,e.first_name,e.salary,e.department_id,d.department_name FROM employees e JOIN departments d
ON e.department_id=d.department_id;


