
select * FROM user_source;


SELECT *
FROM  user_catalog;
--currently using sys user
SELECT *
FROM  sys.user_catalog;

SELECT *
FROM  sys.user_catalog
WHERE table_type='TABLE'; 

SELECT *
FROM  sys.user_catalog
WHERE table_type='SEQUENCE';


SELECT *FROM  all_tables;

SELECT *
FROM  dba_tables;


SELECT *
FROM  dba_tables WHERE TABLE_NAME LIKE('%CONSTR%');

SELECT *
FROM  sys.employees;


SELECT *
FROM  dictionary;

SELECT *
FROM  USER_CONS_COLUMNS;

SELECT *
FROM DICT
WHERE TABLE_NAME LIKE '%CONS%';


SELECT * FROM all_tables;
SELECT NUM_ROWS FROM all_tables
where num_rows<=120;



COLUMN TABLE_NAME
COLUMN COMMENTS WORD WRAP
SET PAGESIZE 100



select * FROM user_ind_columns
where table_name ='EMPLOYEES';
