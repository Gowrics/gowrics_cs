
-- DECODE AND

SELECT DECODE('Superman','Spiderman','same',              
                'Diff') FROM DUAL;

SELECT DECODE('Superman','Superman','same',              
                'Diff') FROM DUAL;

SELECT DECODE('Superman','Spiderman','same',
                           'Superman','Same1',                      
                'Diff') FROM DUAL;
      SELECT DECODE('dhanya', 'gowri' ,'good',
                        'pathi' , 'bad',
                       'dhanya','not bad',
                                'none') STATUS
FROM DUAL;
          
-- select datas and decode for emp id as emp name                 

SELECT employee_id,first_name, hire_date,department_id, DECODE(e.department_id,10,'adminstration',
                                                                               20,'marketting',
                                                                                30,'purchasing',
                                                                                40,'human resources',
                                                                                50,'shipping',
                                                                                'other department') D_NAME
FROM employees e 
WHERE department_id  IN(10,20,30,40,50)
ORDER BY department_id;

SELECT DEPARTMENT_NAME   FROM departments;

-- without where clause
SELECT employee_id,first_name, hire_date,department_id, DECODE(e.department_id,10,'adminstration',
                                                                               20,'marketting',
                                                                                30,'purchasing',
                                                                                40,'human resources',
                                                                                50,'shipping',
                                                                                'other department')
FROM employees e 
ORDER BY department_id;


--21-04-22 decode case

SELECT employee_id, first_name, hire_date, department_id,
                                                        CASE department_id
                                                        WHEN     10 THEN 'mngmt'
                                                        WHEN     20 THEN 'admin'
                                                        WHEN     30 THEN 'purch'
                                                        WHEN     40 THEN 'human rs'
                                                        WHEN     50 THEN 'shipping'
                                                        ELSE             'other departments'                                                       
                                                        END                                                        
                                                        FROM employees 
                                                       ORDER by department_id;

SELECT employee_id, first_name,department_id,salary,
                                                        CASE 
                                                        WHEN   salary<=5000 THEN 'poor'
                                                        WHEN   salary<=10000  THEN 'average'
                                                        WHEN   salary<=20000 THEN 'good'
                                                        WHEN   salary>=20000 THEN 'super'
                                                        ELSE             'excellant'                                                       
                                                        END       salary_grade                                                 
                                                        FROM employees 
                                                       ORDER by department_id;
                    
                
-----------------------------------------------------------------------------------------

CREATE TABLE train_detail(train_name CHAR(15) PRIMARY KEY);
                         
drop table  train_detail;
insert into train_detail values('KAVERI EXPRESS');
insert into train_detail values('TAMILNADU EXP');
insert into train_detail values('VAIGAI EXP');
insert into train_detail values('PEARL EXP');
/
select * from train_detail;

declare 
cursor trainname is
select train_name from train_detail
for update of train_name ;


begin
for i in trainnames
loop
update  train_detail
set  train_name = case 
                                    when train_name='KAVERI EXPRESS' then 
                                         'Kav Exp'
                                    when train_name= 'TAMILNADU EXP' then
                                         'TN Exp'
                                    when train_name= 'VAIGAI EXP' then
                                         'VG Exp'
                                    when train_name='PEARL EXP' then
                                         'PRL Exp'
                                    else       
                                      'others'
                                    end case 
 where current of trainnames;
 end loop;
end;
/-----------------------------------------------------------------------------------------------------------------------
                
                
                
                
                
/* diff decode and case

DECODE   |function           | exact match           |oracle std | sql
CASE     |expression AND OR  | we can use  operator  |ANCI       | sql & plsql

sql   | CASE
        END
PLSQL | BEGIN
        (
        CASE
        END CASE            =---- important
        )
        END

*/
/* implementation of decode

    memory consumption  
    --------------------
  ex: male --- 4 bits
      male --- 4
      male --- 4
      male --- 4
DECODE M ---- 1 bits
ex prg
------
  SELECT ref_id, cust_id, DECODE (status, 'pfa', 'pending for approval',
                                           'a', 'approval',
                                           'r', 'rejecting')
                                           FROM mgmt_id;


   to break usal order
   -------------------
   ASC  DESC order
   
   
*/

CREATE TABLE student_tb (NAME VARCHAR2(20) ,COURSE VARCHAR2(20))
BEGIN
INSERT INTO student_tb VALUES('aburaj' , 'maths');
INSERT INTO student_tb VALUES('balan' , 'computer');
INSERT INTO student_tb VALUES('chandran' , 'tamil');
INSERT INTO student_tb VALUES('durairaj' , 'english');
INSERT INTO student_tb VALUES('ethiraj' , 'science');
INSERT INTO student_tb VALUES('faruck' , 'gk');
COMMIT;

END;
/
SELECT * FROM student_tb ORDER BY course ASC;

-- break usal order ex:
SELECT * FROM student_tb ORDER BY DECODE(COURSE,
                           'tamil', 1,
                           'english',2,
                           'maths',3,
                           'science',4,
                           'gk',5,
                           'computer',6);
--ex prog 2


SELECT NAME
, COURSE, DECODE(COURSE,
                           'tamil', 1,
                           'english',2,
                           'maths',3,
                           'science',4,
                           'gk',5,
                           'computer',6)"code" FROM student_tb;

select * from employees;
select * from departments;


