SELECT dept_id,LISTAGG(dept_name,',')
WITHIN GROUP (ORDER BY dept_id)
AS dept_name FROM Ddept
GROUP BY dept_id;

SELECT department_id,LISTAGG(department_name,',')
WITHIN GROUP (ORDER BY department_id)
AS department_name FROM
(
SELECT e.department_id,d.department_name 
FROM employees e,departments d
WHERE e.department_id=d.department_id
)
GROUP BY department_id;


--   LISTAGG                                                                                                                                                                                                                                

SELECT department_id,LISTAGG(first_name,',')
WITHIN GROUP (ORDER BY first_name ASC)
AS employee_name FROM
(
SELECT department_id,first_name 
FROM employees
)
GROUP BY department_id;






--`````````````````````````````````````````````````````
SELECT department_id,LISTAGG(first_name,',')
WITHIN GROUP (ORDER BY first_name ASC)
AS employee_name FROM employees
GROUP BY department_id;
--````````````````````````````````````````````
SELECT LISTAGG(first_name,',')
WITHIN GROUP (ORDER BY first_name ASC)
AS employee_name FROM employees;
--`````````````````````````````````````````````

--()

SELECT department_id,LISTAGG(job_id,',')
WITHIN GROUP (ORDER BY job_id ASC)
AS employee_name FROM (
select DISTINCT department_id,job_id from employees
)
GROUP BY department_id;

select DISTINCT department_id,job_id from employees;





SELECT DISTINCT(TO_CHAR(hire_date,'yyyy')) year_hiring,LISTAGG(first_name,',' )
WITHIN GROUP (ORDER BY first_name ASC)
FROM employees
GROUP BY DISTINCT(TO_CHAR(hire_date,'yyyy'));




SELECT department_id,LISTAGG(job_id,',')
WITHIN GROUP (ORDER BY job_id ASC)
AS jobs FROM employees
GROUP BY department_id;



SELECT TO_CHAR(hire_date,'yyyy') hiring_year,LISTAGG(first_name,',')
WITHIN GROUP (ORDER BY first_name ASC) FROM employees
group by TO_CHAR(hire_date,'yyyy');



select * from employees;







CREATE TABLE Ddept(dept_id,dept_name)
AS
(
SELECT e.department_id,d.department_name 
FROM employees e,departments d

WHERE e.department_id=d.department_id
);



--SELECT year,LISTAGG(first_name,'|')
SELECT TO_CHAR(hire_date,'yyyy') ,LISTAGG(first_name,'|')
WITHIN GROUP (ORDER BY first_name ASC) hired_emoloyees FROM 
employees
--(
--SELECT TO_CHAR(hire_date,'yyyy') year,first_name
--FROM employees
--)
GROUP BY TO_CHAR(hire_date,'yyyy');





SELECT first_name FROM employees
WHERE TO_CHAR(hire_date,'yyyy')=2002;




SELECT e.department_id,LISTAGG(d.department_name,',')
WITHIN GROUP (ORDER BY e.department_id)
AS department_name FROM employees e,departments d
WHERE e.department_id=d.department_id
GROUP BY e.department_id;



SELECT employee_id,LISTAGG(employee_id||'->'||first_name||'->'||salary||'->'||department_id||'->'||to_char(hire_date,'yyyy'))
WITHIN GROUP (ORDER BY employee_id ASC) details
FROM employees
GROUP BY employee_id;

-------------------------------------------------------------------------------------------

Live SQL
19C LISTAGG DISTINCT

19C LISTAGG DISTINCT
Description
The LISTAGG aggregate function now supports duplicate elimination by using the new DISTINCT keyword. The LISTAGG aggregate function orders the rows for each group in a query according to the ORDER BY expression and then concatenates the values into a single string. 
With the new DISTINCT keyword, duplicate values can be removed from the specified expression before concatenation into a single string.
This removes the need to create complex query processing to find the distinct values prior to using the aggregate LISTAGG function. With the DISTINCT option, 
the processing to remove duplicate values can be done directly within the LISTAGG function. The result is simpler, faster, more efficient SQL.
Area


Oracle 19c
Contributor
Oracle
Created
Tuesday January 15, 2019
Statement 1
Notice the repeated results.
;/


select d.department_name,   
       listagg (e.job_id,',' on overflow truncate with count)     
                within group (order by e.job_id) jobs  
  from departments d, employees e     
 where d.department_id= e.department_id     
 group by d.department_name;



DNAME	JOBS
ACCOUNTING	CLERK, MANAGER, PRESIDENT
RESEARCH	ANALYST, ANALYST, CLERK, CLERK, MANAGER
SALES	CLERK, MANAGER, SALESMAN, SALESMAN, SALESMAN, SALESMAN

3 rows selected.
Statement 2

To remove the duplicates, prior to 19c, you would use a nested select to get just the unique jobs for the LISTAGG function.
SELECT d.dname,   
       (select LISTAGG(job,', ' ON OVERFLOW TRUNCATE WITH COUNT)    
               WITHIN GROUP (ORDER BY job)   
          from (select unique job job   
                  from scott.emp e  
                 where d.deptno = e.deptno)) jobs  
  FROM scott.dept d
DNAME	JOBS
ACCOUNTING	CLERK, MANAGER, PRESIDENT
RESEARCH	ANALYST, CLERK, MANAGER
SALES	CLERK, MANAGER, SALESMAN
OPERATIONS	-

4 rows selected.
Statement 3
With 19c, you can now just use DISTINCT within your LISTAGG to remove any repeated values.
select d.dname,   
       listagg (DISTINCT e.job,', ' on overflow truncate with count)     
                within group (order by e.job) jobs  
  from scott.dept d, scott.emp e     
 where d.deptno = e.deptno     
 group by d.dname
DNAME	JOBS
ACCOUNTING	CLERK, MANAGER, PRESIDENT
RESEARCH	ANALYST, CLERK, MANAGER
SALES	CLERK, MANAGER, SALESMAN

3 rows selected.
Additional Information
Database on OTN
SQL and PL/SQL Discussion forums
Oracle Database
Download Oracle Database
© 2023 Oracle Corporation
Privacy | Terms of Use

/

set serveroutput on;


declare 
v_big varchar2(10);
begin
select user into v_big from dual;
dbms_output.put_line('current user is  :'||v_big);
end;
/


declare 
plsql_blk varchar2(300);
begin
plsql_blk := '  declare 
                v_big varchar2(10);
                begin
                select user into v_big from dual;
                dbms_output.put_line(''current user is  :''||v_big);
                end;' ;
                execute immediate plsql_blk;
--dbms_output.put_line('current user is  :'||plsql_blk);

end;
/




