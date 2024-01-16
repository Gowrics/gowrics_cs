
select first_name,employee_id,department_id,salary,hire_date from employees
where department_id in( 10,20,30,40); ------------creating sorce file
-- csv file | source file D:\GOWRI CS\1program languages\1_SQL QUERIES\sqlcsvdsv.csv
desc employees;
-- db table creation
create table emp_sql( first_name varchar2(20),employee_id number primary key,department_id number,salary number,hire_date varchar2(10)); 
drop table emp_sql;
select * from emp_sql;


--control file
load data
infile 'D:\GOWRI CS\1program languages\1_SQL QUERIES\sqlcsvdsv.csv'
INTO TABLE emp_sql
fields terminated by "," optionally enclosed by '"'
(first_name,employee_id,department_id,salary,to_date(hire_date)
--save as notepad in file_name.ctl

-- command prompt
sqlldr hr@XE/open control = 'D:\GOWRI CS\1program languages\1_SQL QUERIES\emp_sqlldr.ctl';
--execute but not insert because date colum is date to change varchar2

--append

select first_name,employee_id,department_id,salary,hire_date from employees
where department_id not in( 10,20,30,40,90,100); ------------creating sorce file --1

select first_name,employee_id,department_id,salary,hire_date from employees
where department_id in( 90,100); ------------creating sorce file --2


load data
infile 'D:\GOWRI CS\1program languages\1_SQL QUERIES\sqlcsvdsv.csv'
badfile 'D:\GOWRI CS\1program languages\1_SQL QUERIES\sqlcsvdsv.bad'
discardfile 'D:\GOWRI CS\1program languages\1_SQL QUERIES\sqlcsvdsv.dsc'
INTO TABLE emp_sql
append
fields terminated by "," optionally enclosed by '"'
(first_name,employee_id,department_id,salary,hire_date)

--now the db table is empy insert only 90 dept (no append keyword) 
-- to using filter and insert  multiple file
load data
infile 'D:\GOWRI CS\1program languages\1_SQL QUERIES\sqlcsvdsv1.csv'
infile 'D:\GOWRI CS\1program languages\1_SQL QUERIES\sqlcsvdsv2.csv'
badfile 'D:\GOWRI CS\1program languages\1_SQL QUERIES\sqlcsvdsv.bad'
discardfile 'D:\GOWRI CS\1program languages\1_SQL QUERIES\sqlcsvdsv.dsc'
INTO TABLE emp_sql
when department_id ="90"
fields terminated by "," optionally enclosed by '"'
(first_name,employee_id,department_id,salary,hire_date)


--now the db table is not empy insert only 90 dept along (3 ext file)( append keyword) 
-- to using filter and insert  multiple file

load data
infile 'D:\GOWRI CS\1program languages\1_SQL QUERIES\sqlcsvdsv1.csv'
infile 'D:\GOWRI CS\1program languages\1_SQL QUERIES\sqlcsvdsv2.csv'
badfile 'D:\GOWRI CS\1program languages\1_SQL QUERIES\sqlcsvdsv.bad'
discardfile 'D:\GOWRI CS\1program languages\1_SQL QUERIES\sqlcsvdsv.dsc'
INTO TABLE emp_sql
append
when department_id ="90"
fields terminated by "," optionally enclosed by '"'
(first_name,employee_id,department_id,salary,hire_date)

--now the db table is not empy insert(3 ext file)( not append keyword) 
--  insert  multiple file


load data
infile 'D:\GOWRI CS\1program languages\1_SQL QUERIES\sqlcsvdsv1.csv'
infile 'D:\GOWRI CS\1program languages\1_SQL QUERIES\sqlcsvdsv2.csv'
badfile 'D:\GOWRI CS\1program languages\1_SQL QUERIES\sqlcsvdsv.bad'
discardfile 'D:\GOWRI CS\1program languages\1_SQL QUERIES\sqlcsvdsv.dsc'
TRUNCATE INTO TABLE emp_sql
fields terminated by "," optionally enclosed by '"'
(first_name,employee_id,department_id,salary,hire_date)






--create empty a tab
CREATE TABLE sqlldr1_file (department_id NUMBER,department_name VARCHAR2(200)); 

DESC sqlldr1_file;
DROP TABLE sqlldr1_file;


--create source file 
select department_id,department_name FROM departments;
-- in op site click right click > export >format click csv file> browse select your location 
-- in op site click right click > export >format click delimiter and set left encloser -none> browse select your location 

--create  source file and save as loads.csv
--create control file in notepad

D:\GOWRI CS\sqldsv11.csv


load data
infile 'D:\GOWRI CS\sql\loads.csv'
into table sqlldr_file
fields terminated by "," optinally encolsed by '"'
(department_id, department_name)

--save as control file.ctl
--in cmd prompt
ELCOT >sqlldr hr@XE/open control='path of the control file '
--append  >> its used to add some more data in the existing table 

sqlldr hr@XE/open control='D:\GOWRI CS\1program languages\sqlldr\control_cons.ctl'


SELECT * FROM sqlldr2_file;



CREATE TABLE sqlldr2_file (department_id NUMBER,department_name VARCHAR2(20)); 

load data
infile 'D:\GOWRI CS\sql\loads.csv.txt'
into table sqlldr_file
APPEND
fields terminated by "," optinally encolsed by '"'
(department_id, department_name)
-- create primary key
ALTER TABLE sqlldr_file 
ADD CONSTRAINT did_pk PRIMARY KEY(department_id)

--how to loads fixed data file
10  Administration                                                               
20  Marketing                                                                    
30  Purchasing                                                                   
40  Human Resources                                                              
50  Shipping
 
 --in this fixed data get from spooling method in cmnd prmpt
 --adjest same position
 
-- control file for fixed data 
 load data
infile 'D:\GOWRI CS\sql\spool.txt'
into table sqlldr2_file
(department_id position (01:03),
 department_name position (05:20))


SELECT * FROM sqlldr2_file;
TRUNCATE TABLE sqlldr2_file;
 -- how to load fixed data 
 load data
infile *
into table sqlldr2_file
(
 department_id position (01:03) CHAR (4),
 department_name position (05:20) CHAR(20)
)

begindata

10  Administration                                                              
20  Marketing                                                                    
30  Purchasing                                                                   
40  Human Resources                                                              
50  Shipping                                                                     
60  IT                                                                           
70  Public Relations                                                             
80  Sales                                                                        
90  Executive                                                                    
100 Finance                                                                     

 
 
 
 
 
 --practice
 --1st
CREATE TABLE sqlldr_ex(department_id NUMBER,department_name VARCHAR2(30));
SELECT * FROM sqlldr_ex;
--2nd
SELECT department_id,department_name FROM departments;
--right click and export ->csv format and save the file as sourcefile.CSV
--3rd
--create control file in notpat and save controlfile.CTL
/*
load data
infile 'D:\GOWRI CS\sqlldr\sourcefile.csv'
into table sqlldr_ex
fields terminated by "," optionally enclosed by '"'
(department_id,department_name)
*/
--4th
--in cmd prompt
--C:\Users\ELCOT>sqlldr hr@XE/open control='D:\GOWRI CS\sql\control.ctl'

SELECT * FROM sqlldr_ex;

--next

DROP  TABLE sqlldr_ex;
--then

CREATE TABLE sqlldr_ex(department_id NUMBER,department_name VARCHAR2(200));


CREATE TABLE sqlldr_ex(department_id NUMBER,department_name VARCHAR2(200) CONSTRAINT pk_sql PRIMARY KEY);
SELECT * FROM sqlldr_ex;
-- create only 10 records from sourcefile  sourcefilecopy.CSV(10 records)
/*
load data
infile 'D:\GOWRI CS\sqlldr\sourcefilecopy.csv'
into table sqlldr_ex
fields terminated by "," optionally enclosed by '"'
(department_id,department_name)

*/
 --we can insert another records with existing table use append
 --WE CAN SAVE SEPARATE FOLDER
 load data
infile 'D:\GOWRI CS\sqlldr1\sourcefile.csv'
into table sqlldr_ex
APPEND
fields terminated by "," optionally enclosed by '"'
(department_id,department_name)
------
CREATE TABLE loads(id NUMBER(20),prdnm VARCHAR2(30));

INSERT INTO loads
(
select level "id",'prd_'||level "prdnm" FROM dual
connect by level <=100
);

select * FROM loads;

select level "id",''||level "prdnm" FROM dual
connect by level <=100;

--seq
CREATE SEQUENCE alp_num
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 50
CYCLE;

DROP SEQUENCE alp_num;

select level "id",substr('ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ',alp_num.NEXTVAL,2)||'_'||level "name" from dual
connect by level<=100;

DROP TABLE sqlldr2_file;
CREATE TABLE sqlldr2_file (id NUMBER, name VARCHAR2(20)); 
select * FROM sqlldr2_file;


sqlldr hr@XE/open control=C:\Users\ELCOT\controlfile.ctl log=mylog.log bad=myraj.bad skip=5



STATUS	UNITS	Subject	Group	Series_title_1
FINAL	Index	CPI	CPI Level 1 Groups for New Zealand	Food
FINAL	Index	CPI	CPI Level 1 Groups for New Zealand	Food
FINAL	Index	CPI	CPI Level 1 Groups for New Zealand	Food
FINAL	Index	CPI	CPI Level 1 Groups for New Zealand	Food
FINAL	Index	CPI	CPI Level 1 Groups for New Zealand	Food
;
/


create table consumer_price 
(
series varchar2(100),
status varchar2(100),
units varchar2(100),
subject varchar2(100),
groupy varchar2(1000),
series_title_1 varchar2(2000)
);
drop table consumer_price;

select * from consumer_price;

load data
 infile 'D:\GOWRI CS\consumers_price.csv'
 into table consumer_price
 fields terminated by "," optinally encolsed by '"'
 (status,units,subject,groupy,series_title_1)

sqlldr hr@XE/open control='D:\GOWRI CS\1program languages\sqlldr\control_cons.ctl'







select * from meterial;

desc meterial;


create table net_val
(
descp varchar2(500),
industry varchar2(500),
leve number(5),
siz varchar2(100),
line_code varchar2(100),
val number(9)
);



load data
 infile 'C:\Users\ELCOT\Desktop\SQLLDR\data2.csv'
 into table net_val
 fields terminated by "," optionally enclosed by ' " '
trailing nullcols
(descp,industry,leve,siz,line_code,val) 

sqlldr hr@XE/open control='C:\Users\ELCOT\Desktop\SQLLDR\control1.ctl'
/

select * from net_val
where descp='Faced challenges that limited increase use of ICT: don''t know';



select * from net_val
where industry='Agriculture';



create table pro_tb
(
series varchar2(100),
periods number(8,4),
data_val number(12,7),
status varchar2(100),
units varchar2(100),
sub varchar2(100),
grp varchar2(500),
sers varchar2(500)
);

drop table pro_tb;
select * from pro_tb;
select count(*) from pro_tb;




load data
 infile 'C:\Users\ELCOT\Desktop\SQLLDR\data3.csv'
 into table pro_tb
 fields terminated by "," optionally enclosed by ' " '
trailing nullcols
(series,periods,data_val,status,units,sub,grp,
sers) 



sqlldr hr@XE/open control='C:\Users\ELCOT\Desktop\SQLLDR\control2.ctl';

insert into pro_tb values('CPIQSE901',1920.12,0,'FINAL','Index','CPI','CPI Level 1 Groups for New Zealand','Food');



CPIQ.SE901,1921.03,23.05691869,FINAL,Index,CPI,CPI Level 1 Groups for New Zealand,Food
CPIQ.SE901,1921.06,0,FINAL,Index,CPI,CPI Level 1 Groups for New Zealand,Food;


select * from pro_tb p
where data_val =984.0425532;


select * from pro_tb
where rowid not in(
;

select max(rowid ) from pro_tb
group by series,periods,data_val,status,units,sub,grp,
sers;
) ;