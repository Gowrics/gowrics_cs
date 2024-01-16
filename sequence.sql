CREATE  SEQUENCE seq_1
START WITH 1
INCREMENT BY 1
MAXVALUE 10
MINVALUE 1
NOCYCLE;

CREATE TABLE STUD
(
stu_no NUMBER,
stu_name VARCHAR2(20)
);

INSERT INTO STUD VALUES(seq_1.NEXTVAl,'&stud_name');
INSERT INTO STUD VALUES(seq_1.NEXTVAl,'&stud_name');

INSERT INTO STUD VALUES(seq_1.NEXTVAl,'&stud_name');

INSERT INTO STUD VALUES(seq_1.NEXTVAl,'&stud_name');
INSERT INTO STUD VALUES(seq_1.NEXTVAl,'&stud_name');
SELECT * FROM STUD;

INSERT INTO STUD VALUES(seq_1.NEXTVAl,'&stud_name');
INSERT INTO STUD VALUES(seq_1.NEXTVAl,'&stud_name');
INSERT INTO STUD VALUES(seq_1.NEXTVAl,'&stud_name');
INSERT INTO STUD VALUES(seq_1.NEXTVAl,'&stud_name');
INSERT INTO STUD VALUES(seq_1.NEXTVAl,'&stud_name');
INSERT INTO STUD VALUES(seq_1.NEXTVAl,'&stud_name');
INSERT INTO STUD VALUES(seq_1.NEXTVAl,'&stud_name');
INSERT INTO STUD VALUES(seq_1.NEXTVAl,'&stud_name');
INSERT INTO STUD VALUES(seq_1.NEXTVAl,'&stud_name');


SELECT * FROM user_sequences;
DROP SEQUENCE seq_1;
--cycle seq

CREATE SEQUENCE seq_1
START WITH 1
INCREMENT BY 1
MAXVALUE 10
MINVALUE 1
CYCLE
CACHE 9;

--nw drop table
DROP TABLE STUD;


CREATE TABLE STUD
(
stu_no NUMBER,
stu_name VARCHAR2(20)
);

INSERT INTO STUD VALUES(seq_1.NEXTVAl,'&stud_name');
SELECT * FROM STUD;


DROP SEQUENCE seq_1;

CREATE SEQUENCE seq_1
START WITH 100
INCREMENT BY 10
MAXVALUE 1000
MINVALUE 1
CYCLE
CACHE 100;

TRUNCATE TABLE STUD;

INSERT INTO STUD VALUES(se                                                                                                                            q_1.NEXTVAl,'&stud_name');
SELECT * FROM STUD;
select seq_1.NEXTVAl FROM dual;
select seq_1.CURRVAl FROM dual;

--ctreate default seq
DROP SEQUENCE seq_1;
CREATE SEQUENCE seq_1;


TRUNCATE TABLE STUD;

INSERT INTO STUD VALUES(seq_1.NEXTVAl,'&stud_name');

SELECT * FROM STUD;
SELECT * FROM user_tables;
SELECT * FROM ELECTRICALS;
DESC ELECTRICALS;
ALTER TABLE ELECTRICALS RENAME COLUMN date_inf TO sales_no;
ALTER TABLE ELECTRICALS MODIFY sales_no NUMBER(20);

--now insert into the values

UPDATE ELECTRICALS 
SET sales_no = seq_1.NEXTVAL;

SELECT * FROM ELECTRICALS;

INSERT INTO ELECTRICALS VALUES('tape',1,10,'junction nbox', 50,seq_1.NEXTVAl);
ALTER TABLE ELECTRICALS DROP COLUMN total;

exit
--practice time


SELECT * FROM user_sequences;
CREATE  SEQUENCE dept_id_seq
START WITH 200
INCREMENT BY 10
MAXVALUE 1000
NOCYCLE;
SELECT sequence_name,max_value,increment_by,last_number FROM user_sequences;

CREATE TABLE dept 
AS
SELECT * FROM departments;
DROP table dept;
select * FROM dept;



CREATE TABLE loads(id NUMBER(20),prdnm VARCHAR2(30));

select level "id",'prd_'||level "prdnm" FROM dual
connect by level <=100;



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

