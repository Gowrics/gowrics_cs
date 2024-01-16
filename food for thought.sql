create table CRIMINALS
(
CRIMINAL_NAME varchar2(400),
CRIMINAL_ID varchar2(100),
KNOWN_ALIASES varchar2(1000),
PRISON_TIME_START date,
PRISON_TIME_END date,
MISCELLANEOUS_INFO varchar2(4000),
BIRTH_DATE date,
DEATH_DATE date
);
SELECT * FROM CRIMINALS;
DROP TABLE CRIMES_AND_CRIMINALS;


create table CRIMES
(
CRIME_ID varchar2(100),
CRIME_TYPE varchar2(1000),
LOCALITY_OF_CRIME varchar2(1000),
MOTIVE_OF_CRIME varchar2(100),
CRIME_DATE_AND_TIME date,
NUMBER_OF_CASUALTIES number,
NUMBER_OF_INJURIES number,
MISCELLANEOUS_INFO varchar2(4000)
);


create table CRIMES_AND_CRIMINALS
(
CRIME_ID varchar2(100),
CRIMINAL_ID varchar2(100),
CRIMINAL_ROLE varchar2(100)
);


alter table crimes_and_criminals add last_update_date date;
alter table crimes_and_criminals drop column last_update_date;



insert into CRIMINALS values ('Mawood Kubra', 'C1', null, '05-FEB-2001','05-FEB-2020','Bombs,
Guns', '26-DEC-1955',null);
insert into CRIMINALS values ('Rasma Maden', 'C2', 'Mr. Bean', null,null,'guns, planes, bomb',
null,'02-MAY-2011');
insert into CRIMINALS values ('Jack Ripper', 'C3', null, '05-FEB-2015',null,null, '22-AUG-1979',null);
insert into CRIMINALS values ('Ravi Rajan', 'C4', 'Chotu, Sharp', '19-SEP-2011','19-
SEP-2015','Knives, locks', '15-SEP-1989',null);
commit;

insert into CRIMES (CRIME_ID, CRIME_TYPE, LOCALITY_OF_CRIME, MOTIVE_OF_CRIME, CRIME_DATE_AND_TIME, NUMBER_OF_INJURIES,
MISCELLANEOUS_INFO)
values ('CR1', 'Theft', 'KIAZ', 'Personal','19-JUN-2010',4, 'Loss=10000Rs');
insert into CRIMES (CRIME_ID, CRIME_TYPE, LOCALITY_OF_CRIME, MOTIVE_OF_CRIME, CRIME_DATE_AND_TIME, NUMBER_OF_INJURIES,
MISCELLANEOUS_INFO,NUMBER_OF_CASUALTIES)
values ('CR2', 'Murder', 'NYK', 'Terrorism','11-SEP-2011',42, null,23);
insert into CRIMES (CRIME_ID, CRIME_TYPE, LOCALITY_OF_CRIME, MOTIVE_OF_CRIME, CRIME_DATE_AND_TIME, NUMBER_OF_INJURIES)
values ('CR3', 'Assault', 'KBC', 'Personal','20-APR-2008',1);
insert into CRIMES (CRIME_ID, CRIME_TYPE, LOCALITY_OF_CRIME, MOTIVE_OF_CRIME, CRIME_DATE_AND_TIME, NUMBER_OF_INJURIES)
values ('CR4', 'Theft', 'KIAZ', 'Personal','31-AUG-2015',4);
commit;


insert into CRIMES_AND_CRIMINALS (CRIME_ID, CRIMINAL_ID, CRIMINAL_ROLE) values
('CR1', 'C4', 'Execution');
insert into CRIMES_AND_CRIMINALS (CRIME_ID, CRIMINAL_ID, CRIMINAL_ROLE) values
('CR2', 'C2', 'Mastermind');
insert into CRIMES_AND_CRIMINALS (CRIME_ID, CRIMINAL_ID, CRIMINAL_ROLE) values
('CR2', 'C1', 'Execution');
insert into CRIMES_AND_CRIMINALS (CRIME_ID, CRIMINAL_ID, CRIMINAL_ROLE) values
('CR3', 'C3', 'Mastermind, Execution');
commit;

SELECT * FROM CRIMES;
SELECT * FROM CRIMINALS;
SELECT * FROM CRIMES_AND_CRIMINALS;

SELECT * FROM CRIMES
ORDER BY NUMBER_OF_CASUALTIES DESC,NUMBER_OF_INJURIES DESC,CRIME_DATE_AND_TIME ASC;    

SELECT * FROM CRIMES
ORDER BY NUMBER_OF_CASUALTIES DESC;    



select 'UNKNOWN' as GENDER,CRIMINAL_NAME from CRIMINALS;
/
select 'ABCD', 1, CRIMINAL_NAME from CRIMINALS;


select distinct MOTIVE_OF_CRIME,locality_of_crime from CRIMES;

select distinct 'ABCD', 1 from CRIMES;


SELECT * FROM CRIMES
WHERE crime_type IN('Assault','Murder');


SELECT * FROM CRIMES
WHERE crime_type ='Assault'
OR crime_type ='Murder';



SELECT * FROM CRIMES
WHERE crime_type ='djhff'
AND locality_of_crime ='KIAZ';



SELECT * FROM CRIMES
WHERE 1=1 
AND 2=2;


SELECT * FROM CRIMINALS
WHERE LOWER(miscellaneous_info) LIKE('%bomb%');

SELECT * FROM CRIMINALS
WHERE LOWER(miscellaneous_info) NOT LIKE('%bomb%')
OR miscellaneous_info IS NULL;

SELECT * FROM CRIMES
WHERE locality_of_crime <> 'NYK';


SELECT * FROM CRIMES
WHERE crime_date_and_time <='01-jan-2015';



SELECT * FROM CRIMES
WHERE crime_date_and_time <= '11-sep-2011';


SELECT * FROM CRIMES
WHERE TO_CHAR(crime_date_and_time,'YYYY') =2010;


--same

SELECT * FROM CRIMES
WHERE crime_date_and_time BETWEEN '01-01-2010' AND '30-12-2010';



SELECT criminal_name||'  with a criminal id  '
                    ||criminal_id ||', born on '
                    ||birth_date||' is an expert in '
                    ||miscellaneous_info FROM CRIMINALS;





SELECT * FROM CRIMES
WHERE number_of_injuries*2=8;

SELECT * FROM CRIMES;
WHERE miscellaneous_info IS NOT NULL;



UPDATE CRIMES SET miscellaneous_info ='40600Rs'
WHERE crime_id='CR4';
commit;


SELECT * FROM CRIMES_AND_CRIMINALS;
DELETE FROM CRIMES_AND_CRIMINALS;
rollback;

TRUNCATE TABLE CRIMES_AND_CRIMINALS;


SELECT * FROM CRIMES;
DELETE FROM CRIMES 
WHERE crime_id='CR1';



SELECT * FROM CRIMES;
SELECT * FROM CRIMINALS;
SELECT * FROM CRIMES_AND_CRIMINALS;

SELECT criminal_name,prison_time_start,prison_time_end,
        TO_CHAR(prison_time_end,'mm')-TO_CHAR(prison_time_start,'mm') "days_in _orison" 

FROM criminals;

select CRIMINAL_NAME, sysdate, PRISON_TIME_START,
sysdate-PRISON_TIME_START
from CRIMINALS;



SELECT criminal_name,prison_time_start,prison_time_end,
        MONTHS_BETWEEN(prison_time_end,prison_time_start) "days_in _orison" 
FROM CRIMINALS;



select CRIME_ID, ROWNUM
from CRIMES where CRIME_ID in ('CR1','CR2');


SELECT * FROM CRIMES;
WHERE ROWNUM*2=2;
``````````````````````````````
SELECT crime_id,
          (
             SUBSTR(
                miscellaneous_info,
                INSTR(miscellaneous_info,'=')+1,
                INSTR(miscellaneous_info,'Rs')-1)
          )*110/100 lose
FROM crimes;
``````````````````````````````````````````


SELECT SUM(lose)
FROM
(
SELECT crime_id,
       SUBSTR(
           miscellaneous_info,
           1,
           INSTR(miscellaneous_info,'Rs')-1) lose
FROM crimes
);







INSERT INTO owners VALUES(10,'o10');

INSERT INTO hotels VALUES(7,'h7');
SELECT * FROM hotels;
SELECT * FROM owners;
DROP TABLE owners;

CREATE TABLE hotels(id_val NUMBER,hotel_name VARCHAR2(20));
CREATE TABLE owners(id_val NUMBER,owner_name VARCHAR2(20));


DROP TABLE hotels;
DROP TABLE owners;

--LOH

SELECT h.hotel_name,o.owner_name FROM hotels h,owners o
WHERE h.id_val=o.id_val(+)
ORDER BY 1;

--ROF

SELECT h.hotel_name,o.owner_name FROM hotels h,owners o
WHERE h.id_val(+)=o.id_val
ORDER BY 1;
commit;

--foj


SELECT h.hotel_name,o.owner_name FROM hotels h FULL OUTER JOIN owners o
ON h.id_val = o.id_val
ORDER BY 1;

--INNER JOIN

SELECT h.hotel_name,o.owner_name FROM hotels h INNER JOIN owners o
ON h.id_val = o.id_val
ORDER BY 1;




DECLARE 
lines dbms_output.chararr;
num_lines NUMBER;
BEGIN
dbms_output.enable;
dbms_output.put_line('hello..');
dbms_output.put_line('hope you are doing well..');
num_lines:=4;
dbms_output.get_lines(lines,num_lines);

FOR i IN 1..num_lines LOOP
  dbms_output.put_line(lines(i));
END LOOP;
END;
/
set serveroutput on;