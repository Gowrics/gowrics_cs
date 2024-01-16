SELECT * FROM employees 
WHERE hire_date BETWEEN TO_DATE('20-02-2005') AND TO_DATE('01-05-2005')
ORDER BY hire_date ASC;

SELECT TO_DATE('20-02-1998'),TO_DATE('01-05-1998') FROM dual;
SELECT * FROM employees ;SELECT * FROM employees WHERE hire_date = '15-03-98';

SELECT last_name,department_id FROM employees WHERE department_id IN (20,50) ORDER BY last_name ASC;

SELECT last_name employee ,salary,department_id  FROM employees
WHERE salary BETWEEN 5000 AND 12000 
AND department_id IN (20,50) 
ORDER BY last_name ASC; 

SELECT last_name, hire_date  FROM employees 
WHERE hire_date BETWEEN ROUND(TO_DATE('20-02-2005'),'yy') AND ROUND(TO_DATE('20-02-2006'),'yy')-1
ORDER BY hire_date ASC;


SELECT ROUND(TO_DATE('20-02-2006'),'yy')-1 FROM DUAL;

SELECT last_name,department_id FROM employees WHERE manager_id IS NULL;

SELECT last_name,salary,commission_pct
FROM employees 
WHERE commission_pct IS NOT NULL
ORDER BY salary DESC;


SELECT first_name, SUBSTR(first_name,  1,1 ) "sub2"
                   , SUBSTR(first_name, 3  ) ", sub3"
                   ,SUBSTR(first_name, -4,3) "sub4" FROM employees;
SELECT first_name , INSTR(LOWER (first_name),'a') "INSTR"
                  , INSTR(LOWER (first_name),'a', 1,2)"INSTR2" 
                  , INSTR(LOWER (first_name),'a', 1,3)"INSTR3"FROM employees;

SELECT last_name, INSTR (LOWER(last_name),'a') FROM employees
WHERE INSTR(last_name,'a')=3;


SELECT last_name, INSTR (LOWER(last_name),'a'),INSTR(LOWER(last_name),'e') 
FROM employees
WHERE INSTR(LOWER(last_name),'a')!=0
OR INSTR (LOWER(last_name),'e') !=0;

SELECT last_name,jo

SELECT employee_id,last_name,salary , salary + salary * 15 /100 "New salary" FROM employees;
SELECT employee_id,last_name,salary , salary * 0.15  "New salary" FROM employees;

SELECT employee_id,last_name,salary , salary + salary * 15 /100 "New salary",salary - salary + salary * 15 /100  "increment"  FROM employees;

SELECT last_name ,SUBSTR(INITCAP(last_name),1,1) "1st letter", LENGTH(INITCAP(last_name))"lenth" FROM employees
WHERE SUBSTR(INITCAP(last_name),1,1)IN('J','A','M');

SELECT last_name,ROUND(MONTHS_BETWEEN(TO_DATE('21-04-08'),hire_date)) FROM employees;


SELECT last_name,ROUND(MONTHS_BETWEEN(SYSDATE,hire_date))"MONTHS WORKED" FROM employees
ORDER BY ROUND(MONTHS_BETWEEN(SYSDATE,hire_date)) DESC;




ORDER BY ROUND(MONTHS_BETWEEN(TO_DATE('21-04-08'),hire_date)) ASC;

SELECT CONCAT (last_name ,' earns ')||'$'||CONCAT(salary,' monthly but wants')||' $'||salary*3 "Dream Salaries" FROM employees;

SELECT last_name,LPAD(salary,15,'$')"salary" FROM employees;
SELECT last_name,LPAD(salary,15,'-')"salary" FROM employees;

SELECT last_name,LPAD(salary,15,'$')"salary" FROM employees;
SELECT last_name,RPAD(salary,15,'-')"salary" FROM employees;

SELECT last_name,
       hire_date,
       TO_CHAR(ADD_MONTHS(hire_date,6),'ddspth mon,yyyy')"REVIEW" 
FROM   employees;




SELECT last_name,
       hire_date,
       TO_CHAR(hire_date,'DAY')"DAY" 
FROM   employees
ORDER BY TO_CHAR(hire_date -1,'d');

SELECT last_name,
       NVL(TO_CHAR(commission_pct),'No Commission')"commission" 
FROM employees;

SELECT last_name, salary FROM employees;

SELECT job_id , DECODE(job_id, 'AD_PRES','A',
                              'ST_MAN','B',
                              'IT_PROG','C',
                              'SA_REP','D',
                              'ST_CLERK','E',
                                         'O')" GRADE"
FROM employees;



SELECT job_id , CASE job_id 
                              WHEN 'AD_PRES'  THEN 'A'
                              WHEN 'ST_MAN'   THEN 'B'
                              WHEN 'IT_PROG'  THEN 'C'
                              WHEN 'SA_REP'   THEN 'D'
                              WHEN 'ST_CLERK' THEN 'E'
                              ELSE           'O'  
                              END   "GRADE"
                              
FROM employees;

SELECT  e.last_name,
        e.salary ,
        e. department_id,
        d. department_name 
FROM   employees e , departments d
WHERE e.department_id = d.department_id;

SELECT DISTINCT(e.JOB_ID), l.location_id 
FROM employees e,locations l,departments d
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND e.department_id = 80;
 



SELECT e.last_name, d.department_name,l.location_id, l.city 
FROM employees e,locations l,departments d
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND commission_pct IS NOT NULL;
 
SELECT e.last_name,d.department_name 
FROM employees e,departments d
WHERE e.department_id = d.department_id; 