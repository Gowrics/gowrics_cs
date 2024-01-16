
--analytical function 
--rank
--RANk will assign non_consecutive values ,which means there will be gaps in number
--DENSE RANk will assign consecutive values ,which means there will be no gaps in number
--lead,lag,first_value,last_value,listagg 11g
--min max sum avg count


 SELECT  employee_id
         ,first_name
         ,hire_date
         ,salary
         ,department_id
--       ,RANK() OVER(ORDER BY salary DESC) RANK
--       ,DENSE_RANK() OVER(ORDER BY salary DESC) RANK
        , DENSE_RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) dnrk
  FROM employees;


--order the hiredate 

select first_name,hire_date,department_id, rank() over(partition by department_id order by hire_date asc) hire_order from employees;

select employee_id ,salary,department_id, sum(salary) over(partition by department_id order by employee_id)from employees;

select employee_id ,salary,department_id, sum(salary) over()from employees;



 SELECT  employee_id
         ,first_name
         ,hire_date
         ,salary
         ,department_id
         ,MAX(salary) OVER(PARTITION BY department_id)max
         ,MIN( salary) OVER(PARTITION BY department_id)min
        ,ROUND(AVG(salary) OVER(PARTITION BY department_id))avg
         ,SUM( salary) OVER(PARTITION BY department_id)sum
         ,COUNT( salary) OVER(PARTITION BY department_id)count

  FROM employees;





--partition

SELECT  employee_id
       ,first_name
       ,hire_date
       ,salary
       ,department_id
       ,RANK() OVER( PARTITION BY department_id ORDER BY salary DESC) RANK
       ,DENSE_RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) RANK
FROM employees;

--e
SELECT * FROM
(
     SELECT  employee_id
         ,first_name
         ,hire_date
         ,salary
         ,department_id
--       ,RANK() OVER(ORDER BY salary DESC) RANK
--       ,DENSE_RANK() OVER(ORDER BY salary DESC) RANK
         , DENSE_RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) dnrk
     FROM employees
 )
WHERE dnrk =2;





SELECT first_name 
      ,salary
      ,department_id
    ,LEAD(salary,1,0)OVER(ORDER BY salary) lead1
     ,LEAD(salary,2,0)OVER(ORDER BY salary) lead2
     ,LAG(salary,1,0)OVER(ORDER BY salary)  lag1
    ,LAG(salary,2,0)OVER(ORDER BY salary)  lag2
    ,FIRST_VALUE(salary) OVER() "1st val"
    ,LAST_VALUE(salary) OVER()  "2nd value"

FROM employees;
       
    ,LEAD(salary,1,0)OVER(ORDER BY salary) lead1
       
select last_value(first_name) over(order by first_name) from employees;       
       
       
select first_name,salary,department_id,"min sal","max sal" from( 
SELECT first_name 
      ,salary
      ,department_id
    ,LEAD(salary,1,0)OVER(partition by department_id ORDER BY salary) lead1
     ,LAG(salary,1,0)OVER(partition by department_id ORDER BY salary)  lag1
    ,FIRST_VALUE(salary) OVER(partition by department_id ) "min sal"
    ,LAST_VALUE(salary) OVER(partition by department_id )  "max sal"

FROM employees);
where department_id=30;
       
       
       
SELECT  first_name,department_id,salary
        ,MIN(salary)OVER(partition by department_id) min
        ,MAX(salary)OVER() max
        ,SUM(salary)OVER() sum
        ,ROUND(AVG(salary)OVER()) avg
FROM employees;

       
--ex

SELECT  first_name,department_id,salary
        ,SUM(salary)OVER(PARTITION BY department_id) sum
FROM employees
;


SELECT  first_name,department_id,salary
        ,MIN(salary)OVER(PARTITION BY department_id) min
        ,MAX(salary)OVER(PARTITION BY department_id) max
        ,SUM(salary)OVER(PARTITION BY department_id) sum
        ,ROUND(AVG(salary)OVER(PARTITION BY department_id)) avg

FROM employees;
SELECT * FROM
(
SELECT  first_name,department_id,salary
        ,COUNT(department_id)OVER(PARTITION BY department_id) deptcount
FROM employees
)
WHERE deptcount=1;

SELECT COUNT (department_id) FROM employees
GROUP BY department_id;

--LISTAGG

CREATE TABLE tb(did NUMBER(4),name VARCHAR2(8));
INSERT INTO tb VALUES(1,'ram');
INSERT INTO tb VALUES(2,'sam');
INSERT INTO tb VALUES(1,'kam');
INSERT INTO tb VALUES(2,'tam');
INSERT INTO tb VALUES(3,'bam');
INSERT INTO tb VALUES(3,'pam');
INSERT INTO tb VALUES(3,'sam');

SELECT * FROM tb;

SELECT did, LISTAGG(name,',') WITHIN GROUP (ORDER BY name ASC) alls 
FROM tb
GROUP BY did;


select department_id,listagg(job_id,',') within group (order by job_id)  from employees
group by department_id;

select distinct(job_id) from employees;
group by department_id;


SELECT department_id, LISTAGG(first_name||'-'||salary,',') WITHIN GROUP(ORDER BY first_name ASC)" alls" 
FROM employees
GROUP BY department_id;
select * from locations;


 SELECT l.city,LISTAGG(e.first_name||'-'||LEVEL,',')WITHIN GROUP(ORDER BY first_name ASC)
 "alls"
FROM employees e,departments d,locations l
WHERE e.department_id=d.department_id
AND d.location_id =l.location_id
CONNECT BY LEVEL <=200
GROUP BY l.city;




SELECT SUBSTR('malarvizhi',LEVEL,1)
FROM dual
CONNECT BY LEVEL <= LENGTH('malarvizhi');




Susan-40
Hermann-70
Alberto-80,Allan-80,Alyssa-80,Amit-80,Charles-80,Christopher-80,Clara-80,Danielle-80,David-80,David-80,Eleni-80,Elizabeth-80,Ellen-80,Gerald-80,Harrison-80,Jack-80,Janette-80,John-80,Jonathon-80,Karen-80,Lindsey-80,Lisa-80,Louise-80,Mattea-80,Nanette-80,Oliver-80,Patrick-80,Peter-80,Peter-80,Sarath-80,Sundar-80,Sundita-80,Tayler-80,William-80
Alexander-30,Daniel-100,Den-30,Guy-30,Ismael-100,Jennifer-10,John-100,Jose Manuel-100,Karen-30,Lex-90,Luis-100,Nancy-100,Neena-90,Shelley-110,Shelli-30,Sigal-30,Steven-90,William-110
Adam-50,Alana-50,Alexis-50,Anthony-50,Britney-50,Curtis-50,Donald-50,Douglas-50,Girard-50,Hazel-50,Irene-50,James-50,James-50,Jason-50,Jean-50,Jennifer-50,John-50,Joshua-50,Julia-50,Julia-50,Kelly-50,Kevin-50,Kevin-50,Ki-50,Laura-50,Martha-50,Matthew-50,Michael-50,Mozhe-50,Nandita-50,Payam-50,Peter-50,Randall-50,Randall-50,Renske-50,Samuel-50,Sarah-50,Shanta-50,Stephen-50,Steven-50,TJ-50,Timothy-50,Trenna-50,Vance-50,Winston-50
Alexander-60,Bruce-60,David-60,Diana-60,Valli-60
Michael-20,Pat-20
;/


--using row_number ,last_value
--print total employees count in each dept

SELECT a.s_no,employee_id,first_name,salary,department_id,LAST_VALUE(a.s_no)OVER(partition by department_id)dept_count FROM 
(
select ROW_NUMBER()over(partition by department_id order by employee_id) s_no,employee_id,department_id,first_name,salary FROM employees
)a;






select first_name from 
( select row_number()over(partition by department_id order by salary )sno,first_name,salary,department_id from employees)
where sno =1;




select employee_id,department_id,first_name,salary,COUNT()OVER(partition by department_id)counts FROM employees;


