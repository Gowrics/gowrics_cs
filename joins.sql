
--equi join
SELECT  employee_id
       ,hire_date
       ,salary
       ,e.department_id
       ,d.department_name
--FROM employees e JOIN  departments d
--ON e.department_id = d.department_id;
FROM employees e,departments d
WHERE e.department_id = d.department_id;

--right outer
SELECT  employee_id
       ,hire_date
       ,salary
       ,e.department_id
       ,d.department_name
--FROM employees e RIGHT OUTER JOIN departments d
--ON e.department_id = d.department_id;
FROM employees e,departments d
WHERE e.department_id(+) = d.department_id;

--left outer join

SELECT  employee_id
       ,hire_date
       ,salary
       ,e.department_id
       ,d.department_name
--FROM employees e LEFT OUTER JOIN departments d
--ON  e.department_id = d.department_id;
            
FROM employees e,departments d
WHERE e.department_id = d.department_id (+);

--full outer join


SELECT  employee_id
       ,hire_date
       ,salary
       ,e.department_id
       ,d.department_name
FROM employees e FULL JOIN departments d
ON e.department_id = d.department_id;


--self join

SELECT  e. employee_id
       ,e.first_name
       ,e.hire_date
       ,e.salary
       ,e.manager_id
       ,m.first_name "Manaer_name"
       ,m.hire_date  "Manager_hire_date"
       ,m.salary      "Manager_salary"
--FROM employees e JOIN employees m 
--ON  e.manager_id=m.employee_id;

FROM employees e,employees m 
WHERE e.manager_id=m.employee_id;

--who are all getting more than manager sal

SELECT  e. employee_id
       ,e.first_name
       ,e.hire_date
       ,e.salary
       ,e.manager_id
       ,m.first_name "Manaer_name"
       ,m.hire_date  "Manager_hire_date"
       ,m.salary      "Manager_salary"
       
FROM employees e,employees m 
WHERE e.manager_id=m.employee_id
AND e.salary > m.salary;

--who are all hired before  manager 
SELECT  e. employee_id
       ,e.first_name
       ,e.hire_date
       ,e.salary
       ,e.manager_id
       ,m.first_name "Manaer_name"
       ,m.hire_date  "Manager_hire_date"
       ,m.salary      "Manager_salary"
       
FROM employees e,employees m 
WHERE e.manager_id=m.employee_id
AND e.hire_date < m.hire_date;

--CROSS JOIN
-- when we are avoid where conditon cross join accur
SELECT  e. employee_id
       ,e.first_name
       ,e.hire_date
       ,e.salary
       ,e.manager_id
       ,m.first_name "Manaer_name"
       ,m.hire_date  "Manager_hire_date"
       ,m.salary      "Manager_salary"
--FROM employees e,employees m;
-- or --

FROM employees e CROSS JOIN employees m;


--another way 
-- this is full outer join

SELECT  employee_id
       ,hire_date
       ,salary
       ,e.department_id
       ,d.department_name
FROM employees e FULL JOIN departments d
ON e.department_id = d.department_id;

-- fetching data from 3tables
SELECT  employee_id
       ,hire_date
       ,salary
       ,e.department_id
       ,d.department_name
       ,d.location_id
       ,l.street_address     
FROM employees e,departments d, locations l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id;

SELECT * FROM locations;

--key word concept
SELECT  employee_id
       ,hire_date
       ,salary
       ,e.department_id
       ,d.department_name
       ,d.location_id
       ,l.street_address     
FROM employees e JOIN departments d ON  e.department_id = d.department_id
                 JOIN locations l   ON  d.location_id = l.location_id;

--natural join
SELECT  employee_id
       ,hire_date
       ,salary
       ,department_id
       ,d.department_name
FROM employees e NATURAL JOIN departments d;

SELECT
        d.department_id
       ,d.department_name
       ,location_id
       ,l.street_address
FROM departments d NATURAL JOIN locations l
ORDER BY 1 ASC;


--using join

SELECT  employee_id
       ,hire_date
       ,salary
       ,department_id
       ,d.department_name
FROM employees e JOIN departments d
USING(department_id);

--examples
--find the salesman and customer who reside in same city

SELECT name ,cust_name,city 
FROM salesman s,customer c
WHERE s.city =c.city;
--find those order where the ord amnt between 500-2000 return orderno and purchase amn cus nam city

SELECT o.ord_no,o.purch_amt,c.cust_name,c.city 
FROM customer c,orders o
WHERE s.salesman_id=o.salesman_id
AND o.purch_amt BETWEEN 500 AND 2000;

--
SELECT c.cust_name,c.city,s.name,s.commission
FROM salesman s,customer c
WHERE s.salesman_id =c.salesman_id;























