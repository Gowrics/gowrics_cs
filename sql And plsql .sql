--EXTRACT


SELECT EXTRACT( DAY FROM difference ) AS days,
       EXTRACT( HOUR FROM difference ) AS hours,
       EXTRACT( MINUTE FROM difference ) AS minutes,
       EXTRACT( SECOND FROM difference ) AS seconds
FROM (
     SELECT NUMTODSINTERVAL(
     TO_DATE( '2016-01-02 01:01:12', 'YYYY-MM-DD HH24:MI:SS' )
     - TO_DATE( '2016-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS' ),
     'DAY'
     ) AS difference
     FROM DUAL
);

SELECT NUMTODSINTERVAL(
TO_DATE( '2016-01-02 01:01:12', 'YYYY-MM-DD HH24:MI:SS' )
- TO_DATE( '2016-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS' ),
'DAY'
) AS difference
FROM DUAL;

SELECT NUMTODSINTERVAL(
TO_DATE( '2016-01-02 01:01:12', 'YYYY-MM-DD HH24:MI:SS' )
- TO_DATE( '2016-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS' ),
'SECOND'
) AS difference
FROM DUAL;

select NUMTODSINTERVAL(100,'HOUR') FROM DUAL;

select manager_id,first_name,hire_date,
count(*) over(partition by manager_id order by hire_date) as t_count
from employees
order by manager_id,hire_date;


select employee_id,salary,hire_date,EXTRACT(year from hire_date),
                                    EXTRACT(month from hire_date),
                                    EXTRACT(day from hire_date)
                                    --EXTRACT(hour from hire_date)
        --                            EXTRACT(year from hire_date)
from employees;


select employee_id,salary,hire_date
from employees
where EXTRACT(year from hire_date) = 2004;
