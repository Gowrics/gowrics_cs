



--customer tb
DROP TABLE customer;
CREATE TABLE customer (
              cus_id NUMBER,
              ref_id VARCHAR2(30),
              cus_name VARCHAR2(30) constraint cns_unq unique
              );
SELECT * FROM customer;
--create seq for cus_id
DROP SEQUENCE cust_id_seq;
CREATE SEQUENCE cust_id_seq
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 500
NOCYCLE;
--create seq for ref_id
DROP SEQUENCE ref_id_seq;

CREATE SEQUENCE ref_id_seq
START WITH 2
INCREMENT BY 2
MINVALUE 2
MAXVALUE 1000
NOCYCLE;

BEGIN
--insert cus_name using level
INSERT INTO customer(cus_name)
select 'emp_name'||LEVEL FROM DUAL
CONNECT BY LEVEL <=500;
--insert cus_id using sequence
UPDATE customer
SET cus_id =cust_id_seq.NEXTVAL;

--insert ref_id using sequence with VARCHAR letters

UPDATE customer
SET ref_id ='abc'||'_'||ref_id_seq.NEXTVAL;

END;
/
SELECT * FROM customer  ORDER BY 1 ASC;

select chr(ascii('a')+level-1)||chr(ascii('a')+level) letter from dual
connect by level<=100;\
drop table letters;
CREATE TABLE letters(ltr VARCHAR2(20));

INSERT INTO letters
(
select chr(ascii('a')+level-1) from dual
connect by level<=26
WHERE level<=26;
);

select * FROM letters;
rollback;




select ROWNUM, chr(ascii('a')+level-1)|| chr(ascii('a')+level) from dual
connect by level<=26;
WHERE level<=26; 


CREATE OR REPLACE FUNCTION letrs(a number)
 RETURN VARCHAR2
 AS
 begin
 for a in ascii('a')..ascii('z')
 loop
 dbms_output.put_line(chr(a));
 end loop;

 dbms_output.put_line(chr(a));
 end;


 /




