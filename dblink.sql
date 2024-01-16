
select * from test_gtt;

CREATE USER gowri IDENTIFIED BY gowri;

GRANT CONNECT,RESOURCE TO gowri;

GRANT SELECT ON sys.all_tables TO gowri;

--> file->connectine--> name:gowri user:gowri password:gowri --> save--> connect
GRANT CREATE DATABASE LINK TO gowri;

create table xyz in gowri db 

INSERT INTO xyz VALUES(1,'kasu');
INSERT INTO xyz VALUES(2,'casu');
INSERT INTO xyz VALUES(3,'tasu');
INSERT INTO xyz VALUES(4,'masu');
INSERT INTO xyz VALUES(5,'lasu');
select * from xyz;
select * from all_db_links;;

CREATE DATABASE LINK hr_remote
CONNECT TO gowri IDENTIFIED BY gowri
USING '(DESCRIPTION=(ADDRESS =(PROTOCOL =TCP)(HOST =localhost)(PORT=1521))
(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=pdborcl)))';

DROP DATABASE LINK hr_remote;

select * FROM xyz@hr_remote;

select * FROM v$parameter 
WHERE name LIKE '%service_name%';



