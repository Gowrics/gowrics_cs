DESC departments;
DESCRIBE EMPLOYEES;
SELECT department_id FROM departments;
SELECT employee_id,
last_name
, salary
/* we can enter we need
--, salary*2
*/
  FROM employees;
  SELECT 'GOWRIPATHI' "NAME", '50000' "SALARY"  ,
  'PATHI' "NAME", '50000' "SALARY" FROM DUAL;
  SELECT 12*12000 FROM DUAL;
  
SELECT employee_id, first_name,last_name,hire_date, department_id, salary
    FROM employees
    WHERE salary != 10000; 
SELECT employee_id, first_name,last_name,hire_date, department_id, salary
    FROM employees
    WHERE salary ^= 10000;     
SELECT employee_id, first_name,last_name,hire_date, department_id, salary
    FROM employees
    WHERE salary <> 10000; 

  SELECT * FROM employees
  WHERE salary = 10000;
   SELECT * FROM employees
  WHERE employee_id  IN (150, 169,120, NULL);
  SELECT * FROM employees 
  WHERE first_name IN ('Steven' ,'Lex', 'John'); 
   SELECT * FROM employees
 WHERE first_name IN ('Steven' ,'Lex', 'John', 'Gowri'); 
 /* data not (gowri) found return other data
 IN not process null value*/
   SELECT * FROM employees;
   SELECT * FROM employees
 WHERE first_name NOT IN ('Steven' ,'Lex', 'John', 'Gowri');  
  
  
  SELECT * FROM employees
  WHERE salary BETWEEN 5000 AND 7500 ;
    SELECT * FROM employees
  WHERE salary NOT BETWEEN 10000 AND 20000;
 
   SELECT first_name  FROM employees
  WHERE first_name LIKE 'A%' ;
  SELECT first_name  FROM employees;
  WHERE first_name LIKE '%TJ%'; 
 SELECT first_name  FROM employees
  WHERE first_name LIKE '%th%' ;
  SELECT * FROM user_tables;
  
  
 SELECT employee_id, first_name, department_id  FROM employees
  WHERE department_id IS NULL ;
  
SELECT employee_id, first_name, department_id  FROM employees
  WHERE department_id IS NOT NULL ;
    
  SELECT employee_id, first_name, department_id, commission_pct  FROM employees
  WHERE commission_pct  IS NOT NULL ;
  
   
   SELECT employee_id, first_name, department_id  FROM employees
  WHERE department_id = 50 OR department_id = 60 ;
  
  
    
   SELECT employee_id, first_name, department_id  FROM employees
  WHERE (department_id = 50 OR department_id = 90) AND first_name= 'Steven';
 
   
   SELECT employee_id, first_name, last_name, salary, department_id
     FROM employees
     ORDER BY first_name ASC;

     SELECT employee_id e, first_name f, last_name l, salary s, department_id  b
     FROM employees
     ORDER BY s DESC;
SELECT employee_id e, first_name f, last_name l, salary s, department_id  b
     FROM employees
     ORDER BY b, s DESC; 
     
 
 SELECT employee_id e, first_name f, last_name l, salary s, department_id  b
     FROM employees
     ORDER BY b DESC NULLS firstjh; 
   ujh