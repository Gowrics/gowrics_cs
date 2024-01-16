--with class is 9i
the sql with allow you to give a sub query block name (its called subquery refactoring)
which can be referenced in several places within the main subquery.



select x.* from 
(select department_id ,count(employee_id) cnts from employees
group by department_id ) x
,
(select max(cnt) maxcnt from (
select count(employee_id) cnt from employees
group by department_id
)
)  y
where x.cnts=y.maxcnt;

with max_ecnt as
(
select max(cnt) maxcnt from (
select count(employee_id) cnt from employees
group by department_id
))
select department_id ,count(employee_id) cnts from employees
group by department_id
where cnts=max_ecnt.maxcnt;
 







--find who earn more salary than avg salary
--nomal
SELECT employee_id,first_name,salary FROM employees
WHERE salary >(SELECT ROUND(AVG(salary)) FROM employees);
--with clause
--create WITH clause,with name and parameter

WITH tmp_tb(avg_val)
AS
(SELECT ROUND(AVG(salary)) FROM employees)
 SELECT employee_id,first_name,salary FROM employees,tmp_tb
 WHERE employees.salary > tmp_tb.avg_val;



with avg_sals as
            (
            select round(avg(salary ))avgsal from employees
             )
 select first_name,department_id from employees e,avg_sals avg
 where salary >= avg.avgsal;
 


--find which dept's tot salary more than avg salary

SELECT department_id ,SUM(salary)
FROM employees
GROUP BY department_id
ORDER BY 1;

SELECT ROUND(AVG(salary)) FROM employees;
--------------------------------------------------------------

--max sal in each department

with max_sal_dp as (
                 select salary,department_id,dense_rank() over(partition by department_id order by salary desc ) max_sal 
                 from employees 
                    )
select * from max_sal_dp
where max_sal =1;





WITH tmp1_tb(dept_id,tot_sal)     ---->1
AS
(SELECT department_id ,SUM(salary)
FROM employees
GROUP BY department_id
ORDER BY 1),
 tmp2_tb(avg_salary)              ----->2
AS
 (SELECT ROUND(AVG(salary)) FROM employees)

  SELECT dept_id,tot_sal FROM tmp1_tb,tmp2_tb
  WHERE tmp1_tb.tot_sal >tmp2_tb.avg_salary;






WITH emp_sal_rank AS
(
SELECT salary,DENSE_RANK() OVER(ORDER BY salary DESC) rank FROM employees
)
SELECT * FROM emp_sal_rank
WHERE rank =2;


SELECT  UNIQUE department_id,job_id FROM employees;


-- group by aggr 
SELECT  department_id,job_id FROM employees
GROUP BY department_id,job_id 
ORDER BY department_id;

-- set union
SELECT  department_id,job_id FROM employees
UNION
SELECT  department_id,job_id FROM employees;


SELECT  department_id,job_id FROM employees
UNION
SELECT  NULL,NULL FROM DUAL
WHERE 1=2;


SELECT  department_id,job_id FROM employees
INTERSECT
SELECT  department_id,job_id FROM employees;

SELECT  department_id,job_id FROM employees
MINUS
SELECT  NULL,NULL FROM DUAL;

-- get the distinct dept id
SELECT * FROM 
(
SELECT  department_id,job_id,
        RANK() OVER(PARTITION BY department_id ,job_id ORDER BY ROWNUM) rw FROM employees
)
WHERE rw=1;



