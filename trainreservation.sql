>>>>>>>>>>>>>>>>>>>>CREATE TABLE<<<<<<<<<<<<<<<<<<<<
 
DROP TABLE train_details;
DROP TABLE reservation_seats;
DROP TABLE passanger_details;
DROP TABLE waiting_lists;
DROP TABLE booking_cancelled;

SELECT * FROM user_constraints WHERE table_name = 'TRAIN_DETAILS';


CREATE TABLE train_details(train_name CHAR(15) PRIMARY KEY,
                           total_seats NUMBER(3),
                           start_place VARCHAR2(30),
                           end_palce VARCHAR2(30),
                           start_time VARCHAR2(20), 
                           end_time VARCHAR2(20));
                         

CREATE TABLE reservation_seats( train_name CHAR(15) REFERENCES train_details(train_name),
                                seats NUMBER(3),
                                reserved_seats NUMBER(3),
                                available_seats NUMBER(3),
                                date_time VARCHAR2(20));
                                
                                
CREATE TABLE passanger_details(train_name CHAR(15)REFERENCES train_details(train_name),
                               passanger_id VARCHAR2(10),
                               passanger_name VARCHAR2(30),
                               passanger_aathar VARCHAR2(15) PRIMARY KEY,
                               seat_no NUMBER(3),
                               date_time VARCHAR2(20));

 
CREATE TABLE waiting_lists(train_name CHAR(15)REFERENCES train_details(train_name),
                               passanger_id VARCHAR2(10) PRIMARY KEY,
                               passanger_name VARCHAR2(30),
                               passanger_aathar VARCHAR2(15) UNIQUE,
                               waiting_list NUMBER(3),
                               date_time VARCHAR2(20));


CREATE TABLE booking_cancelled(train_name CHAR(15)REFERENCES train_details(train_name),
                               passanger_id VARCHAR2(10),
                               passanger_name VARCHAR2(30),
                               passanger_aathar VARCHAR2(15) PRIMARY KEY,
                               seat_no NUMBER(3),
                               date_time VARCHAR2(20));

CREATE TABLE railway_users( customer_name VARCHAR2(30),
                            aathar_no VARCHAR2(15) UNIQUE,
                            user_name VARCHAR2(30) ,
                            pass_word VARCHAR2(30) ,
                            CONSTRAINT userpass_pk PRIMARY KEY (user_name,pass_word));

create table registrations(user_name varchar2(10),aathar_no varchar2(10),email varchar2(10),pass_word varchar2(10));


SELECT * FROM railway_users;                           
COMMIT;
                        
 CREATE OR REPLACE PROCEDURE newuser_signup(c_name VARCHAR2,aathar_no VARCHAR2,user_name VARCHAR2,pass_word VARCHAR2)
 AS
 BEGIN
 INSERT INTO railway_users VALUES(c_name,aathar_no,user_name,pass_word);
 COMMIT;
 dbms_output.put_line('login successfully');
 END;
 /

EXEC newuser_signup('dhanya','099 088 021','dhanya_pathi','dhan@pg15');
 
            
CREATE OR REPLACE PROCEDURE user_login(uname VARCHAR2,pword VARCHAR2)
AS
P railway_users.pass_word%TYPE;
BEGIN
SELECT pass_word INTO P FROM railway_users
WHERE user_name =uname;
IF P =pword THEN
dbms_output.put_line('login successfully');
ELSE
dbms_output.put_line('incorrect password');
END IF;
EXCEPTION WHEN no_data_found 
THEN
 dbms_output.put_line('please click new user creation');
END;
/
EXEC  user_login('&username','&password')




--1 add train

CREATE OR REPLACE PACKAGE  addtrain_checkavailable_pkg
AS
PROCEDURE add_trn(tname CHAR,seats NUMBER,starting VARCHAR2,ending VARCHAR2,s_time VARCHAR2,e_time VARCHAR2);
PROCEDURE available_train; 
END;
/
CREATE OR REPLACE PACKAGE BODY addtrain_checkavailable_pkg
AS
PROCEDURE add_trn(tname CHAR,seats NUMBER,starting VARCHAR2,ending VARCHAR2,s_time VARCHAR2,e_time VARCHAR2)
IS
find NUMBER;
BEGIN
SELECT COUNT(*) INTO find FROM train_details
WHERE train_name =tname;
IF find = 0 THEN
INSERT INTO train_details VALUES(tname,seats,starting,ending,s_time,e_time);
FOR I IN 1..seats
LOOP
INSERT INTO reservation_seats VALUES(tname,I,0,NULL,to_char(sysdate,'ddth mon / hh:mm') );
END LOOP;
ELSE 
dbms_output.put_line('the train already in list');
END IF;
END;

PROCEDURE available_train 
IS
 train_name train_details.train_name%TYPE;
 available_tickets NUMBER(3); 
BEGIN
dbms_output.put_line('-------------------------------------------------------------------');
dbms_output.put_line('       train name         '||'     available seats         ');
dbms_output.put_line('-------------------------------------------------------------------');
FOR I IN (SELECT train_name, COUNT(train_name) availables INTO train_name,available_tickets FROM reservation_seats
          GROUP BY train_name,available_seats
          HAVING available_seats IS NULL)
LOOP
dbms_output.put_line(  I.train_name||'                   '||I.availables);
END LOOP;
END;
END;
/



EXEC addtrain_checkavailable_pkg.add_trn('KAVERI EXPRESS',5,'CHENNAI EG','PARAMAKUDI','9:00','22:00');
EXEC addtrain_checkavailable_pkg.add_trn('TAMILNADU EXP',4,'NEW DELHI','CHENNAI','6:00','23:00');
EXEC addtrain_checkavailable_pkg.add_trn('VAIGAI EXP',4,'PARAMAKUDI','CHENNAI','6:00','20:00');
EXEC addtrain_checkavailable_pkg.add_trn('PEARL EXP',6,'MADURAI','COIMBATURE','6:00','19:00');

EXEC addtrain_checkavailable_pkg.available_train;


SET SERVEROUTPUT ON;
--ticket booking 
---------------------------------------------
--seq for pass id create
DROP SEQUENCE ps_id;
CREATE SEQUENCE ps_id 
START WITH 10
MINVALUE 1
MAXVALUE 500
INCREMENT BY 1
NOCYCLE
NOCACHE;
/
------------------------------------------------- 


CREATE OR REPLACE PACKAGE booking_tckt
AS
FUNCTION waitmax(tr_name train_details.train_name%TYPE) RETURN NUMBER;
PROCEDURE psgr_booking(tr_name train_details.train_name%TYPE,passanger_name VARCHAR2,aathar VARCHAR2);
END;
/
--new 




CREATE OR REPLACE PACKAGE BODY booking_tckt
AS
FUNCTION waitmax(tr_name train_details.train_name%TYPE) ----function to create waiting number
RETURN NUMBER
IS
cnt NUMBER;
maxy NUMBER;
waiting_list NUMBER;
BEGIN
SELECT COUNT(train_name)availables INTO cnt FROM reservation_seats
WHERE available_seats IS NULL
AND train_name =tr_name;
--
SELECT MAX(waiting_list) INTO maxy FROM waiting_lists
WHERE train_name=tr_name;
--return maxy;
--return cnt;
IF cnt=0 THEN
   IF maxy IS NULL THEN
      waiting_list:=1;
   RETURN waiting_list;    
    ELSE
      waiting_list:=maxy + 1;
   RETURN waiting_list;
    END IF;
END IF;
END;

PROCEDURE psgr_booking(tr_name train_details.train_name%TYPE,passanger_name VARCHAR2,aathar VARCHAR2)
AS
alotseat NUMBER(4);
pid_out VARCHAR2(10);    --this is for passanger id so it must be a passanger datatype size ***
waitcnt NUMBER;
BEGIN
FOR I IN (SELECT train_name,seats FROM reservation_seats 
          WHERE train_name =tr_name
          AND available_seats IS NULL
          ORDER BY 1,2)
LOOP
alotseat:=I.seats;
EXIT;
END LOOP;                                                        --seatno get
pid_out:=200||substr(tr_name,1,3)||ps_id.NEXTVAL;                            --pass id creation
IF alotseat > 0 THEN
INSERT INTO passanger_details VALUES(tr_name,pid_out,passanger_name,aathar,alotseat,to_char(sysdate,'ddth mon / hh:mm'));
dbms_output.put_line('YOUR SEAT IS BOOKED..  ');
dbms_output.put_line('YOUR SEAT NUMBER : '||alotseat);
dbms_output.put_line('YOUR ID IS NUMBER : '||pid_out);
ELSE
waitcnt := waitmax(tr_name);
INSERT INTO waiting_lists VALUES(tr_name,pid_out,passanger_name,aathar,waitcnt,to_char(sysdate,'ddth mon / hh:mm')); -- waitmax func calling to waiting list.wait no : 3 
COMMIT;
dbms_output.put_line('YOUR ARE IN WAITING LIST ');
dbms_output.put_line('YOUR WAITING NUMBER : '||waitcnt); --we are calling fun anothor one time wait no :4 so this wrong
dbms_output.put_line('YOUR ID IS NUMBER : '||pid_out);
END IF;
END;
END;
/
SET SERVEROUTPUT ON;
------------------------------------------------------------------------------
EXEC booking_tckt.psgr_booking('KAVERI EXPRESS','dhanya','099 088 021');
EXEC booking_tckt.psgr_booking('KAVERI EXPRESS','pathi','649 088 021');
EXEC booking_tckt.psgr_booking('KAVERI EXPRESS','gowri','649 045 021');
EXEC booking_tckt.psgr_booking('KAVERI EXPRESS','vasantha','099 245 021');
EXEC booking_tckt.psgr_booking('KAVERI EXPRESS','puthalva','611 045 021');
EXEC booking_tckt.psgr_booking('KAVERI EXPRESS','vars','611 034 021');

EXEC booking_tckt.psgr_booking('TAMILNADU EXP','tahangaraj','611 034 011');
EXEC booking_tckt.psgr_booking('TAMILNADU EXP','malar','611 994 011');
EXEC booking_tckt.psgr_booking('TAMILNADU EXP','nadesh','600 034 011');
--------------------------------------------------------------------------------
CREATE OR REPLACE TYPE cancel_ty AS OBJECT( 
tname CHAR(15),
pid VARCHAR2(10),
pname VARCHAR2(30),
aathar VARCHAR2(15),
seat_no NUMBER(3)
);
/

CREATE OR REPLACE PACKAGE cancellation_procsess_pkg
AS
PROCEDURE waitingtobooking(tname passanger_details.train_name%TYPE);
PROCEDURE cancellation_tckt(psgr_id VARCHAR2);    --cancel tck
END;
/

CREATE OR REPLACE PACKAGE BODY cancellation_procsess_pkg
AS
PROCEDURE waitingtobooking(tname passanger_details.train_name%TYPE)
IS
wtname passanger_details.train_name%TYPE;
pid passanger_details.passanger_id%TYPE;
pname passanger_details.passanger_name%TYPE;
paathar passanger_details.passanger_aathar%TYPE;
w1 passanger_details.seat_no%TYPE;
tofillseat passanger_details.seat_no%TYPE;
datim passanger_details.date_time%TYPE;
BEGIN
SELECT train_name,passanger_id,passanger_name,passanger_aathar,waiting_list,date_time INTO wtname,pid,pname,paathar,w1,datim FROM waiting_lists
WHERE ROWID=( SELECT MIN(ROWID) FROM waiting_lists
              WHERE train_name=tname );


SELECT seats INTO tofillseat FROM reservation_seats
WHERE train_name =tname
AND available_seats IS NULL;

INSERT INTO passanger_details VALUES(wtname,pid,pname,paathar,tofillseat,datim);

DELETE FROM waiting_lists
WHERE passanger_id=pid;
END;
--------------------
PROCEDURE cancellation_tckt(psgr_id VARCHAR2)    --cancel tck
IS 
tname passanger_details.train_name%TYPE;
pid passanger_details.passanger_id%TYPE;
pname passanger_details.passanger_name%TYPE;
aathar passanger_details.passanger_aathar%TYPE;
seat_no passanger_details.seat_no%TYPE;
datim passanger_details.date_time%TYPE;

cnts NUMBER;
BEGIN
SELECT train_name,passanger_id,passanger_name,passanger_aathar,seat_no,date_time INTO tname,pid,pname,aathar,seat_no,datim 
FROM passanger_details  
WHERE passanger_id= psgr_id;                                                     -- get the details  

DELETE passanger_details                                                       --delete in passager tb
WHERE passanger_id = psgr_id; 

INSERT INTO booking_cancelled VALUES(tname,pid,pname,aathar,seat_no,datim);               --insert in cancel tb.
COMMIT;
dbms_output.put_line('YOUR TICKET WAS CANCELLED ');

SELECT COUNT(*) INTO cnts FROM reservation_seats
WHERE train_name =tname
AND available_seats IS NULL;

IF cnts =1  THEN
waitingtobooking(tname);
dbms_output.put_line('REPLACEMENT IS DONE............');
COMMIT;
END IF;
END;

END;
/

-------------------------------------------------------------------------------
EXEC cancellation_procsess_pkg.cancellation_tckt('200KAV26');
-------------------------------------------------------------------------------

SELECT * FROM train_details;
SELECT * FROM reservation_seats;
SELECT * FROM passanger_details;
--truncate table passanger_details;
SELECT * FROM waiting_lists;
SELECT * FROM booking_cancelled;


----------------------------------reservation seats update trigger




CREATE OR REPLACE TRIGGER resertick_trg
BEFORE INSERT OR DELETE ON passanger_details    --time before is correct for insert and delete
FOR EACH ROW
BEGIN
IF inserting THEN
UPDATE reservation_seats
SET available_seats =1
WHERE train_name=:NEW.train_name
AND seats=:NEW.seat_no;
END IF;
IF deleting THEN
UPDATE reservation_seats
SET available_seats =NULL
WHERE train_name=:OLD.train_name
AND seats=:OLD.seat_no;
END IF;
END;
/                                
---------------------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE get_inf_tck
AS
 CURSOR booking_inf IS 
 SELECT train_name,passanger_id,passanger_name,passanger_aathar,seat_no FROM passanger_details;
 CURSOR cancel_inf IS 
 SELECT  train_name,passanger_id,passanger_name,passanger_aathar,seat_no FROM booking_cancelled;
BEGIN
dbms_output.put_line('-----------------booking informarion--------------------------------------');
FOR I IN booking_inf
LOOP
dbms_output.put_line(rpad(I.train_name,3,' ')||rpad(I.passanger_id,9,' ')||rpad(I.passanger_name,15,' ')||rpad(I.passanger_aathar,12,' ')||rpad(I.seat_no,2,' '));
END LOOP;
dbms_output.put_line('------------------cancel information-------------------------------------------------');
FOR I IN cancel_inf
LOOP
dbms_output.put_line(rpad(I.train_name,3,' ')||rpad(I.passanger_id,9,' ')||rpad(I.passanger_name,15,' ')||rpad(I.passanger_aathar,12,' ')||rpad(I.seat_no,2,' '));
END LOOP;
dbms_output.put_line('------------------    end  -------------------------------------------------');
END;
/
----------------------------------------------------------------------
EXEC get_inf_tck;
---------------------------------------------------------------------

/

---fetch the ticekt details

CREATE OR REPLACE PROCEDURE passanger_information(psgr_no VARCHAR2)
AS
pcn NUMBER;
wcn NUMBER;
ccnt NUMBER;
tn passanger_details.train_name%TYPE;
pi passanger_details.passanger_id%TYPE;
pn passanger_details.passanger_name%TYPE;
pa passanger_details.passanger_aathar%TYPE;
sn passanger_details.seat_no%TYPE;
dt passanger_details.date_time%TYPE;
st train_details.start_time%TYPE;
et train_details.end_time%TYPE;
BEGIN
SELECT COUNT(*) INTO pcn FROM passanger_details
WHERE passanger_id=psgr_no;
SELECT COUNT(*) INTO wcn FROM waiting_lists
WHERE passanger_id=psgr_no;
SELECT COUNT(*) INTO ccnt FROM booking_cancelled
WHERE passanger_id=psgr_no;

IF pcn <> 0 THEN
SELECT train_name,passanger_id,passanger_name,passanger_aathar,seat_no,date_time INTO tn,pi,pn,pa,sn,dt FROM passanger_details
WHERE passanger_id=psgr_no;
dbms_output.put_line('----------------------------------------------------------------------------' );
dbms_output.put_line('TRAIN NAME        :'||tn||'DEPARTURE TIME   :'||st||'ARRIVAL TIME  :'||et );
dbms_output.put_line('----------------------------------------------------------------------------' );
dbms_output.put_line('YOUR TICKET DETAILS ARE  :' );
dbms_output.put_line('PASSANGER ID      :'||pi );
dbms_output.put_line('PASSANGER NAME    :'||pn);
dbms_output.put_line('PASSANGER AATHAR  :'||pa );
dbms_output.put_line('DATE TIME  :'||dt);
dbms_output.put_line('PASSANGER SEAT NO :'||sn );
dbms_output.put_line('----------------------------------------------------------------------------' );

ELSIF wcn <> 0 THEN
SELECT train_name,passanger_id,passanger_name,passanger_aathar,waiting_list,date_time INTO tn,pi,pn,pa,sn,dt FROM waiting_lists
WHERE passanger_id=psgr_no;
dbms_output.put_line('YOUR ARE IN WAITING LIST  :' );
dbms_output.put_line('PASSANGER ID      :'||pi );
dbms_output.put_line('PASSANGER NAME    :'||pn);
dbms_output.put_line('PASSANGER AATHAR  :'||pa );
dbms_output.put_line('WAITING NO :'||sn );

dbms_output.put_line('----------------------------------------------------------------------------' );

ELSIF ccnt <> 0 THEN
SELECT train_name,passanger_id,passanger_name,passanger_aathar,seat_no,date_time INTO tn,pi,pn,pa,sn,dt FROM booking_cancelled
WHERE passanger_id=psgr_no;
dbms_output.put_line('YOU ARE CANCELLED YOUR TICKET. ');
ELSE
dbms_output.put_line('PLEASE ENTER THE CORRECT ID .');
END IF;
SELECT start_time,end_time INTO  st,et FROM train_details
WHERE train_name=tn;
EXCEPTION
WHEN OTHERS THEN
dbms_output.put_line('PLEASE ENTER THE CORRECT ID .');
END;
/

EXEC passanger_information('200KAV22');

---fetch the ticekt details with ref cursor

CREATE OR REPLACE PROCEDURE passanger_inf_ref(psgr_no VARCHAR2)
AS
pcn NUMBER;
wcn NUMBER;
ccnt NUMBER;

passanger_inf sys_refcursor;
pass_info passanger_details%rowtype;
--pass_info passanger_details%rowtype;

BEGIN
SELECT COUNT(*) INTO pcn FROM passanger_details
WHERE passanger_id=psgr_no;
SELECT COUNT(*) INTO wcn FROM waiting_lists
WHERE passanger_id=psgr_no;
SELECT COUNT(*) INTO ccnt FROM booking_cancelled
WHERE passanger_id=psgr_no;
dbms_output.put_line('----------------------------------------------------------------------------' );
dbms_output.put_line('TRAIN NAME        :'||pass_info.train_name||'DEPARTURE TIME   :'||pass_info.date_time );
dbms_output.put_line('----------------------------------------------------------------------------' );

IF pcn <> 0 THEN
open passanger_inf for SELECT train_name,passanger_id,passanger_name,passanger_aathar,seat_no,date_time FROM passanger_details
WHERE passanger_id=psgr_no;
loop
fetch passanger_inf into pass_info;
exit when passanger_inf%notfound;
dbms_output.put_line('YOUR TICKET DETAILS ARE  :' );
dbms_output.put_line('PASSANGER ID      :'||pass_info.passanger_id );
dbms_output.put_line('PASSANGER NAME    :'||pass_info.passanger_name);
dbms_output.put_line('PASSANGER AATHAR  :'||pass_info.passanger_aathar );
dbms_output.put_line('DATE TIME  :'||pass_info.date_time);
dbms_output.put_line('PASSANGER SEAT NO :'||pass_info.seat_no );
dbms_output.put_line('----------------------------------------------------------------------------' );
close passanger_inf;
end loop;
end if;
end;
/
EXEC passanger_inf_ref('200KAV22');

ELSIF wcn <> 0 THEN
SELECT train_name,passanger_id,passanger_name,passanger_aathar,waiting_list,date_time INTO tn,pi,pn,pa,sn,dt FROM waiting_lists
WHERE passanger_id=psgr_no;
dbms_output.put_line('YOUR ARE IN WAITING LIST  :' );
dbms_output.put_line('PASSANGER ID      :'||pi );
dbms_output.put_line('PASSANGER NAME    :'||pn);
dbms_output.put_line('PASSANGER AATHAR  :'||pa );
dbms_output.put_line('WAITING NO :'||sn );

dbms_output.put_line('----------------------------------------------------------------------------' );

ELSIF ccnt <> 0 THEN
SELECT train_name,passanger_id,passanger_name,passanger_aathar,seat_no,date_time INTO tn,pi,pn,pa,sn,dt FROM booking_cancelled
WHERE passanger_id=psgr_no;
dbms_output.put_line('YOU ARE CANCELLED YOUR TICKET. ');
ELSE
dbms_output.put_line('PLEASE ENTER THE CORRECT ID .');
END IF;
SELECT start_time,end_time INTO  st,et FROM train_details
WHERE train_name=tn;
EXCEPTION
WHEN OTHERS THEN
dbms_output.put_line('PLEASE ENTER THE CORRECT ID .');
END;
/


--------------------not complete---------------


SELECT * FROM train_details;
SELECT * FROM reservation_seats;
SELECT * FROM passanger_details;
SELECT * FROM waiting_lists;
SELECT * FROM booking_cancelled;

UPDATE railway.train_details 
SET start_time ='8:00'
WHERE train_name='KAVERI EXPRESS';

GRANT SELECT ON train_detail TO hr;

select * from reservation_seats
where train_name='KAVERI EXPRESS';
--refcursor

declare 
seats_avail sys_refcursor;
reserv_seats reservation_seats%rowtype;
begin
open seats_avail for select * from reservation_seats
where train_name='VAIGAI EXP ';
loop
fetch seats_avail into reserv_seats;
exit when seats_avail%notfound;
dbms_output.put_line(reserv_seats.seats||'---'||nvl(reserv_seats.available_seats,0));
end loop;
end;
/


select  case train_name when 'KAVERI EXPRESS' then 
                               'Kav Exp'
                         when 'TAMILNADU EXP' then
                            'TN Exp'
                         when 'VAIGAI EXP' then
                            'VG Exp'
                         when 'PEARL EXP' then
                            'PRL Exp'
                         end case
from train_details;
     
/

declare 
cursor trainname is
select train_name from train_details
for update of train_name ;

cursor trainnames is
select train_name from reservation_seats
for update of train_name ;


begin
/*
for i in trainnames
loop
update  reservation_seats
set  train_name = case 
                                    when train_name='KAVERI EXPRESS' then 
                                         'Kav Exp'
                                    when train_name= 'TAMILNADU EXP' then
                                         'TN Exp'
                                    when train_name= 'VAIGAI EXP' then
                                         'VG Exp'
                                    when train_name='PEARL EXP' then
                                         'PRL Exp'
                                    else       
                                      'others'
                                    end 
 where current of trainnames;
 end loop;

*/

for i in trainname
loop
update train_details 
set  train_name = case 
                                    when train_name='KAVERI EXPRESS' then 
                                         'Kav Exp'
                                    when train_name= 'TAMILNADU EXP' then
                                         'TN Exp'
                                    when train_name= 'VAIGAI EXP' then
                                         'VG Exp'
                                    when train_name='PEARL EXP' then
                                         'PRL Exp'
                                    else       
                                      'others'
                                    end 
 where current of trainname;
 end loop;

end;
/

CREATE TABLE train_detail(train_name CHAR(15));
                         
drop table  train_detail;
insert into train_detail values('KAVERI EXPRESS');
insert into train_detail values('TAMILNADU EXP');
insert into train_detail values('VAIGAI EXP');
insert into train_detail values('PEARL EXP');
/
select * from train_detail;
declare 
cursor trainnames is
select train_name from train_detail
for update of train_name ;


begin
for i in trainnames
loop
update  train_detail
set  train_name = case 
                                    when train_name='KAVERI EXPRESS' then 
                                         'Kav Exp'
                                    when train_name= 'TAMILNADU EXP' then
                                         'TN Exp'
                                    when train_name= 'VAIGAI EXP' then
                                         'VG Exp'
                                    when train_name='PEARL EXP' then
                                         'PRL Exp'
                                    else       
                                      'others'
                                    end  -- end case error
 where current of trainnames;
 end loop;
end;
/
declare 
cursor trainnames is
select train_name from train_detail
for update of train_name ;


begin
for i in trainnames
loop
update  train_detail
set  train_name = decode( train_name , 
                                   'Kav Exp',
                                'KAVERI EXPRESS ',                                   
                                   'TN Exp',
                                'TAMILNADU EXP  ' ,
                                     'VG Exp',
                                 'VAIGAI EXP',
                                    'PRL Exp',      
                                  'PEARL EXP',
                                      'others'    )

                                      
 where current of trainnames;
 end loop;
end;
/


-----------------------------UTL FILE-------------------------------------------


create or replace procedure get_today_passanger_list
as
v_file utl_file.file_type;
cursor passangers is
select * from passanger_details ;
v_data varchar2(500);
begin
v_file :=utl_file.fopen('DIR_NAME','copy_emp.txt','w'); 
--v_file :=utl_file.fopen('DIR_NAME','copy_emp.csv','w'); --in tis method data insert one cell

for i in passangers 
loop
v_data:='train name   :'||rpad(i.train_name,15,' ')||'passanger_id  :'||rpad(i.passanger_id,9,' ')||'passanger aathar  :'||rpad(i.passanger_aathar,12,' ') ;
utl_file.put_line(v_file,v_data);
end loop;
utl_file.fclose(v_file);
end;
/

EXEC get_today_passanger_list;
