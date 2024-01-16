
SELECT UID FROM dual;
SELECT UID,USER FROM dual;
SELECT UID,USER,SYSDATE FROM dual;
SELECT UID,USER,SYSDATE,SYSTIMESTAMP FROM dual;
SELECT TO_CHAR(SYSTIMESTAMP,'day') FROM dual;
SELECT TO_CHAR(SYSTIMESTAMP,'dd/mon/yyyy') FROM dual;

-- rownum
SELECT ROWNUM,d.* FROM departments d
;

SELECT ROWNUM,d.* FROM departments d
ORDER BY d.manager_id;

SELECT ROWNUM,d.* FROM departments d
ORDER BY department_id;


SELECT ROWNUM,d.* FROM departments d
WHERE ROWNUM =20;

SELECT ROWNUM,d.* FROM departments d
WHERE ROWNUM >=3;

-- only display <5 
SELECT * FROM 
(
SELECT ROWNUM rwnum,d.* FROM departments d 
)
WHERE rwnum = 11;

SELECT salary from employees;
SELECT MAX(salary) from employees;

SELECT MAX(salary) from employees
WHERE salary < (
SELECT MAX(salary) from employees
);
select * from (
select rownum ordr ,e.* from
(
select distinct salary from employees
order by 1 desc)e)
where ordr =1;



SELECT * FROM 
(
SELECT ROWNUM rnum,salary FROM 
(
SELECT DISTINCT salary from employees
ORDER BY salary DESC
) 
)
WHERE rnum =1;

--
SELECT ROWNUM ,salary FROM 
(
SELECT DISTINCT salary from employees
ORDER BY salary DESC
) WHERE ROWNUM <=5;

--rowid
SELECT ROWID, d.* FROM departments d;

SELECT ROWID, d.* FROM departments d
WHERE ROWID = 'AAAEAWAAEAAAACtAAO';
--last inserted record

SELECT * FROM departments d
WHERE ROWID = (SELECT MAX(ROWID) FROM departments);

--how to delete repeated records

drop table dub_rec;

CREATE TABLE dub_rec(ids number, name VARCHAR2(20));
INSERT INTO dub_rec VALUES(1,'ram');
INSERT INTO dub_rec VALUES(1,'ram');
INSERT INTO dub_rec VALUES(2,'saj');
INSERT INTO dub_rec VALUES(3,'raj');
INSERT INTO dub_rec VALUES(2,'saj');
INSERT INTO dub_rec VALUES(9,'ravi');
INSERT INTO dub_rec VALUES(5,'pavi');
INSERT INTO dub_rec VALUES(5,'savi');
INSERT INTO dub_rec VALUES(8,'savi');

/
SELECT *  FROM dub_rec;

DELETE FROM dub_rec
WHERE ROWID NOT IN
(
SELECT MAX(ROWID) FROM dub_rec
GROUP BY NAME
);

--level
SELECT SYSDATE-1 + LEVEL FROM dual
CONNECT BY LEVEL <30;

SELECT (SYSDATE) + LEVEL, TO_CHAR((SYSDATE-1) + LEVEL,'day') FROM dual
CONNECT BY LEVEL <30;


SELECT (SYSDATE-1) + LEVEL,TO_CHAR((SYSDATE-1) + LEVEL,'ddspth')"Date", TO_CHAR((SYSDATE-1) + LEVEL,'day')"Day",TO_CHAR((SYSDATE-1) + LEVEL,'Month')"Month" FROM dual
CONNECT BY LEVEL <30;




SELECT SYSDATE-1 + LEVEL,TO_CHAR((SYSDATE-1) + LEVEL,'day')"day", TO_CHAR((SYSDATE-1) + LEVEL,'d')"day" FROM dual
--WHERE TO_CHAR((SYSDATE-1) + LEVEL,'d') IN (1,7)
CONNECT BY LEVEL <30
;

-- malarvizhi
SELECT LENGTH('malarvizhi')FROM dual; 


SELECT substr('malarvizhi',level,1)FROM dual
connect by level<=length('malarvizhi'); 





SELECT SUBSTR('malarvizhi',LEVEL,1)
FROM dual
CONNECT BY LEVEL <= LENGTH('malarvizhi');




SELECT * FROM 
(SELECT ROWNUM rwnm, d.* FROM departments d)
WHERE rwnm<15; 


SELECT MAX(salary) FROM employees;

SELECT MIN(salary) FROM 
            (
            SELECT ROWNUM rwnum,salary FROM 
                        (SELECT UNIQUE(salary) 
                         FROM employees
                         ORDER BY 1 DESC)
            )
WHERE rwnum <5 ;

SELECT ROWNUM, e.* FROM employees e;









SELECT (SYSDATE-1) +  LEVEL ,TO_CHAR((SYSDATE-1)+LEVEL,'DAY') FROM DUAL
WHERE TO_CHAR((SYSDATE-1)+LEVEL,'d')=2
CONNECT BY LEVEL <= 30;


select * from dub_rec
where rowid not in(
SELECT min(rowid) FROM dub_rec
group by ids,name);    ---if we want to fetch repeated records from both clmns
--group by ids,name);    ---if we want to fetch repeated records based ids clmn

delete from dub_rec
where rowid not in(
SELECT min(rowid) FROM dub_rec
group by ids);



--interview

AAAGbcAAEAAAB7EAAA	1	1	ram
AAAGbcAAEAAAB7EAAC	2	2	saj
AAAGbcAAEAAAB7EAAD	3	3	raj
AAAGbcAAEAAAB7EAAF	4	4	kavi
AAAGbcAAEAAAB7EAAG	5	5	pavi
AAAGbcAAEAAAB7EAAI	6	4	ravi
AAAGbcAAEAAAB7EAAJ	7	5	savi


SELECT rowid,rownum, dr.*  FROM dub_rec dr;






2)Diff b/w ROWID and ROWNUM?
rowid   -permanant id for each row
         -address of the row
rownum  - temparory sequence num for each row
           -the data is change the rownum changed.
           
           
           
select  next_day(sysdate,'satrday') saturdays from dual;
 

 select to_char((sysdate+level),'d') from dual
 connect by level<=100;

9)write a query to display saturdays and sundays  of next 100days.

 
 select sysdate+(level),to_char((sysdate+level),'day') from dual
 where to_char((sysdate+level),'d') in (1,7)
 connect by level <=100;
 
 
 
 select max(rownum) from departments;
 ,
        next_day(sysdate,'sunday')+(level-1) sundays from dual
connect by level<10;




select rownum rm,e.* from
       (select rowid from dub_rec
       order by 1 desc)e
WHERE ROWNUM<=5; 

--1...10


select rownum from dual
connect by level<=20;


