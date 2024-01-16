--VIRTUAL TABLE

CREATE TABLE vrt_tb
(
eid NUMBER,
fname VARCHAR2(10),
lname VARCHAR2(10),
fullname VARCHAR2(30) GENERATED ALWAYS AS (fname||' '||lname),
esalary NUMBER,
ebonus NUMBER GENERATED ALWAYS AS (esalary * 5/100)
);

INSERT INTO vrt_tb (eid,fname,lname,esalary) 
    VALUES(10,'raj','shy',3000);
    SELECT * FROM vrt_tb;

INSERT INTO vrt_tb (eid,fname,lname,esalary) 
    VALUES(20,'taj','mag',4000);
 
INSERT INTO vrt_tb (eid,fname,lname,esalary) 
    VALUES(30,'yaj','shy',5600);
           
select * FROM emp;
drop table emp;

CREATE TABLE emp
AS
(SELECT * FROM employees);
desc emp;
ALTER TABLE emp ADD fullname VARCHAR2(50) GENERATED ALWAYS AS (first_name||' '||last_name); 
--just try

