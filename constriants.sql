--constraints
-- primary key,foreign key,unique,not null, check

/* > pk is uniquely idfy and not null , its automatically created for unique insex/one pk for one column
   > fk is a field that refer the pk in another tab. it s used to link the
     record in the 1st tb to record in the 2nd tb   
   >composite key is a pk that is made up of 2 or more fields.
   >uniq cnst says that a col needs to have uniq values
   DIFFERENT : U - allow null val
               PK -not allow null values
               U - a tb have 0 or 1 or many unq cntr
               PK - a tb can only have one PK 
   
*/



CREATE TABLE emp
(
empid NUMBER CONSTRAINT cnstpk primary key,
name VARCHAR2(20) CONSTRAINT cnstnn NOT NULL,
email VARCHAR2(20) CONSTRAINT cnstunq UNIQUE,
gender VARCHAR2(10) CONSTRAINT cnstck CHECK(length(gender)=1 )
);

SELECT * FROM emp;
DROP TABLE emp;

INSERT INTO emp VALUES(100,'raj','rajcs2@gamil.com','m');
INSERT INTO emp VALUES(101,'maj','majcs2@gamil.com','f');
INSERT INTO emp VALUES(102,'daj','dajcs2@gamil.com','m');
INSERT INTO emp VALUES(103,'daj','ddajcs2@gamil.com','mw');

SELECT * FROM emp;

create table s1(sname varchar2(3) constraints chk_len1 check(length(sname)=3),
                ref_val number(3)constraints chk_len2 check(length(ref_val)=2),
                b_year number(3) constraints chk_len3 check(length(b_year)=3));





--table level constraint

CREATE TABLE emp
(
empid NUMBER(20),
name VARCHAR2(20) CONSTRAINT cnstnn NOT NULL,
email VARCHAR2(20) ,
gender VARCHAR2(10),
CONSTRAINT cnstpk primary key(empid),
CONSTRAINT cnstunq UNIQUE(email),
CONSTRAINT cnstck CHECK(gender IN('f','m'))
);


SELECT * FROM user_constraints
WHERE table_name='EMP';

-- foreign key 
CREATE TABLE dept 
(
dept_id NUMBER(4) primary key,
Ddept_name VARCHAR2(20)
);
DROP TABLE dept;

select * from user_indexes where table_name='DEPT';

ALTER TABLE dept MODIFY dept_id NUMBER CONSTRAINT cnsid PRIMARY KEY;
ALTER TABLE dept MODIFY ddept_name VARCHAR2(20) CONSTRAINT cnsname NOT NULL;

SELECT * FROM emp;

-- now set foreign key
-- now alter and add the foreign key in emp table 

DROP TABLE emp;


CREATE TABLE emp
(
empid NUMBER(20),
name VARCHAR2(20) CONSTRAINT cnstnn NOT NULL,
email VARCHAR2(20) ,
gender VARCHAR2(10),
dept_id NUMBER(4),
CONSTRAINT cnstpk primary key(empid),
CONSTRAINT cnstunq UNIQUE(email),
CONSTRAINT cnstck CHECK(gender IN('f','m')),
CONSTRAINT cnsfk FOREIGN KEY(dept_id) REFERENCES dept(dept_id)
);

INSERT INTO dept(SELECT department_id,department_name FROM departments WHERE department_id < 50);
ROLLBACK;
SELECT * FROM dept;

INSERT INTO emp VALUES(100,'raj','rajcs2@gamil.com','m',10);
INSERT INTO emp VALUES(101,'maj','majcs2@gamil.com','f',20);
INSERT INTO emp VALUES(103,'daj','ddajcs2@gamil.com','m',30);
INSERT INTO emp VALUES(105,'haj','hajcs2@gamil.com','m',40);

alter table dept  disable constraint SYS_C008539 ;
alter table emp  disable constraint cnstpk ;



SYS_C008539
SELECT * FROM dept;

DROP TABLE dept;

select * from user_constraints
where table_name in ('EMP','DEPT');

------------------------------------------------------------------------------------------
--1
DROP TABLE dep purge;
create table dep(did number primary key,dname varchar2(20));
insert into dept values(10,'admin');
insert into dept values(20,'it');
insert into dept values(30,'sales');

delete dep where did=30;


DROP TABLE emp purge;
create table emp (eid number primary key,ename varchar2(20),did number,
                  constraint fk_did  foreign key(did ) references dep(did));


insert into emp values(100,'raj',10);
insert into emp values(101,'taj',20);
insert into emp values(102,'saj',30);
insert into emp values(103,'saj',40);
delete emp where did=30;
`````````````````````````````````````````````
--2
/
DROP TABLE dep purge;
create table dep(did number primary key,dname varchar2(20) );
insert into dep values(10,'admin');
insert into dep values(20,'it');
insert into dep values(30,'sales');

select * from dep;
delete dep where did=20;

 
DROP TABLE emp purge;
create table emp (eid number primary key,ename varchar2(20),did number,
                 -- constraint fk_did  foreign key(did ) references dep(did)on delete cascade); --(we cane delete any recrd in parent tb the child tb also get deleted )
                  constraint fk_did  foreign key(did ) references dep(did)on delete set null); --(we cane delete any recrd in parent tb, in child tb set null in that particular record )


insert into emp values(100,'raj',10);
insert into emp values(101,'taj',20);
insert into emp values(102,'saj',20);
insert into emp values(103,'qaj',40);
select * from emp;
delete emp where did=30;
commit;







CREATE TABLE emp(
empid NUMBER(20), 
name VARCHAR2(20) CONSTRAINT cnstnn NOT NULL,
email VARCHAR2(20) ,
gender VARCHAR2(10),
dept_id NUMBER(4),
CONSTRAINT cnstpk primary key(empid),
CONSTRAINT cnstunq UNIQUE(email),
CONSTRAINT cnstck CHECK(gender IN('f','m')),
CONSTRAINT cnsfk FOREIGN KEY(dept_id) REFERENCES dept(dept_id)
ON DELETE SET NULL
);


DELETE FROM dept where dept_id=10;

--on delete cascade
DROP TABLE emp;

CREATE TABLE emp
(
empid NUMBER(20),
name VARCHAR2(20) CONSTRAINT cnstnn NOT NULL,
email VARCHAR2(20) ,
gender VARCHAR2(10),
dept_id NUMBER(4),
CONSTRAINT cnstpk primary key(empid),
CONSTRAINT cnstunq UNIQUE(email),
CONSTRAINT cnstck CHECK(gender IN('f','m')),
CONSTRAINT cnsfk FOREIGN KEY(dept_id) REFERENCES dept(dept_id)
ON DELETE CASCADE
);

-- already 10th rec delete in dept tb 

INSERT INTO emp VALUES(100,'raj','rajcs2@gamil.com','m',30);
INSERT INTO emp VALUES(101,'maj','majcs2@gamil.com','f',20);
INSERT INTO emp VALUES(103,'daj','ddajcs2@gamil.com','m',40);
INSERT INTO emp VALUES(104,'jaj','jajcs2@gamil.com','m',30);

DELETE FROM dept where dept_id=30;
rollback;
SELECT * FROM emp;

--drop constraints
ALTER TABLE dept DROP CONSTRAINT  cnsname;


--i have a tb that is not with fk after tb creation we can add fk cnstrn 


create table t1(a number,b varchar2(10),c number);

drop table t1 purge ;
create table t1(   a number,
                   b varchar2(10),
                   c number,
--                   constraint pk_a primary key (a));
----------------------OR------------------------------
--                 constraint pk_a unique (a));
;
create table t2(e varchar2(10),a number,d number);

-- if add fk for t2 -a clmn the referenced clmn must have a ****(pk or unique )*****

alter table t2 add constraint a_fkcl foreign key(a)references t1(a); 

drop table t1;
----------------------------------------------------------------------
-- a tb have duplicates and how to create pk


insert into t1 values(1,'a',100);
insert into t1 values(2,'b',102);
insert into t1 values(1,'a',100);
insert into t1 values(3,'a',100);
insert into t1 values(4,'a',100);
insert into t1 values(5,'a',103);

alter table t1 add constraint a_pks primary key(a);  --error

create index t1_a on t1(a); --1st create index
 drop index t1_a;
alter table t1 add constraint a_pks primary key(a)novalidate; --then

select * from t1;

--composite pk
drop table t3 purge;
create table t3(a number,b number,constraint pk_ab primary key(a,b) );
insert into t3 VALUES(1,1);
insert into t3 VALUES(1,2);
insert into t3 VALUES(1,3);
insert into t3 VALUES(1,4);

select * from t3;

1	1
1	2
1	3
1	4

--in composite key not need to have unique value for separate column 

--cn have unique value for both columns














