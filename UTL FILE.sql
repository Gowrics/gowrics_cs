




---------------------------------
   UTL.FILE PACKAGE 
    Oracle 7.3   
    load the data into os file and also read  from os file but sql loader also used to retrive tha data from flat file
    into oracle db 
sql loader------->>  client and serverside working

UTL file--------->>   server side only handling

alias dir or logical dir
     
     plsql does not interact directly with os files..
     if you want interact with os file we must create alias dir..
     
--open sys user
sqlplus sys/sys AS sysdba
     connected
SYNTAX:  CREATE OR REPLACE DIRECTORY dir_nam AS 'D:\GOWRI CS\1program languages';

create privillage


SYNTAX  :
    GRANT read,write on  DIRECTORY report_dir TO public;
    GRANT execute ON UTL_FILE TO PUBLIC;





SQL> connect hr/open
Connected.

writing a data into a os file
------------------------------
st...1
plsql declare

var_name utl_file.file_type
st.....2
var_name:=utl_file.fopen(alias dir,file_name,mode)

st...3  read
putf()
utl_file.putf(var_name,'content');

st...4
fclose()

utl_file.fclose(var_name);
-----------------------------------------------------------------------------------
utl_file
file_type
fopen
putf , put_line
get_line
w,r,a
fclose

-----------------------------------------------------------------------------------------------

C:\Users\ELCOT>sqlplus sys/sys as sysdba

Connected to:
Oracle Database 11g Express Edition Release 11.2.0.2.0 - 64bit Production

SQL> CREATE OR REPLACE DIRECTORY report_file AS 'D:\GOWRI CS';

Directory created.

 GRANT READ,WRITE ON DIRECTORY report_file TO PUBLIC;

Grant succeeded.

 GRANT EXECUTE ON UTL_FILE TO PUBLIC;

Grant succeeded.

SQL> conn hr/open
Connected.
SQL> desc all_directories;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 OWNER                                     NOT NULL VARCHAR2(30)
 DIRECTORY_NAME                            NOT NULL VARCHAR2(30)
 DIRECTORY_PATH                                     VARCHAR2(4000)

SQL> set linesize 200

 select * from all_directories
 where directory_name ='CS_DIR';
          
 select * from all_tab_privs
 where table_name='CS_DIR'
 and grantee =user
 and privilege ='WRITE';
````````````````````````````````````````````````````````````````````````````/

 DECLARE
  v_file UTL_FILE.FILE_TYPE;
  v_data varchar2(300);
  BEGIN
 v_file:=UTL_FILE.FOPEN('DIR_NAME','copy1.txt','a');  --directory name must be i a capital letters...

  utl_file.put_line(v_file,'haiiiiiiii' );
 UTL_FILE.FCLOSE(v_file);
  
  END;
   /
```````````````````````````````````````````````````````````````````
DECLARE
  v_file UTL_FILE.FILE_TYPE;
  v_data varchar2(200);
  BEGIN
 v_file:=UTL_FILE.FOPEN('DIR_NAME','copy1.txt','r');  --directory name must be i a capital letters...
 loop
 utl_file.get_line(v_file,v_data );
 dbms_output.put_line(v_data );
 end loop;
 exception
 when no_data_found then
 UTL_FILE.FCLOSE(v_file);
  END;
   /
   set serveroutput on;
-------------------------------------------------------------------------------

/

 DECLARE
  v_file UTL_FILE.FILE_TYPE;
  BEGIN
 v_file:=UTL_FILE.FOPEN('CS_DIR','copy_file.txt','w');  --directory name must be i a capital letters...
--  v_file:=UTL_FILE.FOPEN('GOWRI_DIR','copy_file.txt','a');  --this paameter is used for append the another text..

 utl_file.put_line(v_file,'my terms in my life....' );

 -- utl_file.put_line(v_file,'my name is gowri.......' );
 UTL_FILE.FCLOSE(v_file);
  END;
   /


PL/SQL procedure successfully completed.;
/

--now we can create the procedure



create or replace procedure emp_rep
as
v_file utl_file.file_type;
cursor emp1 
is 
select * from employees;
v_data emp1%rowtype;  
v_det varchar2(200);--after declare the cursor then the variable declr must be cursor rowtype
begin
v_file:=utl_file.fopen('GOWRI_DIR','copy_file3.txt','w');
open emp1;
loop
fetch emp1 into v_data;
v_det:=v_data.employee_id||' '||RPAD(v_data.first_name,11,' ')||' '||v_data.salary;
utl_file.put_line(v_file,v_det);
exit when emp1%notfound;
end loop;
close emp1;
utl_file.fclose(v_file);
end;


/         

exec emp_rep;


---------

create or replace procedure dept_cs    --cursor for loop
as
v_file utl_file.file_type;
v_data varchar2(200);
cursor dep_c
is
select department_id||' '||department_name||' '||location_id dep_det from departments;

begin
v_file:=utl_file.fopen('GOWRI_DIR','files1.txt','w');
for i in dep_c
loop
--v_data:=i.department_id||' ,'||i.department_name;
v_data:= i.dep_det ;

--utl_file.putf(v_file,v_data);    this is print the same line
utl_file.put_line(v_file,v_data);
end loop;
utl_file.fclose(v_file);
end;
/

select first_name||' '||salary ||' '||department_id emp_det from employees where department_id=0;

exec dept_cs;



create or replace procedure dept_cs    --cursor for loop
as
v_file utl_file.file_type;
v_data varchar2(200);
v_header varchar2(100);
v_footer varchar2(100);
v_count number:=0;
cursor dep_c
is
select department_id,department_name from departments;

begin
v_file:=utl_file.fopen('GOWRI_DIR','copy_file5.txt','w');

v_header:='department file \ '||to_char(sysdate,'ddth-month yyyy');
utl_file.put_line(v_file,v_header);
for i in dep_c
loop
v_count :=v_count+1;
--v_data:=i.department_id||' ,'||i.department_name;
v_data:=rpad(i.department_id,3,' ')
      ||rpad(i.department_name,20,' ');

--utl_file.putf(v_file,v_data);    this is print the same line
utl_file.put_line(v_file,v_data);

end loop;
v_footer:='file count is  :'||v_count;
utl_file.put_line(v_file,v_footer);
utl_file.fclose(v_file);
end;
/
--its only created after that we can execute

==============important ========================================/
EXEC dept_cs;
=================================================================/

-----using bulk collect with cursor----

declare 
v_file utl_file.file_type;
cursor emp is
select * from employees;
type emp_c is table of employees%rowtype
index by binary_integer;
v_emp emp_c;
begin 
 v_file:= utl_file.fopen('CS_DIR','copy_file4.txt','w');
 open emp ;
 fetch emp bulk collect into v_emp ;
 
close emp;
for i in v_emp.first..v_emp.last
loop
utl_file.put_line(v_file,v_emp(i).first_name||v_emp(i).salary);
--utl_file.put_line(v_file,v_emp);
end loop;
utl_file.fclose(v_file);
end;
/

-----using bulk collect without cursor----

declare 
v_file utl_file.file_type;
type dept_c1 is table of departments%rowtype
index by binary_integer;
v_dep dept_c1;
begin
v_file:= utl_file.fopen('GOWRI_DIR','copy_file3.txt','w');
select * bulk collect into v_dep from departments;
for i in v_dep.first..v_dep.last
loop
utl_file.put_line(v_file,v_dep(i).department_id||v_dep(i).department_name);
end loop;
utl_file.fclose(v_file);
end;
/

```````````````````````````````````````````````````````````````````````````````````
create or replace procedure emp_rep
as
v_file utl_file.file_type;
cursor emp1
is select * from employees;

v_data emp1%rowtype;  
v_det varchar2(200);--after declare the cursor then the variable declr must be cursor rowtype
begin
v_file:=utl_file.fopen('GOWRI_DIR','copy_file3.txt','w');
open emp1;
loop
fetch emp1 into v_data;
v_det:=v_data.employee_id||v_data.first_name||v_data.salary;
utl_file.put_line(v_file,v_det);
exit when emp1%notfound;
end loop;
close emp1;
utl_file.fclose(v_file);
end;
/         

exec emp_rep;







---------------append------------------

create or replace procedure dept_cs    --cursor for loop
as
v_file utl_file.file_type;
v_data varchar2(200);
cursor dep_c
is
select employee_id||' '||first_name||' '||salary||' '||department_id emp_det from employees
where department_id =60;
begin
v_file:=utl_file.fopen('GOWRI_DIR','files1.txt','A');
for i in dep_c
loop
--v_data:=i.department_id||' ,'||i.department_name;
v_data:= i.emp_det ;

--utl_file.putf(v_file,v_data);    this is print the same line
utl_file.put_line(v_file,v_data);
end loop;
utl_file.fclose(v_file);
end;
/

select first_name||' '||salary ||' '||department_id||' '|| emp_det from employees where department_id=0;

exec dept_cs;



create or replace procedure dept_cs
as
v_file utl_file.file_type;
v_data varchar2(200);
v_header varchar2(100);
v_footer varchar2(100);
v_count number:=0;
cursor dep_c
is
select employee_id,first_name ,salary from employees
order by 1 asc;

begin
v_file:=utl_file.fopen('GOWRI_DIR','copy_file2.txt','w');

v_header:='department file \ '||to_char(sysdate,'ddth-month yyyy')||'   time  :'||to_char(sysdate,'hh-mi');
utl_file.put_line(v_file,v_header);
for i in dep_c
loop
v_count :=v_count+1;

--v_data:=i.employee_id||'  '||i.first_name||'  '||i.salary;

v_data:=i.first_name;

--v_data:=''''||i.employee_id||''','''||i.first_name||''','''||i.salary||'''';

--utl_file.putf(v_file,v_data);    this is print the same line
utl_file.put_line(v_file,v_data);

end loop;
v_footer:='file count is  :'||v_count;
utl_file.put_line(v_file,v_footer);
utl_file.fclose(v_file);
end;
/
--its only created after that we can execute

==============important ========================================/
EXEC dept_cs;
=================================================================


 CREATE OR REPLACE PROCEDURE rep_gen_sp
   AS
     v_file UTL_FILE.FILE_TYPE;
     v_data VARCHAR2(200);
     v_h VARCHAR2(100) :='HDR'||TO_CHAR(sysdate,'ddmmyyyy');
     v_f VARCHAR2(100) :='HDR'||TO_CHAR(sysdate,'ddmmyyyy');
     v_fname VARCHAR2(100):='emp_dtls_'||TO_CHAR(sysdate,'ddmmyyhhmiss')||'.txt';
     v_count NUMBER:=0;
   CURSOR dep_c
   IS
     SELECT department_id,department_name,manager_id,location_id
     FROM departments;
   BEGIN
   v_file:=UTL_FILE.FOPEN('REPORT_FILE',v_fname,'w');
 
   utl_file.put_line(v_file,v_h);
 
   FOR i IN dep_c
   LOOP
   v_count:=v_count+1;
   v_data:=i.department_id ||','||
           i.department_name ||','||
           i.location_id;
 
   utl_file.put_line(v_file, v_data );
   END LOOP;
 
   v_f:=v_f||LPAD(v_count,5,0);
 
   utl_file.put_line(v_file,v_f);
 
   UTL_FILE.FCLOSE(v_file);
  END rep_gen_sp;
  /

Procedure created.

 EXEC rep_gen_sp;
/
--read the file for 1 line  (read mode||get_line||dbms_output)

DECLARE
  v_file UTL_FILE.FILE_TYPE;
  v_data varchar2(200);
  BEGIN
 v_file:=UTL_FILE.FOPEN('GOWRI_DIR','copy_file.txt','r');  --directory name must be i a capital letters...
 utl_file.get_line(v_file,v_data );
 dbms_output.put_line(v_data );
 UTL_FILE.FCLOSE(v_file);
  END;
   /
`

--read the file for multiple line line

DECLARE
  v_file UTL_FILE.FILE_TYPE;
  v_data varchar2(200);
  BEGIN
 v_file:=UTL_FILE.FOPEN('GOWRI_DIR','files1.txt','R');  --directory name must be i a capital letters...
loop
 utl_file.get_line(v_file,v_data );
 dbms_output.put_line(v_data );
-- dbms_output.put(v_data );
 end loop;
 --without exep error accour nodatafound
 exception
 when no_data_found then
UTL_FILE.FCLOSE(v_file);
  END;
  /
  
  create table emp_details(emp_det varchar2(500));
select * from emp_details; 
 
 DECLARE
  v_file UTL_FILE.FILE_TYPE;
  v_data varchar2(200);
  BEGIN
 v_file:=UTL_FILE.FOPEN('GOWRI_DIR','files1.txt','R');  --directory name must be i a capital letters...
loop
 utl_file.get_line(v_file,v_data );
 dbms_output.put_line(v_data );
-- dbms_output.put(v_data );

insert into emp_details(emp_det) values(v_data);
 end loop;
 --without exep error accour nodatafound
 exception
 when no_data_found then
UTL_FILE.FCLOSE(v_file);
  END;
  /

  
  
   -- success

--  copy a file

begin 
utl_file.fcopy('GOWRI_DIR','copy_file2.txt','DIR_CS','copies.txt');
end;
/

--remove

begin 
utl_file.fremove('DIR_CS','copies.txt');
end;
/




--rename


begin 
utl_file.frename('GOWRI_DIR','copy_file.txt','GOWRI_DIR','copyfiles.txt',TRUE);
end;
/

begin 
utl_file.frename('DIR_CS','copyemp.txt','DIR_CS','copy_emp.txt',TRUE);
end;
/


--reads and return the attributes to a disk file-----------
declare
ex boolean;
flen number;
bsize number;
begin 

utl_file.fgetattr('GOWRI_DIR','files1.txt',ex,flen,bsize);
if ex then
dbms_output.put_line('file exists');
dbms_output.put_line('file length  :'||flen);
dbms_output.put_line('file bsize   :'||bsize);
else
dbms_output.put_line('file does not exists');

end if;
end;
/


------------utl exception------------------------------


 DECLARE
  v_file UTL_FILE.FILE_TYPE;
  BEGIN
 v_file:=UTL_FILE.FOPEN('GOWRI_DIR','copy_file.txt','w');  --directory name must be i a capital letters...

 utl_file.put_line(v_file,'my terms in my life....' );
/*
exception
when utl_file.invalid_path then
raise_application_error(-20051,'invalid file location');

exception
when utl_file.invalid_mode then
raise_application_error(-20051,'invalid mode parameter');

exception
when utl_file.invalid_path then
raise_application_error(-20051,'invalid file location');
exception
when utl_file.invalid_operation then
raise_application_error(-20051,'invalid path parameter');
*/
UTL_FILE.FCLOSE(v_file);
  END;
   /
   
   ==============================================================================
   
-----   flat os file into orcle database------------------------

create table emp_list(employee_id number(20),name varchar2(50));
/

declare
 v_file utl_file.file_type;
 v_data varchar2(300);
 v2 varchar2(20000);
 SQLSTMT varchar2(20000);
begin
v_file:=utl_file.fopen('GOWRI_DIR','copy_file2.txt','r');
loop
  begin
  utl_file.get_line(v_file,v_data);
  dbms_output.put_line(v_data);
   select replace(v_data,',',''',''') into v2 from dual;
   SQLSTMT :='insert into emp_list values('''||v2||''')';
   execute immediate SQLSTMT;
   dbms_output.put_line(SQLSTMT);
   exception
   when no_data_found then
   exit;
  end;
end loop;
utl_file.fclose(v_file);
end;
/
   
select * from emp_list;
truncate table emp_list;
================================================================================/

spool 'D:\GOWRI CS\utl_report\gow_csv.txt';

select * from departments;

spool off;



SQL> ttitle off;
SQL> etitle off;
SP2-0042: unknown command "etitle off" - rest of line ignored.
SQL> set feedback off
SQL> set heading off
SQL> set autot off
SQL> spool 'D:\GOWRI CS\utl_report\gow_csv.txt';
SQL> select * from departments;


create table emp_views(employee_id number(20),name varchar2(50));


declare
v_file utl_file.file_type;
v_d1 varchar2(300);
v_d2 varchar2(20000);
STMT varchar2(32700);
begin
v_file:=utl_file.fopen('CS_DIR','copy_file3.txt','r');
loop
begin
utl_file.get_line(v_file,v_d1);
dbms_output.put_line(v_d1);
select replace(v_d1,',',''',''') into v_d2 from dual;
STMT:='insert into emp_views values('''||v_d2||''')';
dbms_output.put_line(STMT);
execute immediate STMT;
end;
end loop;
exception
when no_data_found then
utl_file.fclose(v_file);
end;
/


select * from emp_views;

191Randall2500

select (''''||substr(v_d1,1,3)||''','||''''||substr(v_d1,4,14)||''','||''''||substr(v_d1,13)||'''' ) from dual;

select ('''||substr('191Randall2500',1,3)||''','''||substr('191Randall2500',4,14)||''','''||substr('191Randall2500',15) from dual;

select ('''||substr(v_d1,1,3)||''','''||substr(v_d1,4,14)||''','''||substr(v_d1,15) from dual;

select employee_id,length(first_name) from employees; -- 153
;
select substr(first_name,3) from employees;

/


create table dept_viewss(department_id number,department_name varchar2(50));
select * from dept_viewss;
drop table dept_viewss;
declare
v_file utl_file.file_type;
v_d1 varchar2(300);
v_d2 varchar2(32767);
STMT varchar2(32767);
begin
v_file:=utl_file.fopen('GOWRI_DIR','copy_file5.txt','r');
loop
  begin
   utl_file.get_line(v_file,v_d1);
   dbms_output.put_line(v_d1);
   select substr(v_d1,1,3)||''','''||substr(v_d1,4) into v_d2  from dual;
   STMT:='insert into dept_viewss values('''||v_d2||''')';
   dbms_output.put_line(STMT);
   execute immediate STMT;
end;
end loop;
exception
when no_data_found then
utl_file.fclose(v_file);
end;
/

--anoher one try with out execute immediate stmnt
declare
v_file utl_file.file_type;
v_data varchar2(300);
v_d1 varchar2(20000);
v_d2 varchar2(20000);
STMT varchar2(32767);
begin
v_file:=utl_file.fopen('GOWRI_DIR','copy_file5.txt','r');
loop
  begin
   utl_file.get_line(v_file,v_data);
end;
   dbms_output.put_line(v_d1||' '||v_d2);
   v_d1:= substr(v_data,1,3);
   v_d2:=substr(v_data,4);
   insert into dept_viewss(department_id,department_name) values(v_d1,v_d2);
end loop;
exception
when no_data_found then
utl_file.fclose(v_file);
end;
/


set serveroutput on;
   select substr('150Shareholder Services',1,3)||''','''||substr('150Shareholder Services',4)  from dual;

select (''''||substr(v_d1,1,3)||''','||''''||substr(v_d1,4,14)||''','||''''||substr(v_d1,13)||'''' ) into v_d2 from dual;

---------------------------------------------------------------------------------


select * from emp_viewss;
drop table emp_viewss;

declare
v_file utl_file.file_type;
v_d1 varchar2(3000);
v_d2 varchar2(32767);
STMT varchar2(32767);
begin
v_file:=utl_file.fopen('GOWRI_DIR','copy_file2.txt','r');
if utl_file.is_open(v_file) then
loop
  begin
   utl_file.get_line(v_file,v_d1);
   if v_d1 is null then
   exit;
   end if;
   dbms_output.put_line(v_d1);
  insert into emp_viewss values(first_name,v_d1);
  end;
  end loop;
  end if;
 --  dbms_output.put_line(STMT);
--  eecute immediate STMT;
exception
when no_data_found then
utl_file.fclose(v_file);
end;
/



create table depss(departid number,departname varchar2(200));

declare
v_file utl_file.file_type;
type departs is table of departments%rowtype
index by binary_integer;
deps departs;
begin
v_file:=utl_file.fopen('GOWRI_DIR','copy_file2.txt','r');
loop
  begin
  select * bulk collect into deps from departments;
   utl_file.get_line(v_file,deps.department_id);
     dbms_output.put_line(v_file);
 -- insert into emp_viewss values(first_name,v_d1);
  end;
  end loop;
 --  dbms_output.put_line(STMT);
--  eecute immediate STMT;
exception
when no_data_found then
utl_file.fclose(v_file);
end;
/


