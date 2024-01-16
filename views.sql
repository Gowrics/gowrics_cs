--logical representation
--simple view
/*
view is a virtual or logical table for the base tb
view will not store data but store only select statm query
it will create help of select stm
simple view-- svw when we access the req data from a single base tb
svw is also called as a updated vw
it can access all dml opr

--complex view
cvw when we access the req data from a multible  base tb
svw is also called as a non-updated vw
it cannot access all dml opr on multible base tb at a time





*/
CREATE OR REPLACE VIEW dept_50
AS
SELECT employee_id,first_name,department_id
FROM emp
WHERE department_id =50;

SELECT employee_id empno,first_name name,department_id deptno FROM dept_50;


select 
* from JOBS;
user_tables;
 
 create view salann
 as
 select first_name,employee_id,department_id,salary * 12 annsal from employees;
select * from salann;


--complex view

CREATE OR REPLACE VIEW deptname_vw
AS
SELECT e.employee_id,e.first_name,LTRIM(e.department_id,' ') department_id,d.department_name 
FROM employees e,departments d
WHERE e.department_id=d.department_id
AND  e.department_id =50;
SELECT * FROM deptname_vw;

--materialized view 
/*  materialized view is a db oblect that stored query result and precomputed result
--view store query but matrzd view store query result
reson for mv
1.to maintain a local copy for remove db obje 
2.to improve the performance  of complex group by complex aggregate opr

*/

CREATE  MATERIALIZED VIEW sal1_vw
AS
SELECT department_id,SUM(salary) "tot sal"
FROM emp
GROUP BY department_id
ORDER BY 1 ASC;

DROP MATERIALIZED VIEW sal_vw;
SELECT * FROM sal1_vw;



in day today operation the data is changes in base tab


--UPDATE MATERIALIZED VIEW

if chage the materialized vw not change updated
to updating the mvw is called refreshing
refresh on demand
refresh on 


UPDATE emp SET salary =salary +100;

SELECT * FROM sal1_vw
ORDER BY  1 ASC; --no updated


execute dbms_mview.refresh('sal1_vw');

--FORCE VIEW

CREATE OR REPLACE FORCE VIEW frc_vw
AS
select * from goos;


create table goos(id NUMBER);
insert into goos values(10);
insert into goos values(20);
insert into goos values(30);
insert into goos values(40);
insert into goos values(50);

--vw
insert into frc_vw values(50);

--update
update frc_vw set id =60
where  rowid='AAAGBPAAEAAABlzAAF';




--WITH READ ONLY


CREATE OR REPLACE  VIEW frc_vw
AS
select * from goos
WITH READ ONLY;

select ROWID,id FROM frc_vw;



--connot do
insert into frc_vw values(60);

update frc_vw set id =50
where  rowid='AAAGBPAAEAAABlzAAF';

--with check option


CREATE OR REPLACE  VIEW emp30_vw
AS;
select * from emp;
where department_id=30;

select * from emp30_vw ;
-- we insert other dept in via emp30_vw

insert INTO emp30_vw (employee_id,first_name,last_name,email,hire_date,job_id,salary,manager_id,department_id)
             VALUES(210,'gow','zic','GOWZIK',TO_DATE('18-05-03'),'PU_MAN',19999,100,50);
select * from emp30_vw ;
select * from emp ;



CREATE OR REPLACE VIEW emp30_vw
AS
select * from emp
where department_id=30
WITH CHECK OPTION;


select * from emp30_vw ;

--we cannot insert other dept inf  into emp30_vw  view bcoz this with check option..
insert INTO emp30_vw (employee_id,first_name,last_name,email,hire_date,job_id,salary,manager_id,department_id)
             VALUES(210,'gow','zic','GOWZIK',TO_DATE('18-05-03'),'PU_MAN',19999,100,30);

update emp30_vw set salary=salary+10
where department_id=40;

rollback;

delete emp WHERE employee_id=210;


--we can create a view for using group by ,pesudo

create or replace view empname_vw
as
select department_id,first_name from employees
group by department_id,first_name
order by 1;

create or replace view empname_vw
as
select rowid ids,employee_id from employees;
order by 1;
select * from empname_vw;

create or replace view empname_vw
as
select distinct(salary),department_id from employees
;
