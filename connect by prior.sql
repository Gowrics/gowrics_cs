
select e.manager_id,m.first_name manager_name,e.employee_id,e.first_name, from employees e,employees m
where e.manager_id=m.employee_id
order by 1;




select * from emps;

SELECT lv1_empid,lv1_name,lv1,lv2_empid,lv2_name,lv2,lv3_empid,lv3_name,3 lv3,empid lv4_empid,name lv4_name,4 lv4
FROM
(        
    SELECT lv1_empid,lv1_name,lv1,lv2_empid,lv2_name,lv2,empid lv3_empid,name lv3_name,3 lv3
    FROM
        (
         SELECT lv1_empid,lv1_name,lv1,empid lv2_empid,name lv2_name,2 lv2
         FROM (
             SELECT empid lv1_empid,name lv1_name,1 lv1
             FROM emps
             WHERE mngid IS NULL
             )L1,emps L2
            WHERE L2.mngid(+)=L1.lv1_empid  
         )L3,emps L4
         WHERE L4.mngid(+)=L3.lv2_empid
)L4,emps L5
WHERE L5.mngid(+)=L4.lv3_empid;

````````````````````````````````````````````````````````````;

             SELECT empid lv1_empid,name lv1_name,1 lv1
             FROM emps
             WHERE mngid IS NULL;


  --hierarchy data
SELECT empid,name,LEVEL,mngid FROM emps 
CONNECT BY PRIOR empid=mngid
START WITH mngid IS NULL 
ORDER BY 3;

SELECT employee_id,first_name,LEVEL,manager_id FROM employees 
CONNECT BY PRIOR employee_id=manager_id
START WITH manager_id IS NULL 
ORDER BY 3;



--hierarchy tree
SELECT CONCAT(LPAD('-',level*5-5),name),
level FROM emps 
CONNECT BY PRIOR empid=mngid
START WITH mngid IS NULL;
ORDER BY 1;

--sort the hierarchy tree

SELECT CONCAT(LPAD('-',level*5-5),name),
level FROM emps 
CONNECT BY PRIOR empid=mngid
START WITH mngid IS NULL
ORDER SIBLINGS BY emps.name DESC;

--CONNECT BY ROOT
--1st level root
SELECT empid,name,LEVEL,mngid,CONNECT_BY_ROOT name tobboss FROM emps 
CONNECT BY PRIOR empid=mngid
START WITH mngid IS NULL ;


--CONNECT BY ROOT
--2st level root;

select * from emps
ORDER BY 1;
ALTER TABLE emps ADD mngname VARCHAR2(20);

TRUNCATE table emps;


INSERT INTO emps
(
select e.employee_id,e.first_name,e.manager_id,m.first_name mngname
FROM employees e,employees m
WHERE e.manager_id=m.employee_id(+)
);
SELECT empid,name FROM 
(
SELECT empid,name,LEVEL,mngid,CONNECT_BY_ROOT name tobboss FROM emps 
CONNECT BY PRIOR empid=mngid
START WITH mngid =100
ORDER BY 1
)
WHERE tobboss='Neena';


select sum(salary) FROM employees
WHERE manager_id =100;
``````````````````````````````````````````````';
-- sys connect by path


 SELECT empid,name,LEVEL,SYS_CONNECT_BY_PATH (name,'/') hires FROM emps 
CONNECT BY PRIOR empid=mngid
START WITH mngid IS NULL;


 SELECT employee_id,first_name,LEVEL,SYS_CONNECT_BY_PATH (first_name,'/') hires FROM employees 
CONNECT BY PRIOR employee_id=manager_id
START WITH mngid IS NULL;




 SELECT empid,name,LEVEL,SYS_CONNECT_BY_PATH (name,'<--') hires FROM emps 
CONNECT BY PRIOR empid=mngid
START WITH mngid IS NULL;



--remove the before / use trim leading '/' from value but single char


 SELECT empid,name,LEVEL,TRIM(LEADING '/' FROM (SYS_CONNECT_BY_PATH (name,'/'))) hires FROM emps 
CONNECT BY PRIOR empid=mngid
START WITH mngid IS NULL;
--


 SELECT empid,name,LEVEL,TRIM(LEADING '/' FROM (SYS_CONNECT_BY_PATH (name||''||empid,'/'))) hires FROM emps 
-- SELECT empid,name,LEVEL,TRIM(LEADING '/' FROM (SYS_CONNECT_BY_PATH (name||'-'||empid,'/'))) hires FROM emps 
CONNECT BY PRIOR empid=mngid
START WITH mngid IS NULL;

-- its not work for more char

 SELECT empid,name,LEVEL,TRIM(LEADING '<--' FROM (SYS_CONNECT_BY_PATH (name,'<--'))) hires FROM emps 
CONNECT BY PRIOR empid=mngid
START WITH mngid IS NULL;

--use ltrim
 SELECT empid,name,LEVEL,LTRIM((SYS_CONNECT_BY_PATH (name,'<--')),'<--') hires FROM emps 
CONNECT BY PRIOR empid=mngid
START WITH mngid IS NULL;

 select  * from v$database;


