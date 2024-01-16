load data
infile 'D:\GOWRI CS\1program languages\1_SQL QUERIES\sqlcsvdsv1.csv'
infile 'D:\GOWRI CS\1program languages\1_SQL QUERIES\sqlcsvdsv2.csv'
badfile 'D:\GOWRI CS\1program languages\1_SQL QUERIES\sqlcsvdsv.bad'
discardfile 'D:\GOWRI CS\1program languages\1_SQL QUERIES\sqlcsvdsv.dsc'
TRUNCATE INTO TABLE emp_sql
fields terminated by "," optionally enclosed by '"'
(first_name,employee_id,department_id,salary,hire_date)
