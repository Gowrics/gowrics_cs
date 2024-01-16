--synonyms
/* SYNONYMS : is used to create a alternative name for db objects 
               that are tables,viws,m view,procedures,seuence
   SYNTAX : CREATE OR REPLACE PUBLIC SYNONYM schema.syn_name
             FOR schema.object_name
       1st: if we skip the schema oracle will create the syn in your own sch
       2nd:PUBLIC keyw to create public syn which is the syn that will be accssible to all users
       
      */  
CREATE SYNONYM elc FOR ELECTRICALS;

SELECT * FROM elc;
INSERT INTO elc VALUES('cape',2,20,'junction box', 50,seq_1.NEXTVAl);

CREATE PUBLIC SYNONYM elc FOR ELECTRICALS;

13.I have used a table inside the procedure and also i have a synonym for same table. 
If i drop a table what will happen for procedure and synonymn?



create or replace procedure p1
as 
begin
update empee
set salary=39000
where eid=10;
p2();
rollback;

end;
/

exec p1;

create or replace procedure p2
as 
pragma autonomous_transaction;
begin

INSERT INTO empee VALUES (14,'now',33000);
commit;
end;
/

drop table employee;
create SYNONYM empee for employee;
select * from empee;
select * from employee;


create table employee(eid number,enam varchar2(20),salary number);
select * from employee;
INSERT INTO employee VALUES (10,'gow',20000);
INSERT INTO employee VALUES (11,'how',25000);
INSERT INTO employee VALUES (12,'jow',30000);
INSERT INTO employee VALUES (13,'mow',60000);
INSERT INTO employee VALUES (14,'now',33000);
/
/

