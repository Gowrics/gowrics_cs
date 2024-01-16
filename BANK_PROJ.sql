--KCB_ACC_BANK

create table kcb_acc_tab
(
accno number primary key,
name varchar2(20)constraint name_nn not null,
actype char check (actype in('s','c','fd')),
doo date default sysdate,
bal number(8,2) not null
);

--insert

insert into kcb_acc_tab values(37002167543,'srinivas','s',sysdate,15000);

commit;


--KCB_TRAN_BANK

create table kcb_tran_tab
(
tid number,
accno number(20) ,-- references kcb_acc_tab(accno),
trtype char(10) check(trtype in ('d','w')),
dot date default sysdate,
amt number(7,2) check(amt >100) 
);

--sequense
create sequence A1
start with 1
increment by 1
maxvalue 1000
minvalue 0
nocache
nocycle;
/
--PLSQL PROG FOR MODIFY THE BALANCE 

declare
i kcb_acc_tab%rowtype;
k kcb_tran_tab%rowtype;
begin
i.accno :=&accno;
k.trtype :='&trtype';
k.amt :=&amount;
select bal into i.bal from kcb_acc_tab where accno =i.accno;
if k.trtype ='d' then
  i.bal:=i.bal + k.amt;
end if;
--
update kcb_acc_tab 
set bal=i.bal
where accno=i.accno;
--
insert into kcb_tran_tab values(a1.nextval,i.accno,k.trtype,sysdate,k.amt);
commit;
end;
/
==============================
select * from kcb_tran_tab;
select * from kcb_acc_tab;
=============================
----PLSQL PROG FOR MODIFY THE BALANCE DEPENDS ON WITHDRAW OR DEPOSIT
declare
i kcb_acc_tab%rowtype;
k kcb_tran_tab%rowtype;
begin
i.accno:=&accno;
k.trtype:='&trtype';
k.amt:=&amt;
select actype,bal into i.actype,i.bal from kcb_acc_tab where accno =i.accno;
if k.trtype='d' then
 i.bal:=i.bal + k.amt;
else
   if i.actype ='s' and  i.bal <5000 then
    raise_application_error( -20456,' the balance is too low to perform this action');
   else
    i.bal:=i.bal - k.amt;
   end if; 
end if;  
--  
update kcb_acc_tab 
set bal=i.bal
where accno=i.accno;
--
insert into kcb_tran_tab values(a1.nextval,i.accno,k.trtype,sysdate,k.amt);
commit;
end;
/


=============================
select * from kcb_tran_tab;
select * from kcb_acc_tab;
=============================

create or replace procedure upd_bal(p_accno kcb_acc_tab.accno%type,p_amt kcb_tran_tab.amt%type,p_trtype kcb_tran_tab.trtype%type  )
is
cbal kcb_acc_tab.bal%type;
vactype kcb_acc_tab.actype%type;
begin
select actype,bal into vactype,cbal from kcb_acc_tab where accno=p_accno;


if p_trtype ='d' then
 cbal:= cbal + p_amt;
else 
  if vactype='s' and cbal <5000 then
    raise_application_error(-20056,'you cannot withdraw because of insufficient balance ');
  else
    cbal:=cbal - p_amt;
  end if;
end if;   

--  
update kcb_acc_tab 
set bal=cbal
where accno=p_accno;
--
insert into kcb_tran_tab values(a1.nextval,p_accno,p_trtype,sysdate,p_amt);
commit;

exception
when no_data_found then
dbms_output.put_line(p_accno ||' does not exsist');

end;
/
set serveroutput on;
----------EXEC---------------------

begin
upd_bal(370044442167543,25650,'d');
end;
/


create or replace function chk_balance( p_accno kcb_acc_tab.accno%type,
                                        p_amt kcb_tran_tab.amt%type)
return char
is
cbal kcb_acc_tab.bal%type;
vactype kcb_acc_tab.actype%type;
begin
select bal,actype into cbal,vactype from kcb_acc_tab where accno =p_accno;
cbal:=cbal - p_amt;
if vactype='s' and cbal <5000 then
  return (0);
elsif vactype='c' and cbal< 10000 then 
  return (0);
else
  return (1);
end if;
end;
/
 
 
 select chk_balance(&accno,&amt) from dual;
 
 
begin
if chk_balance(&accno,&amt)=1 then
  dbms_output.put_line(' it is  validate');
else
  dbms_output.put_line(' it is not validate');
end if;
end;
/

==========================================================================================
create or replace procedure upd_bal(p_accno kcb_acc_tab.accno%type,p_amt kcb_tran_tab.amt%type,p_trtype kcb_tran_tab.trtype%type  )
is
cbal kcb_acc_tab.bal%type;
vactype kcb_acc_tab.actype%type;
begin

select actype,bal into vactype,cbal from kcb_acc_tab where accno=p_accno;

if  p_trtype='d' then
cbal:= cbal + p_amt;
elsif p_trtype='w' then 
   if chk_balance(p_accno,p_amt)=1 then
       cbal:=cbal - p_amt;
    else
      raise_application_error(-20034,'cannot possible for transaction');
   end if;
end if;
--  
update kcb_acc_tab 
set bal=cbal
where accno=p_accno;
--
insert into kcb_tran_tab values(a1.nextval,p_accno,p_trtype,sysdate,p_amt);
commit;

exception
when no_data_found then
dbms_output.put_line(p_accno ||' does not exsist');

end;
/


begin
upd_bal(37002167543,10,'w');
end;
/


==============================
select * from kcb_tran_tab;
select * from kcb_acc_tab;
=============================
/


-------------package spec----------------------

create or replace package pack_upbal
as
--cbal bankmaster.curr_bal%type;
procedure upd_bal(vaccno kcb_acc_tab.accno%type,
                  vtrtype kcb_tran_tab.trtype%type,
                  vamt kcb_tran_tab.amt%type);

function chk_bal(vaccno kcb_acc_tab.accno%type,
                  vamt kcb_tran_tab.amt%type)
return boolean;
cbal kcb_acc_tab.bal%type;
end pack_upbal;
/

exec pack_upbal.upd_bal(37002167543,'d',1000);

-------------
create or replace package body pack_upbal
as
procedure upd_bal(vaccno kcb_acc_tab.accno%type,vtrtype kcb_tran_tab.trtype%type,vamt kcb_tran_tab.amt%type)
is
begin
select bal into cbal from kcb_acc_tab where accno=vaccno;
if vtrtype ='w' then
cbal:=cbal-vamt;
end if;

update kcb_acc_tab set bal=cbal
where accno=vaccno;
commit;
end upd_bal;

--

function chk_bal(vaccno kcb_acc_tab.accno%type,
                  vamt kcb_tran_tab.amt%type)
return boolean
is
vactype kcb_acc_tab.actype%type;
begin
select bal,actype into cbal,vactype from kcb_acc_tab where accno=vaccno;
cbal:=cbal-vamt;
if vactype ='s' and cbal <5000 then
return(false);
elsif vactype ='c' and cbal <10000 then
return(false);
else
return(true);
end if;
end chk_bal;
end pack_upbal;
/


-----------------------trigger--------------------------

drop trigger trg_blance;
create or replace trigger trg_blance
before insert 
on kcb_tran_tab
for each row
begin
if :new.trtype ='d' then
pack_updbal.upd_bal(:new.accno,:new.trtype,:new.amt);
elsif :new.trtype='w' then
if pack_updbal.chk_bal(:new.accno,:new.trtype,:new.amt);
else
raise_application_error(-20030,'no transaction');
end if;
end if;
exception
when no_data_found then
dbms_output.put_line(:new.accno||'not exists');
end;
/
__________________________________________________________________________________________________________________________________________________________________
/
-------acc num creation-------------------

CREATE table city_code(
                       city varchar2(10),
                       code_num varchar2(5) primary key,
                       constraint uniq_k unique(city,code_num)
                       );
insert into city_code values('salem','33007');
insert into city_code values('erode','33009');
insert into city_code values('chennai','33002');
insert into city_code values('vellore','33004');
insert into city_code values('vilupuram','33006');

select * from city_code;
drop table city_code;
---seq------------------------------
create sequence AA1
start with 100
increment by 1
maxvalue 999
minvalue 100
nocycle
nocache;
drop sequence aa1;
--------------function--------------
create or replace function fn_accno
return varchar2
as
p_cnum number :=33009;
p_out varchar2(100);
p_sno number :=aa1.nextval;
begin
p_out:='KCB'||p_cnum||p_sno;
return(p_out);
end;
/

select fn_accno from dual;


drop trigger ACC_CRT_TRG ;


create table kcb_acc_tab
(
accno varchar2(50) primary key,
name varchar2(20)constraint name_nn not null,
actype char(2) check (actype in('s','c','fd')),
doo date default sysdate,
code_num varchar2(5) references city_code(code_num) ,
bal number(10,2) not null
);
desc kcb_acc_tab;
drop table kcb_acc_tab;
select trigger_name from user_triggers where table_name='KCB_ACC_TAB';
--insert

insert into kcb_acc_tab values(fn_accno,'srinivas','s',sysdate,'33002',15000);
insert into kcb_acc_tab values(fn_accno,'kiran','c',sysdate,'33004',30000);
insert into kcb_acc_tab values(fn_accno,'ramesh','s',sysdate,'33007',25000);
insert into kcb_acc_tab values(fn_accno,'ravi','fd',sysdate,'33009',500000);
insert into kcb_acc_tab values(fn_accno,'kavi','s',sysdate,'33009',50000);

commit;

select  a.code_num,c.city from kcb_acc_tab a,city_code c
where c.code_num=a.code_num;



--KCB_TRAN_BANK

create table kcb_tran_tab
(
tid number,
accno varchar2(50)  references kcb_acc_tab(accno),
trtype char(10) check(trtype in ('d','w')),
dot date default sysdate,
amt number(7,2) check(amt >100),
status varchar2(500)
);

drop table kcb_tran_tab;
==============================
truncate table kcb_acc_tab;
truncate table kcb_tran_tab;

select * from kcb_tran_tab;
select * from kcb_acc_tab;
=============================



create or replace procedure update_bal(p_acc kcb_acc_tab.accno%type,p_trtype kcb_tran_tab.trtype%type, p_amt kcb_tran_tab.amt%type)
as
v_bal kcb_acc_tab.bal%type;
v_actype kcb_acc_tab.actype%type;
begin   
select bal,actype into v_bal,v_actype from kcb_acc_tab where accno =p_acc;

if p_trtype='d' and chk_deposit(p_acc,p_trtype,p_amt)=1 then
v_bal:=v_bal + p_amt;
elsif p_trtype='d' and chk_deposit(p_acc,p_trtype,p_amt)=0 then
 dbms_output.put_line('can not deposit in fd account');
elsif p_trtype='w' and v_actype='fd' then
 dbms_output.put_line('can not withdraw from fd  account');
elsif p_trtype='w' and chk_withdraw(p_acc,p_trtype,p_amt)=1 then
v_bal:=v_bal - p_amt;
else
 dbms_output.put_line('can not withdraw from the account');
end if;

update kcb_acc_tab 
set bal=v_bal
where accno =p_acc;

exception
when no_data_found then
dbms_output.put_line(p_acc||'  not exists');

end;
/
set serveroutput on;


create or replace function chk_deposit (p_acc kcb_acc_tab.accno%type, p_trtype kcb_tran_tab.trtype%type, p_amt kcb_tran_tab.amt%type)
return number
as
v_bal kcb_acc_tab.bal%type;
v_actype kcb_acc_tab.actype%type;
begin   
select bal,actype into v_bal,v_actype from kcb_acc_tab where accno =p_acc;
if p_trtype='d' and v_actype<>'fd' then
return (1);
else 
return (0);
end if;
end;
/

select  chk_deposit(37002167546,'d',1000) from dual;

create or replace function chk_withdraw (p_acc kcb_acc_tab.accno%type, p_trtype kcb_tran_tab.trtype%type, p_amt kcb_tran_tab.amt%type)
return number
as
v_bal kcb_acc_tab.bal%type;
v_actype kcb_acc_tab.actype%type;
begin   
select bal,actype into v_bal,v_actype from kcb_acc_tab where accno =p_acc;
if p_trtype='w' and v_actype='fd' then
return (0);
elsif p_trtype='w' and v_actype<>'fd' then
    v_bal:= v_bal - p_amt; 
    if v_actype='s' and v_bal >5000 then
      return (1);
    elsif v_actype='c' and v_bal >10000 then
     return (1);
     else
     return (0);
     end if;
end if;

end;
/

select  chk_withdraw(37002167543,'w',1000) from dual;
select  chk_deposit(37002167546,'d',1000) from dual;
exec update_bal(37002167543,'w',10000);

----------------------------------------package --------------------------------------------

create or replace package kcb_bank_process
as
v_msg varchar2(500);
function chk_deposit (p_acc kcb_acc_tab.accno%type, p_trtype kcb_tran_tab.trtype%type, p_amt kcb_tran_tab.amt%type) return number;
function chk_withdraw (p_acc kcb_acc_tab.accno%type, p_trtype kcb_tran_tab.trtype%type, p_amt kcb_tran_tab.amt%type) return number;
procedure update_bal(p_acc kcb_acc_tab.accno%type,p_trtype kcb_tran_tab.trtype%type, p_amt kcb_tran_tab.amt%type);
end;
/

create or replace package body kcb_bank_process
as
function chk_deposit (p_acc kcb_acc_tab.accno%type, p_trtype kcb_tran_tab.trtype%type, p_amt kcb_tran_tab.amt%type)
return number
is
v_bal kcb_acc_tab.bal%type;
v_actype kcb_acc_tab.actype%type;
begin   
select bal,actype into v_bal,v_actype from kcb_acc_tab where accno =p_acc;
if p_trtype='d' and v_actype<>'fd' then
return (1);
else 
return (0);
end if;
end;

function chk_withdraw (p_acc kcb_acc_tab.accno%type, p_trtype kcb_tran_tab.trtype%type, p_amt kcb_tran_tab.amt%type)
return number
is
v_bal kcb_acc_tab.bal%type;
v_actype kcb_acc_tab.actype%type;
begin   
select bal,actype into v_bal,v_actype from kcb_acc_tab where accno =p_acc;
if p_trtype='w' and v_actype='fd' then
return (0);
elsif p_trtype='w' and v_actype<>'fd' then
    v_bal:= v_bal - p_amt; 
    if v_actype='s' and v_bal >5000 then
      return (1);
    elsif v_actype='c' and v_bal >10000 then
     return (1);
     else
     return (0);
     end if;
end if;

end;


 procedure update_bal(p_acc kcb_acc_tab.accno%type,p_trtype kcb_tran_tab.trtype%type, p_amt kcb_tran_tab.amt%type)
is
v_bal kcb_acc_tab.bal%type;
v_actype kcb_acc_tab.actype%type;
begin   
select bal,actype into v_bal,v_actype from kcb_acc_tab where accno =p_acc;
if p_trtype='d' and chk_deposit(p_acc,p_trtype,p_amt)=1 then
v_bal:=v_bal + p_amt;
v_msg:='update successfully';
elsif p_trtype='d' and chk_deposit(p_acc,p_trtype,p_amt)=0 then
v_msg:='can not deposit in fd account';
 dbms_output.put_line(v_msg);
elsif p_trtype='w' and v_actype='fd' then
v_msg:='can not withdraw from fd  account';
 dbms_output.put_line(v_msg);
elsif p_trtype='w' and chk_withdraw(p_acc,p_trtype,p_amt)=1 then
v_bal:=v_bal - p_amt;
else
v_msg:='can not withdraw from the account because insuffiecent balance';
 dbms_output.put_line(v_msg);
end if;

update kcb_acc_tab 
set bal=v_bal
where accno =p_acc;

dbms_output.put_line(v_msg);
--insert into kcb_tran_tab values(a1.nextval,p_acc,p_trtype,sysdate,p_amt,v_msg);
exception
when no_data_found then
dbms_output.put_line(p_acc||'  not exists');
end;

end kcb_bank_process;
/

select  kcb_bank_process.chk_withdraw('KCB33009101','w',11000) from dual;
select  kcb_bank_process.chk_deposit('KCB33009104','d',1000) from dual;

exec kcb_bank_process.update_bal('KCB33009104','w',3000);


drop trigger bnk_trg;

select * from kcb_tran_tab;
select * from kcb_acc_tab;
drop table kcb_tran_tab;
=============================

create or replace trigger bnk_trg
before insert or update or delete
on kcb_acc_tab
for each row
declare
--v_bal number;
opr varchar2(100);
begin
if pkg1.v_sal >:new.bal then
opr:= 'deposit';
elsif pkg1.v_sal = :new.bal then
opr:= 'no any action happened';
else
opr:='withdraw';
end if;
insert into kcb_tran_tab values(a1.nextval,:new.accno,opr,sysdate,1000); 
end;
/





create table kcb_tran_tab
(
tid number,
accno number(20),--  references kcb_acc_tab(accno),
trtype char(10) check(trtype in ('d','w')),
dot date default sysdate,
amt number(7,2) check(amt >100) 
);


--------------statement trg----------------
CREATE OR REPLACE TRIGGER trg_sal
BEFORE UPDATE ON kcb_acc_tab
--for each row
BEGIN
SELECT bal INTO pkg1.v_sal FROM kcb_acc_tab
WHERE accno=accno;
END;
/

--pkg is used for globel variable
CREATE OR REPLACE PACKAGE pkg1
AS
v_sal NUMBER;
END;
/


