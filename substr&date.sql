SELECT first_name, SUBSTR(first_name, 2, 3) "sub1" 
                   , SUBSTR(first_name, 1,1 ) "sub2"
                   , SUBSTR(first_name, 3  ) ", sub3"
                   ,SUBSTR(first_name, -4,3) "sub4" FROM employees;
SELECT first_name , INSTR(LOWER (first_name),'a') "INSTR"
                  , INSTR(LOWER (first_name),'a', 1,2)"INSTR2" 
                  , INSTR(LOWER (first_name),'a', 1,3)"INSTR3"FROM employees;

SELECT first_name , UPPER(first_name) "upper case",
                    LOWER(first_name) "lower case",
                    INITCAP(first_name) "init case" FROM employees;
SELECT first_name ,LENGTH(first_name) FROM employees
WHERE LENGTH(first_name)=3;
 SELECT first_name ,last_name,INITCAP( CONCAT(first_name,last_name)) "concat" FROM employees;
 
 SELECT first_name FROM employees
 WHERE LOWER(first_name)=LOWER('STEVEN'); 
 SELECT last_name, LOWER(REVERSE(last_name)),
 first_name ,SUBSTR(first_name,-4,5)"substr" ,
 SUBSTR(first_name,  2 ),
 INSTR (UPPER(first_name) , UPPER('e'), 1,3)"nested fun" FROM employees;
SELECT first_name , INSTR(LOWER(first_name), LOWER('a'))FROM employees;
 
 SELECT first_name, salary, RPAD(salary, 8,'\') "Lpading",
 LPAD(first_name, 10, '\')
 FROM employees;
  SELECT RPAD(department_id ,4,' ') || RPAD(first_name,10,' ')  || LPAD(salary,6, ' ')  " information "
  FROM employees
  WHERE department_id IN (10, 30,40);
   
   
   SELECT '00009387446433444440000'  "dummy",
    RTRIM('00009387446433444440000',0) "Rtrim" , 
    LTRIM(RTRIM('00009387446433444440000',0), 0) "trim",
    TRIM ( 0 FROM '00009387446433444440000') "Trim"
    FROM DUAL;
    
    SELECT 'gowripathi',
    LENGTH('gowripathi')       "name",
    LENGTH(TRIM('gowripathi'))
    FROM DUAL;
   SELECT first_name, REPLACE(first_name, 'da','\*')"Replace",
   TRANSLATE(first_name, 'da','\*') "Replace"
   FROM employees;
   SELECT first_name, TRANSLATE(first_name, 'Steven','RAMESH'),department_id FROM employees;
   
   
      /* find 1st part and 2nd part of email_id using SUBSTR,INSTR */
    
    SELECT 'gowrics@gmail.com' "mail id",
    INSTR('gowrics@gmail.com','@') " @ Position",
    SUBSTR('gowrics@gmail.com',1,((INSTR('gowrics@gmail.com','@'))-1)) "1st",
    SUBSTR('gowrics@gmail.com',((INSTR('gowrics@gmail.com','@'))+1) ) "2nd"
    FROM DUAL;
SELECT TRIM(0 FROM (TRANSLATE ( '****go*wr*ip****at**hi**', '*', '0')))
FROM DUAl;
 

    
    SELECT ROUND('133.317','2')  "RND1" ,
           ROUND('133.397','1')  "RND2" ,
           ROUND('133.317','-1') "RND3" ,
           ROUND('139.317','-2') "RND4" ,
        
           ROUND('133.317','1') "RND5"
    FROM DUAL;    
    
    SELECT TRUNC('133.317','2')  "RND1" ,
           TRUNC('133.397','1')  "RND2" ,
           TRUNC('133.317','-1') "RND3" ,
           TRUNC('139.317','-2') "RND4"  
       FROM DUAL;    
       
    SELECT POWER(5,5) FROM DUAL;
    SELECT POWER(1,5) FROM DUAL;
        SELECT MOD(5,5) FROM DUAL;
    SELECT MOD(17,5) FROM DUAL;
    SELECT * FROM employees
    WHERE MOD(employee_id , 2)= 0;
      SELECT CEIL('244.04') "CEIL" FROM DUAL;
      SELECT FLOOR('244.94') "CEIL" FROM DUAL;
            SELECT SIGN('-4.04') "CEIL" FROM DUAL;
            
            
            SELECT SYSDATE -65  FROM dual;
              SELECT 
              ROUND (20+ TO_DATE ('03-jan-22')) ||'   ' || 'DAYS' "DIFF" FROM dual;


/* months between*/
SELECT ROUND(MONTHS_BETWEEN(SYSDATE,'08-09-20')/12) "YEARS" FROM dual;


SELECT ROUND (MONTHS_BETWEEN(SYSDATE,'25-07-89')/12 ,2) || '  ' || 'YEARS' "gowri age",
    ROUND(MONTHS_BETWEEN(SYSDATE,'19-08-84')/12)|| '  ' || 'YEARS' "Monish age"
FROM dual;
   /* find experiance of employees */
   SELECT *FROM employees;
SELECT employee_id, first_name,hire_date ,salary , ROUND(MONTHS_BETWEEN(SYSDATE,hire_date)/12)|| '  ' || 'YEARS' "experiance"
  FROM employees
  WHERE ROUND(MONTHS_BETWEEN(SYSDATE,hire_date)/12)>=15 ;
  SELECT NEXT_DAY(SYSDATE,'friday') " next date" FROM dual;
  SELECT NEXT_DAY(SYSDATE +7,'friday') " next date" FROM dual;
 
  SELECT LAST_DAY(SYSDATE) " next date" FROM dual;
  SELECT LAST_DAY('01-jun-22') " next date" FROM dual;

SELECT 1700+220+110+770 FROM DUAL;

