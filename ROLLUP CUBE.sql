
--ROLLUP and CUBE

CUBE generates a result set that shows aggregates for all combinations of values in the selected columns,
where as ROLLUP generates a result set that shows aggregates for a hierarchy of values in the selected columns.

You wont see any difference when you use ROLLUP and CUBE on a single column. 



CREATE TABLE add1_tb
(
ID NUMBER,
NAME VARCHAR2(30),
LOCATION VARCHAR2(30),
JOB VARCHAR2(30),
SALARY NUMBER
);


INSERT INTO add1_tb VALUES (1,'AAA','Chennai','Eng',9000);
INSERT INTO add1_tb VALUES (2,'ABC','Tuti','Mech',9000);
INSERT INTO add1_tb VALUES (3,'ABC','Erode','Elect',9000);
INSERT INTO add1_tb VALUES (4,'AAA','Chennai','Eng',9000);

SELECT * FROM add1_tb;



SELECT name
    , location
    , job
    , sum(salary)
 FROM add1_tb
GROUP BY ROLLUP(name, location, job);


SELECT name
    , location
    , job
    , sum(salary)
 FROM add1_tb
GROUP BY CUBE(name, location, job);


--ROLLUP 
name, location, job
name, location
name

--CUBE 
name, location, job
name, location
name, job
name
location, job
location
job




--GREATEST and LEAST 

The list functions, GREATEST and LEAST enable  you to extract values from a group of coulmns.

Contrast this with aggregate functions that work on gruop of rows.




SELECT GREATEST(1,10,20), LEAST(1,10,20) FROM dual;

SELECT GREATEST(-2,-1,0), LEAST(1,-1,0) FROM dual;

SELECT GREATEST('A','B','C'), LEAST('A','B','C') FROM dual;

SELECT GREATEST('1','B','C'), LEAST('1','B','C') FROM dual;    | NUMBER and chaeacter cant use, if you want to use, must write in literal.

SELECT GREATEST('1','B','C'), LEAST('1','B','C') FROM dual;   | CHARCTER > NUMBER 

SELECT GREATEST('%','B','1'), LEAST('%','1','C') FROM dual;    | CHARACTER > NUMBER > SPECIAL CHARACTER

SELECT GREATEST('AA','ABB','ABC'), LEAST('AA','ABB','ABC') FROM dual;

SELECT GREATEST(salary), LEAST(salary) FROM employees; 


DATE - Recent date considered as Greatest , old date considered as LEAST
NULL - if null values is there, it  bring NULL both GREATEST and LEAST



--WITH CLAUSE

The SQL WITH clause allows you to give a sub_query block a name, which can be referenced in several places within the main SQL query.

WITH WITH_CLAUSE_NAME
AS
(
sub query
)



WITH EmployeeCount
AS
(
SELECT department_id, count(*) as total
FROM employees e
GROUP BY department_id
)
SELECT department_name, total
FROM departments JOIN EmployeeCount
ON departments.department_id=EmployeeCount.department_id;


We can able to write the more than one WITH clause, by separating comma.

-----------------------------------------------------------------------------------------------------------------------------------------------------

ROLLUP:
***********
 ROLLUP enables a SELECT statement to calculate multiple levels of subtotals across a specified group of dimensions.
 It also calculates a grand total.
 ROLLUP is a simple extension to the GROUP BY clause, so its syntax is extremely easy to use.
 
 SELECT
   col1,
   col2,
   aggregate(col3)
FROM
   table_name
GROUP BY
   ROLLUP (col1, col2);
   
   select employee_id,last_name ,sum(salary) from emp_tb

               group by cube(employee_id,last_name);
			   
			   
			   EMPLOYEE_ID	NAME	SUM(SALARY)
                    1001	rithvik	5000
                    1001	   -	5000
                    1002	SAI1	3000
                    1002	-	    3000
                    1003	cherry	3000
                    1003	-	    3000
                    1004	cherry	3000
                    1004	-	    3000
                     -	     -	    14000
------------------------------------------------------------------------------------------------------------------------------------

WORK
***********

The keyword WORK is optional and is provided for SQL standard compatibility.

-------------------------------------------------------------------------------------------------------------------------------------- 
 GREATEST AND LEAST:
*********************
 
The Oracle GREATEST function returns the “greatest” or largest value in a set of values that you provide to it.
The Oracle LEAST function returns the “least” or smallest value in a set of values that you provide to it.

select GREATEST(10,20,30,40,50) gt,LEAST('sai','hsfc','cherry','icici')  lt from dual;

                 GT	   LT
                 50	   cherry
				 
------------------------------------------------------------------------------------------------------------------------------------
FLASHBACK
**********

USING ORACLE FLASHBACK QUERY, YOU CAN RETRIEVE THE COMMITTED DATA AS IT WAS AT A PAST POINT IN TIME.

IF WE DROP THE TABLE IT WILL DELETE FROM THE DATABASE [IT WILL AUOTMAITCALLY PRESENT IN RECYCLEBIN]
 BUT BY USING FLASHBACK WE CAN RESTORE THE TABLE

Flashback Table uses information in the undo tablespace to restore the table. 

Therefore, UNDO_RETENTION parameter is significant in Flashing Back Tables to a past state. 
You can only flash back tables up to the retention time you specified.

WECANNOT FLASHBACK THE TABLE WHEN WE PURGE THE SAME TABLE

WE CANNOT FLASHBACK THE MATERLIASED VIEW


The FOLLOWING examples performs a FLASHBACK TABLE operation the table emp


  ---> [1] THE BELOW IS USED TO RESTORE TABLE BY USING TIMESTAMP  FASTLY

/     
	      SELECT * FROM user_recyclebin ; WHERE ORIGINAL_NAME='EMP_TB';
                                         [THEN WE CAN GET AT WHAT WE DROP THE TABLE]
          
		  FLASHBACK TABLE emp TO TIMESTAMP
              TO_TIMESTAMP('2020-10-29:17:28:31', `YYYY-MM-DD HH24:MI:SS);
   
  --> [2] THE BELOW IS USED TO RESTORE TABLE AFTER DROP THE TABLE AND RENAME WITH THAT TABLE WITH OTHER NAME

          Flashback TABLE STUDS_TB TO BEFORE DROP RENAME TO STUDS_TB1; 
  
  -->-[3] THE BELOW IS USED TO RESTORE TABLE AFTER DROP THE TABLE
  
            Flashback TABLE SQLLDR_FILE To BEFORE DROP;
  
  select * FROM STUDS_TB1;
  
  

---------------------------------------------------------------------------------------------------------------------------------
PURGE
************

IF YOU WANT TO RECOVER THE SPACE USED BY A DROPPED TABLE GIVE THE FOLLOWING COMMAND

                   PURGE TABLE EMP;
                   PURGE TABLE DEPT ;

IF YOU WANT  TO PURGE OBJECTS OF  LOGON USER  GIVE THE FOLLOWING COMMAND

                   PURGE RECYCLE BIN;

IF YOU WANT TO RECOVER SPACE FOR DROPPED OBJECTS OF A PARTICULAR TABLESPACE GIVE THE COMMAND

                   PURGE TABLESPACE HR;	

----------------------------------------------------------------------------------------------------------------------
TABLESPACE 
*************

Use the CREATE TABLESPACE statement to create a tablespace, which is an allocation of space in the database that can contain schema objects.

A permanent tablespace contains persistent schema objects. Objects in permanent tablespaces are stored in datafiles.

An undo tablespace is a type of permanent tablespace used by Oracle Database 
to manage undo data if you are running your database in automatic undo management mode.
 Oracle strongly recommends that you use automatic undo management mode rather than using rollback segments for undo.

A temporary tablespace contains schema objects only for the duration of a session. Objects in temporary tablespaces are stored in tempfiles.


------------------------------------------------------------------------------------------------------------------------



----------------------------------------------------------------------------------------------------------------
  GREATEST & LEAST
  DEADLOCKS
  CUBE & ROLLUP
  WITH CLAUSE
11g | 12c | 18c New Feature
	LISTAGG  ( 11g |19c )
	VARCHAR2 Size  				11g
	Sequence       				11g  Variable | 12c DEFAULT
	CONTINUE       				11g
	FOLLOWS in Trigger          11g
	REGEXEP_COUNT  				11g
  Julian Conversion TO_CHAR(TO_DATE(salary,'j'),'jsp')
PIVOT
Multi Table Insert (INSERT ALL)
Oracle Data Pump(impdb & EXPDB)
  OLTP & OLAP
  FLASHBACK | PURGE
CONNECT BY PRIOR | LEVEL
  dblink
  reg_expression
  decode multiple column
  

