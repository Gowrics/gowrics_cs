load data
infile 'D:\GOWRI CS\sql\sourcefile.csv'
into table sqlldr_file
fields terminated by ","
(department_id, department_name)
