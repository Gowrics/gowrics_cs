
select * from employees
where lower(first_name) like 'a___a%';

select substr(first_name,2,5) from employees;
select substr(first_name,instr(first_name,'z'),1),instr(first_name,'z') from employees
where instr(first_name,'z')>0;

select lpad(first_name,10,'_') from employees;
select Rpad(first_name,10,'_') from employees;
select ltrim(first_name,'A') from employees;
select rtrim(first_name,'a') from employees;
select trim('a' from lower(first_name)) from employees;

select replace(replace(replace(first_name,'a','@'),'M','%'),'S','*') from employees;
select replace(replace(replace(first_name,'a','@'),'M','%'),'S','*') from employees;

select translate(translate(translate(first_name,'a','@'),'M','%'),'S','*') from employees;
SELECT last_day(sysdate) from dual;

SELECT next_day(sysdate,'friday') from dual;


SELECT round(2344.55) from dual;
SELECT trunc(2344.556) from dual;




SELECT TO_DATE('09-jun-22') "DATE",
   ROUND(TO_DATE('09-jun-22'),'MM')"1",
   ROUND(TO_DATE('23-jun-22'),'MM') "2",
   ROUND(TO_DATE('09-jun-22'),'yy') "3",
   ROUND(TO_DATE('09-sep-22'),'yy')"4"
   FROM DUAL;
   /*truc */
   SELECT TO_DATE('09-jun-22') "DATE",
   TRUNC(TO_DATE('09-jun-22'),'MM')"1",
   TRUNC(TO_DATE('23-jun-22'),'MM') "2", 
   TRUNC(TO_DATE('09-jun-22'),'yy') "3",
   TRUNC(TO_DATE('09-sep-22'),'yy')"4"
   FROM DUAL;
   /*find hire date */
   SELECT *FROM employees ORDER BY hire_date ASC;
   
   SELECT * FROM employees
   WHERE hire_date BETWEEN TRUNC(TO_DATE('19-03-05'),'yy') AND ADD_MONTHS(TRUNC(TO_DATE('19-03-05'),'yy'),12)-1;
   /* to date */
   
   
drop table rr1;   
   create table rr1( );
   select * from rr1;
   insert into rr1 values('m');
   insert into rr1 values('f');
   insert into rr1 values('f');
   insert into rr1 values('m');
   insert into rr1 values('f');\
   insert into rr1 values('f');


update rr1
set wife =null, wife ='f',
wife = 'f'
 wife ='m';



select decode( wife 'f' ='m',
                    'm' ='f',
                    others) from rr1;      
   
   select TRUNC(TO_DATE('19-03-05'),'yy') from dual;

   select  ADD_MONTHS(TRUNC(TO_DATE('19-03-05'),'yy'),12)-1 from dual;
   
   
   
   
   SELECT TO_NUMBER(TO_CHAR(SYSTIMESTAMP, 'HH12')) FROM DUAL;

   SELECT (TO_CHAR(SYSTIMESTAMP, 'HH12'))+10 FROM DUAL;

   

   select round(MONTHS_BETWEEN(SYSDATE,hire_date) ) from employees;

   
   SELECT * FROM employees
   WHERE hire_date= TO_DATE('17-06-2003','dd-mm-yyyy');
   
     SELECT SYSDATE - TO_DATE('04-07-2022','dd-mm-yyyy') FROM DUAL;
     
     SELECT first_name , salary, hire_date,
     TO_CHAR(hire_date,'dd/month/yyyy') "typeconver1  ",
     TO_CHAR(hire_date,'dd-mon-yyyy')   "typeconver2  " ,
     TO_CHAR(hire_date,'dd')            "typeconver3  " ,
     TO_CHAR(hire_date,'month')            "typeconver4  ",
     TO_CHAR(hire_date,'yyyy')            "typeconver5  " FROM employees;
     
     /* display 2007 year hire date */
     SELECT first_name , salary, hire_date, TO_CHAR(hire_date,'yyyy')FROM employees
     WHERE TO_CHAR(hire_date,'yyyy')= 2007 ;
     
    /* print variant date format */ 
     
     SELECT  TO_CHAR(TO_DATE('22-06-2022'),'ddd') "Date" FROM dual;
 
     SELECT  TO_CHAR(TO_DATE('22-06-2022'),'ddd') "Date" ,
             TO_CHAR(TO_DATE('22-06-2022'),'dd') "Date1",
             TO_CHAR(TO_DATE('21-06-2022'),'ddth') "Date2"            FROM dual;
    /* print day sun mon tue  D , DY, DAY*/
    
     SELECT  TO_CHAR(TO_DATE('23-06-2022'),'d') "Date" FROM dual;
     SELECT  TO_CHAR(SYSDATE,'d') "Date" FROM dual;
     SELECT  TO_CHAR(SYSDATE + 10,'d') "Date" FROM dual;
     SELECT  TO_CHAR(SYSDATE + 7,'d') "Date" FROM dual;
     SELECT  TO_CHAR(SYSDATE + 10,'DAY') "Date" FROM dual;
     SELECT  TO_CHAR(SYSDATE,'DAY') "Date" FROM dual;

  /* print month  mm , mon, month*/
   
   SELECT  TO_CHAR(SYSDATE,'MON') "month",
           TO_CHAR(SYSDATE,'Month') "month2",
           TO_CHAR(SYSDATE,'MM') "month1" FROM dual;
SELECT SYSDATE FROM DUAL;
SELECT  TO_CHAR(SYSDATE,'HH24:MI:SS') "TIME",
           TO_CHAR(SYSDATE,'Month') "month2",
           TO_CHAR(SYSDATE,'MM') "month1" FROM dual;

SELECT TO_CHAR(TO_DATE('03-12-2021'),' Q')FROM DUAL;
SELECT TO_CHAR(SYSDATE,'Q') FROM DUAL;
/* to convert roman */
SELECT TO_CHAR(2,'RM')FROM DUAL;

SELECT TO_CHAR(12,'RM')FROM DUAL;
SELECT TO_CHAR(88,'RM')FROM DUAL;

SELECT TO_CHAR(SYSDATE,'DDSPTH-MONTH-YEAR')FROM DUAL;
SELECT INITCAP(TO_CHAR(SYSDATE,'DDSPTH-MONTH-YEAR'))FROM DUAL;

SELECT TO_CHAR(SYSDATE,'DD-MM-YYYY')FROM DUAL;

/* DATE (19/04/2022) julian format to convert number into string*/

SELECT 'You have to pay '||
TO_CHAR(TO_DATE(5757,'J'),'JSP')||
' Before on '||
TO_CHAR(SYSDATE+10),
TO_CHAR(SYSDATE+10,'day..') FROM DUAL;

convert the char to date
SELECT TO_DATE('02/03/1993','dd/mm/yyyy') FROM dual;
convert the date into julion format
SELECT TO_CHAR(TO_DATE('02/03/1993','dd/mm/yyyy'),'j') FROM dual;


SELECT TO_CHAR(sysdate,'j')FROM DUAL;
SELECT TO_CHAR(sysdate,'JSP')JSP,TO_CHAR(sysdate,'J')J FROM DUAL;


SELECT TO_DATE('2459992','JSP')FROM DUAL;



-- differents between to char and to date
-- to char convert date into char
--to date convert char to date
-- 21-01-89   into 21st jan,1989

SELECT TO_CHAR(TO_DATE('21-01-89'),'ddth mon,yyyy') "date format" FROM DUAL;

-- general function
-- nvl
--nvl2
--nullif
--coalesce

SELECT first_name, salary, commission_pct, NVL(commission_pct,10)FROM employees;

SELECT first_name, salary, commission_pct, NVL2(commission_pct,0,1)FROM employees;

SELECT first_name, salary, commission_pct, NVL(TO_CHAR(commission_pct),'no commission')"no commission" FROM employees;

SELECT first_name, salary, commission_pct, NVL2(commission_pct,10,20)FROM employees;

-- nullif Return NULL if the same value,.. Return 1st arg if different value

SELECT NULLIF(1,1),NULLIF(1,2),NULLIF(2,1),NULLIF(2,2) FROM DUAL;
SELECT COALESCE(NULL,90,78,NULL,78,NULL,NULL,89) FROM DUAL;

-- multiple row function n-1
--Group function aggregate function
-- MIN(column name) 
--MAX(column name)
--SUM(column name)
--AVERAGE(column name)
--COUNT(column name or * )
SELECT MIN(salary)FROM employees;

SELECT MAX(salary)FROM employees;

SELECT SUM(salary) ROM FROM employees;

SELECT COUNT(salary)FROM employees;

SELECT COUNT(*)FROM employees;

SELECT MIN(salary)FROM employees;

-- null values not count
SELECT COUNT(commission_pct)FROM employees;

--null values count
SELECT COUNT(NVL(commission_pct,0))FROM employees;

SELECT COUNT(NVL(commission_pct,0))FROM employees;


--20/04/22 group function

SELECT MIN(salary),MAX(salary),ROUND(AVG(salary)),COUNT(salary) FROM employees;

CREATE TABLE mark_tb (mark NUMBER);

INSERT INTO mark_tb VALUES(100);
INSERT INTO mark_tb VALUES(NULL);
SELECT * FROM mark_tb;
SELECT AVG(mark)FROM mark_tb;  -- group fun never process null values so add nvl()

SELECT AVG(NVL(mark,'0')) FROM mark_tb;

-- error
SELECT department_id, MIN (salary) FROM employees;

--solution GROUP BY Department id

SELECT department_id, MIN (salary) FROM employees
GROUP BY department_id;
-- we can displayin orderwise

SELECT department_id, MIN (salary) FROM employees
GROUP BY department_id
ORDER BY 1;

-- we can display max salary

SELECT department_id, MAX(salary) FROM employees
GROUP BY department_id
ORDER BY 1;

-- we can display sum salary

SELECT department_id, SUM(salary) FROM employees
GROUP BY department_id
ORDER BY 1;

-- we can display count


SELECT department_id,COUNT(*) FROM employees
GROUP BY department_id
ORDER BY 1;

-- we can display avg

SELECT department_id,ROUND(AVG(salary)) FROM employees
GROUP BY department_id
ORDER BY 1;
-- we can use  where clause  
SELECT department_id,MAX(salary) FROM employees
WHERE department_id =50
GROUP BY department_id
ORDER BY 1;

-- we can not process where clause  if where clause depend on group func. ex count min max
-- error
SELECT department_id,count(*) FROM employees
WHERE COUNT(*) =50
GROUP BY department_id
ORDER BY 1;
--solution HAVING after grp by

SELECT department_id,count(*) FROM employees
GROUP BY department_id
HAVING COUNT(*) > =5
ORDER BY 1;

-- we can use having clause without group by clause
SELECT MAX(salary) FROM employees
HAVING MAX(salary) > 25000;
--find sum of salary above count >5

SELECT department_id,SUM(salary) FROM employees
GROUP BY department_id
HAVING COUNT(salary) > =5
ORDER BY 1;
-- we use where and having clause  in sam tim
SELECT department_id, SUM(salary) FROM employees
WHERE department_id IN(50,100,120,30,80,90)
GROUP BY department_id
HAVING SUM(salary)>100000
ORDER BY 1;

/* order of the clause       execution order
SELECT                      FROM 
FROM                        WHERE
WHERE                       GROUP BY        
GROUP BY                    HAVING
HAVING                      SELECT
ORDER BY                    ORDER BY
*/

/*   differents between where and having
--------------------------------------------------------------------------------
           where                                            having
--------------------------------------------------------------------------------

1.where cls follow FROM clas                     having cls follow GROUP BY cls
2.normal condition                               condition depends on group function
3.restriction will happn after fetching data     will happn after grouping
--------------------------------------------------------------------------------
*/
--evening                           
/*  Joins
joins -- selecting data from multiple tables(where class is mentatory)
employees tb  -->employee-id
department tb --> employee-id, location_id
location tb

types of joins

equi join      (matched records from both tables)      
outer join      (matched records + unmatched records)
    left outer join  (matched records + unmatched records left side table )
    right outer join (matched records + unmatched records right side table)
    full outer join   (matched records + unmatched records from both table)
self join
cross join 
natural join

      student s           course c
      -----------------------------------
  name     c_id         c_id     c_name    
name_1     30            10      data science 
name_2     10            20      oracle
name_3     50            30      python
name_4     40            40      big data
name_5     80            50      c++
                                         
 Equi join 
 ----------
 s.c_id  =  c.c_id
 -------------------
 name       c-name 
 -------------------
name_1     python
name_2   data science
name_3    C++
name_4     big data

                  outer join
                 ----------

Right out join        

s.c_id(+)  =  c.c_id      
 ------------------- 
 name      c name
 -------------------                                
name_1     python                                                                                                 
name_2   data science                                                      
name_3    C++                                                                
name_4     big data                                                               
   -        oracle
   
left out join        

s.c_id  =  c.c_id(+)      
 ------------------- 
 name      c name
 -------------------                                
name_1     python                                                                                                 
name_2   data science                                                      
name_3    C++                                                                
name_4     big data                                                               
name_5       -
full out join        

s.c_id  =  c.c_id(+)      
 ------------------- 
 name      c name
 -------------------                                
name_1     python                                                                                                 
name_2   data science                                                      
name_3    C++                                                                
name_4     big data                                                               
-           oracle
name_5         -
*/

--equi join example 

SELECT  employees.employee_id,
        employees.first_name,
        employees.hire_date,
       employees.department_id,
        departments.department_name
       FROM employees , departments
       WHERE employees.department_id = departments.department_id;

SELECT *FROM employees;
-- reduce complecate

SELECT  e.employee_id,
        e.first_name,
        e.hire_date,
       e.department_id,
        d.department_name
       FROM employees e , departments d
       WHERE e.department_id = d.department_id;
       
-- right join
SELECT  e.employee_id,
        e.first_name,
        e.hire_date,
       e.department_id,
        d.department_name
       FROM employees e , departments d
       WHERE e.department_id(+) = d.department_id;

left join

SELECT  e.employee_id,
        e.first_name,
        e.hire_date,
       e.department_id,
        d.department_name
       FROM employees e , departments d
       WHERE e.department_id = d.department_id(+);

--self join select the data with in a table
-- we can consider 2 table as employees e and m
-- find the manager name 
SELECT  e.employee_id,
        e.first_name, 
        e.salary,
        e.manager_id,
        m.first_name "Manager name",
        m.salary "Manager Salary"
FROM employees e , employees m
WHERE e.manager_id = m.employee_id;

-- who are getting more than manager salary

SELECT e.employee_id,e.first_name, e.hire_date,e.salary,
       e.manager_id, m.first_name " mngrnam", m.hire_date ,m.salary "mngr salary" 
FROM   employees e, employees m
WHERE e.manager_id = m.employee_id
AND   e.salary > m.salary;

-- who are hired before manager..
SELECT e.employee_id,e.first_name,e.hire_date,e.manager_id,
       m.first_name managername,m.hire_date mngrhired
FROM employees e,employees m 
WHERE e.manager_id = m.employee_id 
AND e.hire_date  < m.hire_date;
SELECT * FROM locations;
---26/04/22 

-- cross join
  ---wrong join
  --if we ignore the join condition / if you provide the invalid condition
  -- all the rows in the 1st tb will join with all the rows in the 2nd tb
  

SELECT e.employee_id,
       e.first_name,
       e.hire_date,
       e.manager_id,
       m.first_name managername,
       m.hire_date mngrhired
FROM employees e CROSS JOIN employees m ;

 
where -> on
   ,  -> join 
equi join , --> JOIN
RIGHT join , --> RIGHT JOIN
LEFT join , --> LEFT JOIN
FULL Join ,--> FULL JION

equi join ex:

SELECT  e.employee_id,
        e.first_name,
        e.hire_date,
       e.department_id,
        d.department_name
       FROM employees e  JOIN departments d
       ON e.department_id = d.department_id;

right join ex:

SELECT  e.employee_id,
        e.first_name,
        e.hire_date,
       e.department_id,
        d.department_name
       FROM employees e RIGHT JOIN departments d
       ON e.department_id(+) = d.department_id;

left join ex:
 
 SELECT  e.employee_id,
        e.first_name,
        e.hire_date,
       e.department_id,
        d.department_name
       FROM employees e LEFT JOIN departments d
       ON e.department_id = d.department_id(+);

FULL join ex:  
 

SELECT  e.employee_id,
        e.first_name,
        e.hire_date,
       e.department_id,
        d.department_name
       FROM employees e FULL JOIN departments d
       ON e.department_id = d.department_id;
self join ex:

SELECT  e.employee_id,
        e.first_name, 
        e.salary,
        e.manager_id,
        m.first_name "Manager name",
        m.salary "Manager Salary"
FROM employees e INNER JOIN employees m
ON e.manager_id = m.employee_id;

--we can select data from three different tb

SELECT e.employee_id,
       e.first_name,
       e.salary,
       e.department_id,
       d.department_name,
       d.location_id,
       l.street_address
FROM employees e , departments  d, locations l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id;

-- 2nd method


SELECT e.employee_id,
       e.first_name,
       e.salary,
       e.department_id,
       d.department_name,
       d.location_id,
       l.street_address
FROM employees e JOIN departments  d ON e.department_id = d.department_id
                 JOIN  locations l   ON d.location_id = l.location_id;

--how many condition we can use this 
-- 3 tb ==> 2 cnd
-- 4 tb ==> 3 cnd
-- 100 tb ==> 99 cnd
-- n tb ==> n-1 cnd

-- natural join
--natural joins are equal to equi join

-- here result will be in out of control
-- common column 2
SELECT e.employee_id,
       e.first_name,      
       e.salary,  
       department_id,
       d.department_name,
       d.location_id
FROM employees e NATURAL JOIN departments d;

-- correct  common column one
 SELECT department_id,
        d.department_name,
        l.street_address
FROM departments d NATURAL JOIN locations l ;
        
--Sub query
-- query with in another query
--sub query mostly with in the ()
-- inner query will get  executed first based on the result query will get executed (nested sub query)
-- who are all getting more than meenas salary

SELECT * FROM employees;
SELECT salary FROM employees WHERE first_name = 'Neena';
SELECT * FROM employees WHERE salary >  17000;
-- this s correct but after 10 yrs neena salary increase so this is not perfect
--crct ex

SELECT first_name, salary  
FROM employees
WHERE salary > (SELECT salary FROM employees WHERE first_name = 'Neena'); 

-- who are getting more than company avg salary

SELECT  ROUND(AVG(salary) FROM employees;
SELECT employee_id,first_name,salary FROM employees
WHERE salary >(SELECT  AVG(salary) FROM employees);
--nested sub query        (inner query will executed first)
  --single row sub query
  --multiple row sub query 
  --scalar sub query
  --inline view
  --multiple column sub query
-- correlated sub query    (outer query will executed first)

--SELECT ---> scalar sub query
FROM ---> inline view
WHERE
--GROUP BY (not sub query used)
HAVING
--ORDER BY (not sub query used)

--single row sub query
SELECT first_name, salary  
FROM employees
WHERE salary > (SELECT salary FROM employees WHERE first_name = 'Neena');
--multiple row sub query
--in  employee table have 2 alexander so error
SELECT first_name, salary  
FROM employees
WHERE salary > (SELECT salary FROM employees WHERE first_name = 'Alexander'); 
-- we can change the operator
-- it will return two possible salary  of two alexander
SELECT first_name, salary  
FROM employees
WHERE salary IN  (SELECT salary FROM employees WHERE first_name = 'Alexander'); 
-- error
SELECT first_name, salary  
FROM employees
WHERE salary  ALL (SELECT salary FROM employees WHERE first_name = 'Alexander'); 

-- we can use relational opr 
-- ALL will select maximum value
SELECT first_name, salary  
FROM employees
WHERE salary > ALL (SELECT salary FROM employees WHERE first_name = 'Alexander'); 
-- ANY will get minimum value

SELECT first_name, salary   
FROM employees
WHERE salary > ANY  (SELECT salary FROM employees WHERE first_name = 'Alexander'); 

--27/04/2022

--scalar sub query
SELECT | SUB query -->scaler sub query

SELECT COUNT (*) FROM employees;

SELECT COUNT (*) "10" FROM employees WHERE department_id= 90;
SELECT department_id ,COUNT(*) 
FROM employees 
WHERE  department_id IN(10,20,30,40,50)
GROUP BY department_id
ORDER BY  1;  
-- this is the scalar sub query example
-- we use dual not employees
SELECT (SELECT COUNT (*)  FROM employees WHERE department_id= 10) "10",
       (SELECT COUNT (*)  FROM employees WHERE department_id= 20) "20",
       (SELECT COUNT (*)  FROM employees WHERE department_id= 30) "30",
       (SELECT COUNT (*)  FROM employees WHERE department_id= 40) "40",
       (SELECT COUNT (*)  FROM employees WHERE department_id= 50) "50"
       FROM DUAL;
       

SELECT (SELECT COUNT (*)  FROM employees WHERE department_id= 10) "10",
       (SELECT COUNT (*)  FROM employees WHERE department_id= 20) "20",
       (SELECT COUNT (*)  FROM employees WHERE department_id= 30) "30",
       (SELECT COUNT (*)  FROM employees WHERE department_id= 40) "40",
       (SELECT COUNT (*)  FROM employees WHERE department_id= 50) "50",
       (SELECT COUNT (*)  FROM employees WHERE department_id IN (10,20,30,40,50)) "tot"
       FROM DUAL;
       
-- more ex
-- using join
SELECT e.employee_id,
       e.first_name,
       e.salary,
       e.department_id,
       d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;

--using scalar sub query
SELECT e.employee_id,
       e.first_name,
       e.salary,
       e.department_id,
    (SELECT d.department_name FROM departments d
    WHERE e.department_id = d.department_id)
FROM employees e;

--inline view (named sub query in from clause)
 -- simple ex for inline view
  SELECT * FROM (SELECT * FROM employees);

--disply all the department which contain maximum number of employees
-- 1st query for dprtm wwise max count
 SELECT department_id, count(*)FROM employees
 GROUP BY department_id
 ORDER BY 1 ;
--2nd max count
 SELECT MAX( count(*))
FROM employees
GROUP BY department_id;

--inline query ex:
--which dprtm have more employees

SELECT department_id, count(*)dprtwisecount FROM employees
 GROUP BY department_id
 ORDER BY 1;
 
 SELECT MAX( count(*))
maxcount FROM employees
GROUP BY department_id;

SELECT x.*  FROM
 (SELECT department_id, count(*)dprtwisecount FROM employees
 GROUP BY department_id
 ORDER BY 1) x ,
 (SELECT MAX( count(*))
maxcount FROM employees
GROUP BY department_id) y
WHERE x.dprtwisecount = y.maxcount ;

--which department have more salary allocation

SELECT department_id,SUM(salary) dprtwisecount FROM employees
 GROUP BY department_id
 ORDER BY 1;
 
 SELECT MAX( SUM(salary))
maxcount FROM employees
GROUP BY department_id;


SELECT x.*  FROM
 (SELECT department_id,SUM(salary) dprtwisecount FROM employees
 GROUP BY department_id
 ORDER BY 1) x ,
 (SELECT MAX( SUM(salary))
maxcount FROM employees
GROUP BY department_id) y
WHERE x.dprtwisecount = y.maxcount ;

-- 28/04/22
--HAVING --> sub query

SELECT department_id,ROUND(AVG(salary)  FROM employees
 GROUP BY department_id
 HAVING ROUND(AVG(salary)) >  (SELECT salary FROM employees WHERE first_name ='Neena')
 ORDER BY 1;

--correlated sub query

-- who are getting salary  more cmpny avg salary 
SELECT e.employee_id,e.first_name ,e.hire_date,e.department_id FROM employees e
WHERE salary >(SELECT  AVG(salary) FROM employees);

-- who are getting salary  more their dprtmnt =90

SELECT e.employee_id,e.first_name ,e.hire_date,e. salary,e.department_id FROM employees e
WHERE salary >(SELECT  AVG(salary) FROM employees WHERE department_id= 90);


-- who are getting salary  more their dprtmnt avg salary
-- sub query will not execute separatly
-- this is correlated sub query
SELECT e.employee_id,e.first_name ,e.hire_date,e. salary,e.department_id FROM employees e
WHERE salary >(SELECT  AVG(salary) FROM employees WHERE department_id= e.department_id);

-- who are all getting manager salary more than mngr salary

-- this is using join
SELECT  e.employee_id,e.first_name ,e.hire_date,e. salary,e.department_id, e.manager_id  
FROM    employees e, employees m
WHERE e.manager_id = m.employee_id
AND e.salary > m.salary;
-- this is using correlated sub query
SELECT  e.employee_id,e.first_name ,e.hire_date,e. salary,e.department_id, e.manager_id  
FROM    employees e
WHERE salary > (SELECT salary FROM employees WHERE employee_id = e.manager_id);


--who are all hired before mngr 
-- using join

SELECT  e.employee_id,e.first_name ,e.hire_date,e. salary,e.department_id, e.manager_id  
FROM    employees e, employees m
WHERE e.manager_id = m.employee_id
AND e.hire_date < m.hire_date;
--using correlated
SELECT  e.employee_id,e.first_name ,e.hire_date,e. salary,e.department_id, e.manager_id  
FROM    employees e
WHERE hire_date < (SELECT hire_date FROM employees WHERE employee_id = e.manager_id);

-- multiple column sub query
-- who are having neena's mngr id and dprtmnt id 

SELECT manager_id FROM employees WHERE first_name ='Neena';
SELECT department_id FROM employees WHERE first_name ='Neena';

--query

SELECT employee_id, first_name, salary, department_id 
FROM employees
WHERE manager_id =(SELECT manager_id FROM employees WHERE first_name ='Neena')
AND department_id =(SELECT department_id FROM employees WHERE first_name ='Neena');

-- less complex (error accur)
SELECT employee_id, first_name, salary, department_id 
FROM employees
WHERE manager_id ,department_id =(SELECT manager_id,department_id FROM employees WHERE first_name ='Neena');
-- solution we use ()

SELECT employee_id, first_name, salary, department_id 
FROM employees
WHERE (manager_id ,department_id) =(SELECT manager_id,department_id FROM employees WHERE first_name ='Neena');
-- ex
SELECT employee_id, first_name, salary, department_id 
FROM employees
WHERE (manager_id ,department_id) =(SELECT manager_id,department_id FROM employees WHERE first_name ='Neena')
AND first_name <> 'Neena';


--IN (DATA) ,  EXSITS (available or not)

z SELECT * FROM employees
 WHERE employee_id IN (SELECT employee_id FROM employees WHERE department_id=90);
 

 SELECT * FROM employees
 WHERE  EXISTS (SELECT employee_id FROM employees WHERE department_id=90);


 SELECT * FROM employees
 WHERE NOT EXISTS (SELECT employee_id FROM employees WHERE department_id=90);


-- 29/04/22
--psedo column
--its not a column inside table but act as a column

-- mostly we will use in plsql
--USER 
-- UID
--SYSDATE
--SYSTIMESTAMP
--ROWNUM 
--ROW ID
---sequence related psedocolumn
--NEXTLEVAL
--CURRVAL
--LEVAL
--exalmple
SELECT UID FROM DUAL;
SELECT USER FROM DUAL;
SELECT UID,USER FROM DUAL;
SELECT UID,USER,SYSDATE,SYSTIMESTAMP FROM DUAL;

SELECT UID,USER,SYSDATE, TRUNC (SYSTIMESTAMP) FROM DUAL;

--SYSDATE = TRUNC(SYSTIMESTAMP)
--we can convert date to TO_DATE
--we can convert TIMESTAMP to TO_SYSTIMESTAMP

--ROWNUM -- It is used to generate unique number at runtime
-- ROWNUM (before order by)
SELECT * FROM departments d;

SELECT ROWNUM, d.* FROM departments d;
SELECT ROWNUM, d.* FROM departments d ORDER BY department_name ASC;

SELECT ROWNUM, d.* FROM departments d ORDER BY department_name DESC;

SELECT ROWNUM, d.* FROM departments d 
WHERE ROWNUM <= 5;

SELECT ROWNUM, d.* FROM departments d 
WHERE ROWNUM <= 3;
-- not working 
SELECT ROWNUM, d.* FROM departments d 
WHERE ROWNUM >= 5;

-- <= only working
-- query for get 5th row
SELECT * FROM (SELECT ROWNUM rwnm, d.* FROM departments d 
WHERE ROWNUM <= 5) WHERE rwnm =5;

-- query for get any row
SELECT * FROM (SELECT ROWNUM rwnm, d.* FROM departments d 
WHERE ROWNUM <= 27) WHERE rwnm =25;
-- implementation

SELECT ROWNUM,salary  FROM employees;
SELECT salary  FROM employees;

SELECT ROWNUM, salary  FROM employees ORDER BY salary DESC;

-- get the maximun salary in DESC orderwise

-- find 1 st max salary and
SELECT   MAX(salary)  FROM employees;
-- find 2 st max salary and

SELECT MAX (salary) FROM employees WHERE salary <(SELECT  MAX(salary)  FROM employees) ;
--nth max salary we use inline view
SELECT * FROM
(
    SELECT ROWNUM rwnm ,salary 
    FROM
     (
     SELECT DISTINCT salary 
     FROM employees ORDER BY salary DESC
      )
) WHERE rwnm =23;

--1st exec
SELECT DISTINCT salary 
     FROM employees ORDER BY salary DESC
     
--2nd exec
-- it will give all the distinct salary rwnum wise
SELECT ROWNUM rwnm ,salary 
    FROM
     (
     SELECT DISTINCT salary 
     FROM employees ORDER BY salary DESC
      )
      
--3rd exec
-- its query fetch any rw num salary from 2nd query result
--because we cant fetch > 5th salary only (<= 5)
--so we use this method
-- INLINE VIEW
SELECT * FROM 
(
    SELECT ROWNUM rwnm,salary 
    FROM
     (
     SELECT DISTINCT salary 
     FROM employees ORDER BY salary ASC
      ) 
) WHERE rwnm =56;
-- EX2 we use inline view
SELECT MIN(salary) FROM
(
    SELECT ROWNUM ,salary 
    FROM
     (
     SELECT DISTINCT salary 
     FROM employees ORDER BY salary DESC
      ) 
);

--ROWID (physical address for each every row)
SELECT ROWID , department_id FROM employees;

SELECT ROWID, d.* FROM departments  d;

SELECT * FROM employees WHERE ROWID = 'AAAEAbAAEAAAADNAAF';
--implementation
 CREATE TABLE delete_tb (first_name VARCHAR(20));
INSERT INTO delete_tb VALUES('Gowri');
INSERT INTO delete_tb VALUES('Pathi');
INSERT INTO delete_tb VALUES('Pathi');
INSERT INTO delete_tb VALUES('Dhanya');
INSERT INTO delete_tb VALUES('Dhanya');
INSERT INTO delete_tb VALUES('Gowri');
INSERT INTO delete_tb VALUES('Pathi');
INSERT INTO delete_tb VALUES('Malar');
INSERT INTO delete_tb VALUES('Thangaraj');
INSERT INTO delete_tb VALUES('Pathi');
INSERT INTO delete_tb VALUES('Gowri');
END;
/
SELECT * FROM  delete_tb;

DELETE FROM delete_tb
 WHERE ROWID NOT IN 
 (
SELECT  MAX(ROWID) FROM delete_tb 
GROUP  BY first_name
);

--LEVAL
SELECT (SYSDATE-1)+ LEVEL FROM DUAL
CONNECT BY LEVEL <=31;
-- print DAY
SELECT (SYSDATE-1)+ LEVEL  "date", TO_CHAR((SYSDATE-1)+ LEVEL, 'DAY') "day" FROM DUAL
CONNECT BY LEVEL <=31;

SELECT (SYSDATE )+ LEVEL , TO_CHAR((SYSDATE)+ LEVEL,'day'  ) "Day"
FROM DUAL
CONNECT BY LEVEL <=30 ;
--01/05/22
-- we use DAY as D 1-sun ,2-mon,3-tue ....
SELECT ((SYSDATE-1)+ LEVEL)  "date", 
        TO_CHAR((SYSDATE-1)+ LEVEL, 'DAY') "day"
FROM DUAL
WHERE TO_CHAR((SYSDATE-1)+ LEVEL, 'D') IN (1,7)
CONNECT BY LEVEL <=31;

-- substr INFOCYCLE
SELECT LENGTH('INFOCYCLE')FROM DUAL;

SELECT SUBSTR('INFOCYCLE', LEVEL,1) FROM DUAL
CONNECT BY LEVEL <= LENGTH('INFOCYCLE');

-- level add one by one
-- pls view the result by change the num 1 --> 2,3,4,...
SELECT SUBSTR('INFOCYCLE', LEVEL,1) FROM DUAL
CONNECT BY LEVEL <= LENGTH('INFOCYCLE');

-- analitycal function
--2 types
-- 1. RANK() OVER (ORDER BY)
-- 2. DENSE_RANK() OVER (ORDER BY)
-- 3. LEAD()
-- 4. LaG ()
-- 5. MIN () OVER ()
-- 6. MAX () OVER ()
-- 7. AVG () OVER ()
-- 8. SUM () OVER ()
-- 9. COUNT() OVER ()
--10. FIRST_VALUE ()
--11. LAST_VALUE ()
-- tis is find nth num of salary using  rownum psedo 
SELECT * FROM
(
    SELECT ROWNUM rwnm ,salary 
    FROM
     (
     SELECT DISTINCT salary 
     FROM employees ORDER BY salary DESC
      )
) WHERE rwnm =23;

-- we use RANK 
 SELECT * fROM employees;
 SELECT first_name,
        employee_id,
        salary,
        RANK() OVER(ORDER BY salary DESC) rank
        FROM employees;
        
--dense rank (display all tha rank in salary wise)
SELECT first_name,
        employee_id,
        salary,
        RANK() OVER(ORDER BY salary DESC) rank,
        DENSE_RANK() OVER(ORDER BY salary DESC) rank
        FROM employees;
--display any one rank in salary wise
SELECT * FROM 
       (
        SELECT first_name,
        employee_id,
        salary,
        RANK() OVER(ORDER BY salary DESC) rank,
        DENSE_RANK() OVER(ORDER BY salary DESC) rank1
        FROM employees
       )
WHERE  rank1 =55;

-- display the rank in departmentwise
SELECT * FROM
        (
        SELECT first_name,
        employee_id,
        department_id,
        salary,
        DENSE_RANK() OVER(PARTITION BY department_id ORDER BY salary ASC) rank1
        FROM employees
        )
WHERE rank1=3;
-- display the rank in hiredatewise

SELECT * FROM
        (
        SELECT first_name,
        employee_id,
        department_id,
        salary,
        hire_date,
        DENSE_RANK() OVER(PARTITION BY department_id ORDER BY hire_date ASC) rank1
        FROM employees
        )
       
        WHERE rank1=2;
        
-----04/05/22  lead lag
SELECT first_name,
       department_id,
       salary,
       LEAD(salary,1,0) OVER (ORDER BY salary ASC) "LEAD1", --take 2nd value  
       LEAD(salary,2,0) OVER (ORDER BY salary ASC) "LEAD2",  --take 3rd value
       LAG(salary,1,0) OVER (ORDER BY salary ASC) "LAG1", 
       LAG(salary,2,0) OVER (ORDER BY salary ASC) "LAG1" 
FROM employees;
-- use partition        
SELECT first_name,
       department_id,
       salary,
       LEAD(salary,1,0) OVER (ORDER BY salary ASC) "LEAD1", --take 2nd value  
       LEAD(salary,2,0) OVER (ORDER BY salary ASC) "LEAD2",  --take 3rd value
       LAG(salary,1,0) OVER (ORDER BY salary ASC) "LAG1", 
       LAG(salary,2,0) OVER (ORDER BY salary ASC) "LAG1" 
FROM employees;

        SELECT * FROM employees;
        
 --LAG
 
 PARTITION BY department_id
 
 SELECT first_name,
       department_id,
       salary,
       LEAD(salary,1,0) OVER ( PARTITION BY department_id ORDER BY salary ASC) "LEAD1", --take 2nd value  
      -- LEAD(salary,2,0) OVER ( PARTITION BY department_id ORDER BY salary ASC) "LEAD2",  --take 3rd value
       LAG(salary,1,0) OVER ( PARTITION BY department_id ORDER BY salary ASC) "LAG1"
      -- LAG(salary,2,0) OVER ( PARTITION BY department_id ORDER BY salary ASC) "LAG1" 
FROM employees
WHERE department_id IN (50,60,70);

-- first_value, last value
 SELECT first_name,
       department_id,
       salary,
       FIRST_VALUE(salary) OVER () "1st value", 
       LAST_VALUE(salary) OVER () "last value" 

FROM employees
WHERE department_id IN (50,60,70);

-- MIN, MAX, AVG 

 SELECT first_name,
       department_id,
       salary,
      ROUND(AVG(salary) OVER()) cmpny_avg
FROM employees;
-- partition

 SELECT first_name,
       department_id,
       salary,
      ROUND(AVG(salary) OVER(PARTITION BY department_id )) cmpny_avg
FROM employees;


-- whats the diff between group fun and analitycal fun (min max avg)
-- grp fun we can't print other column 
 SELECT first_name,
       department_id,
       salary,
      ROUND(AVG(salary)) cmpny_avg
FROM employees;
-- error acc no sing
 SELECT first_name,
       department_id,
       salary,
      ROUND(AVG(salary)) cmpny_avg
FROM employees
GROUP BY first_name,
       department_id,
       salary ;
       
--sum fun
SELECT first_name,
       department_id,
       salary,
      ROUND(SUM(salary) OVER(PARTITION BY department_id)) dprtm_sum,
      ROUND(SUM(salary) OVER()) cmpny_sum
FROM employees; 


--LISTAGG
select department_id LISTAGG (name,',')IWITHIN GROUP (ORDER BY name ASC)"DATA"
FROM employees
   WHERE department_id IN (1,2,3)  
GROUP BY department_id;
-- we try this only 11 g
-- 05/05/2022
CREATE TABLE em (did number, name VARCHAR2(30));
INSERT INTO em VALUES(1,'a');
INSERT INTO em VALUES(1,'b');
INSERT INTO em VALUES(1,'c');
INSERT INTO em VALUES(2,'x');
INSERT INTO em VALUES(2,'y');
INSERT INTO em VALUES(2,'z');
INSERT INTO em VALUES(3,'m');
INSERT INTO em VALUES(4,'y');
--
SELECT did, LISTAGG (name,',')WITHIN GROUP (ORDER BY name ASC)" list"
FROM em 
GROUP BY did;

SELECT did, LISTAGG ( DISTINCT name,',')WITHIN GROUP (ORDER BY name ASC)" list"
FROM em SELECT USER NAME FROM dual;



-- 05/05/2022

-- DATA difine language
-- table design format in excel type
-- student_id  NUMBER,
--    stud_name VARCHAR2(20),
--  dob DATE,
--gender CHAR,
--  department_id NUMBER(20)

CREATE TABLE stud_tb
(
    student_id  NUMBER,
    stud_name VARCHAR2(20),
    dob DATE,
    gender CHAR,
    department_id NUMBER(20)
);
DESC stud_tb;
-- alter ->ADD ,rename ,modify,drop column (only column level change)
-- feedback table altered

ALTER TABLE stud_tb ADD feedback LONG;
ALTER TABLE stud_tb RENAME COLUMN student_id TO student_num;
ALTER TABLE stud_tb MODIFY feedback VARCHAR2(100);
ALTER TABLE stud_tb DROP COLUMN feedback;

-- 06/05/22 
CREATE TABLE electricals
       (
       material_name VARCHAR2(20),
       material_qnt  NUMBER,
       material_price NUMBER,
       service_det VARCHAR2(100),
       service_chrg NUMBER
       );
ALTER TABLE electricals ADD date_inf DATE; 
ALTER TABLE electricals RENAME COLUMN material_price TO material_rate ; 
ALTER TABLE electricals MODIFY service_det VARCHAR2(50) DEFAULT 'service';
ALTER TABLE electricals DROP COLUMN  date_inf ;

DESC electricals;
-- Rename the table   option
RENAME stud_tb TO studs_tb;
DESC studs_tb;
-- TRUNCATE only delete data not table structure
TRUNCATE TABLE studs_tb;
-- DROP delete data and structure hole table
DROP TABLE studs_tb;

--how to copy the table another one
--how to create tb using with sub query
CREATE TABLE dept1
AS
SELECT * FROM departments;
SELECT * FROM dept1;
TRUNCATE TABLE dept1;
DESC dept1;
DROP TABLE dept1;
-- how to copy the table with data

CREATE TABLE dept3
AS
SELECT * FROM dept1 WHERE 1=1;

SELECT * FROM dept3;

 -- how to copy the table without data

CREATE TABLE dept2
AS
SELECT * FROM dept1 WHERE 1=2;

SELECT * FROM dept2;
DESC dept2;

-- DML data mnipulation language
-- INSERT OPTION 
SELECT * FROM electricals;

INSERT INTO electricals(material_name ,material_qnt ,material_rate, service_det ,service_chrg) 
             VALUES('9w bulb', 2,100, 'fan serv', 150);
INSERT INTO electricals(material_name ,material_qnt ,material_rate, service_det ,service_chrg) 
             VALUES('wire', 3,80, 'mixi serv', 80);
INSERT INTO electricals(material_name ,material_qnt ,material_rate, service_det ,service_chrg) 
             VALUES('3w bulb', 2,80, 'tower fan serv', 300);
INSERT INTO electricals(material_name ,material_qnt ,material_rate, service_det ,service_chrg) 
             VALUES('led tube light', 1,350, 'celing fan serv', 160);
INSERT INTO electricals(material_name ,material_qnt ,material_rate, service_det ,service_chrg) 
             VALUES('capacitor', 5,200, 'plumping serv', 500);                      

INSERT INTO electricals(material_name ,material_qnt ,material_rate,service_chrg) 
             VALUES('table fan cap', 2,90, 500);          

SELECT * FROM electricals;

SELECT material_name, material_rate FROM electricals;

SELECT material_name, material_rate FROM electricals;
SELECT SUM(material_rate) FROM electricals;
SELECT SUM(service_chrg) FROM electricals;

-- inserting data in INSERT using with sub query

INSERT INTO dept2 (SELECT * FROM departments); 
--how to  insert null value  '',NULL,ignore that column
INSERT INTO electricals(material_name ,material_qnt ,material_rate,service_det,service_chrg) 
             VALUES(' distle water', 2,30,'iron box ser', '' ); 
     
--- update the data
 
SELECT * FROM dept2;
UPDATE dept2
SET department_name='Admin'
WHERE department_id =10;

UPDATE dept2
SET department_name='It',
    location_id=1500,
    manager_id=105
WHERE department_id= 60;
DELETE FROM dept2 WHERE department_id IN (10,20,30);

--unfortunately we can skip the where clause all data deleted
SELECT * FROM dept1;

DELETE FROM  dept1;

-- what is the diff btw TRUNCATE and DELETE
/*  TRUNCATE                     DELETE
 
 cant restriction              we can restriction
 cant use where cls            we can use where cls            
 table truncated               2, 5, rows deleted
 FAST                          Slow
 cant  ROLLBACK                we can ROLL BACK
 */
 
 
CREATE TABLE test_try (id NUMBER , name VARCHAR2(20));

ALTER TABLE electricals ADD date_inf DATE; 

ALTER TABLE test_try ADD gender CHAR(3);
ALTER TABLE test_try RENAME COLUMN name TO customer_name ;
ALTER TABLE test_try RENAME COLUMN id TO customer_id ;
 ALTER TABLE test_try MODIFY gender CHAR;
SELECT * FROM test_try;
DESC test_try;
 INSERT INTO test_try (customer_id, customer_name,gender)
                VALUES(1,'ram1','f');
 INSERT INTO test_try (customer_id, customer_name,gender)
                VALUES(2,'ram2','m');
 INSERT INTO test_try (customer_id, customer_name,gender)
                VALUES(3,'ram3','f');
 INSERT INTO test_try (customer_id, customer_name,gender)
                VALUES(4,'ram4','m');
 INSERT INTO test_try (customer_id, customer_name,gender)
                VALUES(5,'ram5','m');
 INSERT INTO test_try (customer_id, customer_name,gender)
                VALUES(6,'ram6','f');
commit;
 ALTER TABLE test_try MODIFY gender CHAR(5);
commit;
 INSERT INTO test_try (customer_id, customer_name,gender)
                VALUES(7,'ram7','f');
                
                
CREATE TABLE cus_tb(cus_id NUMBER(20),cus_nam VARCHAR2(20) );

INSERT INTO cus_tb (cus_id, cus_nam)
VALUES(1,'sam6');
SELECT * FROM cus_tb;
commit;


SELECT * FROM test_try;

 --TCL transaction control language
 
 --Commit 
 --rollback
 --savepoint
 --transaction-> List of transaction happens between to commit points
 
 /* in ddl  statment automatically committed
 but in dml we can give the commit statmnt.. 
 ROLLBACK stmn is used for undo after commit action..
 savepoint option is used to rollback 
 savepoint s6;
 savepoint s10;
  savepoint s11;
ROLLBACK TO s11;

-- interw qus 
t1
1
2
3
commit;
4
5
---------
t2

1
2

t1..?
t2..?
Ans:
t1--> 12345
t2--> --
*/
/* DTL dta transaction language

GRAND
REVOKE
 tablespace --. logical
 Data file --- physical
Blocks

tablespace  
-User tablespace
   USERS , SYSTEM  , SYSAUX
-temporary tablespace
  TEMP
-undo tablespace

how to create a new user
(( 
 CREATE USER gowrics
 IDENTIFIED BY gows
 default tablespace users
 quota 10m on users
 TEMPORARY  tablespace temp;
 
 ))
 
user created..
connect gowrics/gows
error

show user
"" 
 connect/system/open ---> admin
 connected
 
 GRAND CONNECT, CREATE TABLE TO gowrics;

> connect gowrics/gows;
Connected.
SQL> show user
USER is "GOWRICS"

 CREATE TABLE test(roll_no NUMBER);

Table created.
--how to alter user password or quota
1st we  connect system/open
connected
SQL> ALTER USER gowrics
  2  IDENTIFIED BY gowss
  3  quota 10m ON SYSAUX;

User altered.
 
SQL> connect gowrics/gowss
Connected.
table test
CREATE TABLE test1(id NUMBER)TABLESPACE SYSAUX
SELECT table_name,tablespace_name FROM user_tables;

TABLE_NAME                     TABLESPACE_NAME
------------------------------ ------------------------------
TEST                           USERS
TEST_1                         USERS
TEST_2                         SYSAUX

privillage
USER is "GOWRICS"
SQL> connect system/open
Connected.
SQL> CREATE TABLE ex_1(s_no NUMBER , name VARCHAR2(20));
Table created.

INSERT INTO ex_1 VALUES(1,'ram');

1 row created.

SQL> INSERT INTO ex_1 VALUES(2,'sam');

1 row created.

SQL> INSERT INTO ex_1 VALUES(3,'dam');

1 row created.

SQL> INSERT INTO ex_1 VALUES(4,'jam');

1 row created.

SQL> SELECT * FROM ex_1;

      S_NO NAME
---------- --------------------
         1 ram
         2 sam
         3 dam
         4 jam

SQL> connect gowrics/gowss
Connected.
SQL> SELECT * FROM ex_1;

ERROR at line 1:
ORA-00942: table or view does not exist

SQL> connect system/open

Connected.
GRANT SELECT ON ex_1 TO gowrics;
(we can only use select statment)
 connect gowrics/gowss
Connected.
SQL> SELECT * FROM SYSTEM. ex_1;

      S_NO NAME
---------- --------------------
         1 ram
         2 sam
         3 dam
         4 jam


GRANT SELECT ,INSERT, UPDATE ON ex_1 TO gowrics;
(we can use select,insert,update)
SQL> connect gowrics/gowss
Connected.
sql> INSERT INTO SYSTEM.ex_1 VALUES(6,'gam');
1 row created.
SQL> SELECT * FROM SYSTEM. ex_1;

      S_NO NAME
---------- --------------------
         1 ram
         2 sam
         3 dam
         4 jam
         5 fam
         6 gam
6 rows selected.
--dba_ tables of admin 
--user_tables of local user
--all_tables of local user and privillage user tb

to lock user account
ALTER USER gowrics ACCOUNT LOCK;
ALTER USER gowrics ACCOUNT UNLOCK;

*/
SELECT department_id,department_name FROM departments;
