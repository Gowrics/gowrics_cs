--sub query
 ---single row sq
 
 SELECT * FROM employees
 WHERE salary >(SELECT salary FROM employees WHERE first_name ='Neena');
 
 ---multible rw sq
 SELECT * FROM employees
 WHERE salary >(SELECT salary FROM employees WHERE first_name ='Alexander');
 --error
 SELECT * FROM employees
 WHERE salary  IN(SELECT salary FROM employees WHERE first_name ='Alexander');
 
 SELECT * FROM employees
 WHERE salary > ALL(SELECT salary FROM employees WHERE first_name ='Alexander');
 
  SELECT * FROM employees
 WHERE salary  > ANY (SELECT salary FROM employees WHERE first_name ='Alexander');
 
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

SELECT e.employee_id, e.first_name, e.salary, e.department_id FROM employees e
WHERE salary > (SELECT AVG(salary) FROM employees
                 WHERE department_id = e.department_id
                 )
ORDER BY 4;

