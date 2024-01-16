--sub query
 ---single row sq
 
 SELECT * FROM employees
 WHERE salary >(SELECT salary FROM employees WHERE first_name ='Neena');
 
 
 
 ---multible rw sq
 SELECT * FROM employees
 WHERE salary >(SELECT salary FROM employees WHERE first_name ='Alexander');
 --error
/* The IN keyword allows you to check if a value matches one of a range of values. It’s often used with
subqueries that return more than one row.
*/

 SELECT * FROM employees
 WHERE salary  IN(SELECT salary FROM employees WHERE first_name ='Alexander');
 
 --The ANY keyword checks that a value meets at least  
 --one of the conditions in the following set of values.
 
 
 SELECT * FROM employees
 WHERE salary <ALL(SELECT salary FROM employees WHERE first_name ='Alexander');
 
 -- The ALL keyword checks that a value meets all of the conditions 
 --in the following set of values.
 
  SELECT * FROM employees
 WHERE salary  = ANY (SELECT salary FROM employees WHERE first_name ='Alexander');
 
 --example 1
SELECT employee_id,salary,job_id FROM employees
WHERE job_id= (SELECT job_id FROM employees WHERE employee_id = 169);
 --ex2
 select first_name ,last_name,department_id,salary
 FROM employees
 WHERE salary IN (SELECT MIN(salary)FROM employees
 
GROUP BY department_id);
--ex3

SELECT * FROM employees 
WHERE department_id  NOT IN (SELECT department_id FROM departments );             ) 
SELECT * FROM 
(
SELECT 
        employee_id
        ,first_name
        ,department_id
        ,salary
        ,DENSE_RANK () OVER (ORDER BY salary DESC) sal_rank 
FROM employees
)
WHERE sal_rank =5;
--scalar sq

SELECT department_id,COUNT(*) FROM employees
WHERE department_id IN (10,20,30,40,50)
GROUP BY department_id
ORDER BY 1
;
 
SELECT 
 (SELECT COUNT(*) FROM employees WHERE department_id =10) "10"
,(SELECT COUNT(*) FROM employees WHERE department_id =20) "20"
,(SELECT COUNT(*) FROM employees WHERE department_id =30) "30"
,(SELECT COUNT(*) FROM employees WHERE department_id =40) "40"
,(SELECT COUNT(*) FROM employees WHERE department_id =50) "50"
,(SELECT COUNT(*) FROM employees WHERE department_id =60) "60"
FROM dual;



select job_id,department_id FROM employees;

--display dprt name usim\ng sq

SELECT e.employee_id 
      ,e.first_name
      ,e.hire_date
      ,e.salary
      ,e.department_id
, (SELECT department_name FROM departments d
    WHERE d.department_id = e.department_id)"department_name"
FROM employees e;
 
--inline view
SELECT * FROM employees e , departments d
WHERE e.department_id =d.department_id;
 -- display which dept have max employees
 SELECT x.* FROM 
         (
         SELECT department_id,COUNT(*) counts FROM employees
         GROUP BY department_id
        ORDER BY 1 
         ) x
        ,
         (
         SELECT MAX(COUNT(*)) maxcounts FROM employees
         GROUP BY department_id
         ) y
WHERE x.counts=y.maxcounts;

 -- display which dept have max employees

 SELECT x.* FROM 
         (
         SELECT department_id,SUM(salary) counts FROM employees
         GROUP BY department_id
        ORDER BY 1 
         ) x
        ,
         (
         SELECT MAX(sum(salary)) maxcounts FROM employees
         GROUP BY department_id
         ) y
WHERE x.counts=y.maxcounts;
--having 
SELECT department_id,ROUND(AVG(salary)) AVG
FROM employees
GROUP BY department_id
HAVING AVG(salary) > (SELECT salary FROM employees WHERE first_name ='Neena');

--correlated sub query
--who are getting more than avg salary of their dept

SELECT e.employee_id, e.first_name, e.salary, e.department_id FROM employees e
WHERE salary > (SELECT AVG(salary) FROM employees
                 WHERE department_id = e.department_id
                 )
ORDER BY 4; 

SELECT AVG(salary) FROM employeesf
                 WHERE department_id = 20;e.department_id
                

select * from employees e
where salary >(select avg(salary) from employees a
                 where e.department_id =a.department_id)
     order by 11;


--who are getting more than manager salary of their dept


select e.first_name,e.department_id,e.salary from employees e
where  e.salary > (select salary from employees
where e.manager_id= employee_id);


SELECT e.employee_id, e.first_name, e.salary, e.department_id,e.manager_id FROM employees e
WHERE salary > (SELECT salary FROM employees
                 WHERE employee_id = e.manager_id
                 )ORDER BY 4; 

--who are hired before than manager  of their dept



SELECT e.employee_id, e.first_name, e.salary, e.department_id,e.manager_id,e.hire_date FROM employees e
WHERE hire_date < (SELECT hire_date FROM employees m
                 WHERE m.employee_id = e.manager_id
                 )
ORDER BY 4; 

--multiple column sq
--who r having neena manager, and dept id

SELECT first_name,employee_id,salary,hire_date,manager_id,department_id
FROM  employees
WHERE manager_id = (SELECT manager_id FROM employees WHERE first_name='Neena')
AND department_id=(SELECT department_id FROM employees WHERE first_name='Neena' );

SELECT first_name,employee_id,salary,hire_date,manager_id,department_id
FROM  employees
WHERE (manager_id,department_id) = (SELECT manager_id,department_id FROM employees WHERE first_name='Neena');

SELECT a.* FROM 
        (SELECT department_id,COUNT(*) dc FROM employees
         GROUP BY department_id)    a
        ,(SELECT MAX(COUNT(*)) mxc FROM employees
         GROUP BY department_id)    b
WHERE a.dc=b.mxc;


SELECT a.* FROM 
        (SELECT department_id,COUNT(*) dc FROM employees
         GROUP BY department_id)    a
        ,(SELECT MAX(COUNT(*)) mxc FROM employees
         GROUP BY department_id)    b
WHERE a.dc=b.mxc;


SELECT b.* FROM 
        (SELECT department_id,SUM(salary) dc FROM employees
         GROUP BY department_id)    a
        ,(SELECT MAX(SUM(salary)) mxc FROM employees
         GROUP BY department_id)    b
WHERE a.dc=b.mxc;


  SELECT e.employee_id,e.first_name,e.salary,e.department_id FROM employees e
WHERE salary > (SELECT AVG(salary) FROM employees d WHERE d.department_id =e.department_id);

SELECT e.employee_id,e.first_name,e.salary, m.first_name,m.salary 
FROM employees e,employees m
WHERE e.manager_id=m.employee_id
AND e.salary>m.salary;

  SELECT e.employee_id,e.first_name,e.salary,e.department_id FROM employees e
WHERE e.salary > (SELECT salary FROM employees m WHERE m.manager_id =e.employee_id);





SELECT e.employee_id,e.first_name,e.salary,e.department_id FROM employees e
WHERE salary > (SELECT salary FROM employees d WHERE e.manager_id =d.employee_id);




SELECT * FROM employees
WHERE employee_id  IN (SELECT employee_id FROM employees 
                           WHERE department_id =100);


SELECT * FROM employees
WHERE EXISTS (SELECT employee_id FROM employees 
                           WHERE employee_id =120);
                           
