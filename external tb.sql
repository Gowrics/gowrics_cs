select first_name,employee_id,salary from employees;
--1st create a directory

CREATE OR REPLACE DIRECTORY external_tb AS 'D:\script';

select * from all_directories;
select directory_path  from all_directories WHERE directory_name='EXTERNAL_TB';

 CREATE TABLE ext_tb
(
country_code varchar2(5),
country_name varchar2(50),
country_language varchar2(50)
)
ORGANIZATION EXTERNAl
(
TYPE ORACLE_LOADER 
DEFAULT DIRECTORY external_tb
ACCESS PARAMETERS
(
   RECORDS DELIMITED BY NEWLINE
 FIELDS TERMINATED BY ',' 
 MISSING FIELD VALUES ARE NULL
  ( 
   country_code char(5),
   country_name char(50),
   country_language char(50)
  )
 )
LOCATION('datas.txt','datass.txt')
)
PARALLEL 5 ;




DROP TABLE ext_tb;
 
SELECT * FROM ext_tb
WHERE country_code='FRA';
TRUNCATE TABLE ext_tb;

````````````````````````````````````````````````````````````````````````````````````````````````````````
;


CREATE TABLE ext12_tb
(
emp_id NUMBER(5),
last_name varchar2(50),
job_id varchar2(50)
)
ORGANIZATION EXTERNAl
(
TYPE ORACLE_LOADER 
DEFAULT DIRECTORY external_tb
ACCESS PARAMETERS
(
   RECORDS DELIMITED BY NEWLINE
 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
 MISSING FIELD VALUES ARE NULL
  ( 
emp_id char(5),
last_name char(50),
job_id char(50)
  )
 )
LOCATION('emp1.txt')
)
PARALLEL 5 ;



DROP TABLE ext12_tb;
 
SELECT * FROM ext12_tb; 
TRUNCATE TABLE ext1_tb;
.......................................................................................................................


CREATE TABLE ext2_tb
(
emp_id NUMBER(5),
last_name varchar2(50),
job_id varchar2(50)
)
ORGANIZATION EXTERNAl
(
TYPE ORACLE_LOADER 
DEFAULT DIRECTORY external_tb
ACCESS PARAMETERS
(
   RECORDS DELIMITED BY NEWLINE
  FIELDS( 
emp_id POSITION (01:03)char(5),
last_name POSITION (04:14) char(50),
job_id POSITION (15:25) char(50)
  )
 )
LOCATION('emp1.txt')
)
PARALLEL 5 ;

DROP TABLE ext2_tb;
 
SELECT * FROM ext2_tb; 
TRUNCATE TABLE ext2_tb;

........................................................................................
--data pump method
-- its used to move the sql table to file in any directory
-- 1st we have any sql table 
  
  CREATE TABLE emp4 
  AS SELECT * FROM employees;

SELECT * FROM emp4;
  
CREATE TABLE pump_data
ORGANIZATION EXTERNAL
(
TYPE ORACLE_DATAPUMP
DEFAULT DIRECTORY exdatas
LOCATION('pumping.dmp')
)
AS SELECT * FROM emp4;

SELECT * FROM pump_data;



select employee_id,length(last_name),job_id from employees;


select max(length(job_id)) from employees;