   --hospital managment--
   
CREATE TABLE patient
            (
             pat_id VARCHAR2(10),
             pat_name VARCHAR2(60),
             pat_gender VARCHAR2(2),
             pat_address VARCHAR2(100),
             pat_number NUMBER(11,0),
             pat_doc_code VARCHAR2(10),
             CONSTRAINT pk_pid PRIMARY KEY(pat_id),
             CONSTRAINT uq_podccode UNIQUE (pat_doc_code)
             );
select * FROM patient;
```````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````;/
CREATE TABLE patient_diagnosis
                       (
                       diag_id VARCHAR2(10),
                       diag_details VARCHAR2(200),
                       diag_remarks VARCHAR2(200),
                       diag_date DATE,
                       pat_id VARCHAR2(10),
                       CONSTRAINT pk_diagid PRIMARY KEY (diag_id),
                       CONSTRAINT fk_pat_id FOREIGN KEY (pat_id)
                       REFERENCES patient(pat_id)
                       );
/``````````````````````````````````````````````````````````````````````````````````````/


CREATE TABLE doctor
                 (
                 doc_code VARCHAR2(10),
                 doc_name VARCHAR2(60),
                 doc_gender VARCHAR2(2),
                 doc_address VARCHAR2(200),
                 doc_designation VARCHAR2(30),
                 doc_number NUMBER (11,0),
                 CONSTRAINT pk_doccod PRIMARY KEY (doc_code),
                 CONSTRAINT fk_doccod FOREIGN KEY (doc_code)
                 REFERENCES patient(pat_doc_code)
                 );

/
`````````````````````````````````````````````````````````````````````````````````````/


CREATE TABLE bill
                (
                bill_no NUMBER,
                pat_id VARCHAR2(10),
                pat_name VARCHAR2(60),
                pat_gender VARCHAR2(2),
                pat_address VARCHAR2(100),
                doc_name VARCHAR2(60),
                amount NUMBER(19,9),
                CONSTRAINT pk_bill PRIMARY KEY (bill_no),
                CONSTRAINT fk_patid FOREIGN KEY (pat_id)
                REFERENCES patient (pat_id)
                );
                /
````````````````````````````````````````````````````````````````````````````````````````                
                
INSERT INTO PATIENT VALUES ('P001','Raghav Sharma','M','#33, Sec 22, Gurugram',1111111111,'D001');
INSERT INTO PATIENT VALUES ('P002','Shivam Kumar','M','#2789, Udhyog Vihar P-2, Gurugram',2222222222,'D004');
INSERT INTO PATIENT VALUES ('P003','Kiran','F','#3672, Sec 37D, Chandigarh',3333333333,'D003');
INSERT INTO PATIENT VALUES ('P004','Akshay Chauchan','M','#4534, Sec 57C, Delhi',4444444444,'D005');
INSERT INTO PATIENT VALUES ('P005','Karan Chaudary','M','Tamil Nadu',5555555555,'D002');
/
````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````/
--Patient_diagnosis ENTRIES:
INSERT INTO PATIENT_DIAGNOSIS VALUES ('DIAG001','Suffering from asthma','Need to use rescue inhalers',sysdate,'P001');
INSERT INTO PATIENT_DIAGNOSIS VALUES ('DIAG002','Suffering from heart diseases','Treatments vary widely and can include lifestyle changes, medication, surgery, stents, pacemakers and ablation.',sysdate,'P002');
INSERT INTO PATIENT_DIAGNOSIS VALUES ('DIAG003','Suffering from skin diseases','Use anti-fungal sprays/creams to treat the skin infection',sysdate,'P003');
INSERT INTO PATIENT_DIAGNOSIS VALUES ('DIAG004','Suffering from mouth diseases','Need to use pain relievers',sysdate,'P004');
INSERT INTO PATIENT_DIAGNOSIS VALUES ('DIAG005','Suffering from migrane','Avoid stress, improve sleep habit and have a balanced diet',sysdate,'P005');
/
``````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
--DOCTOR Entries:
INSERT INTO DOCTOR VALUES ('D001','Dr P R Goyal','M','H1/10, Hauz Khas, New Delhi, Delhi','Allergist',9810506571);
INSERT INTO DOCTOR VALUES ('D002','Dr Jagmeet Soin','M','94/4, GNH Hospital, Opposite Govt. Girls College, Near Sector 14, Gurugram, Haryana 122001','Cardiologist',8800188336);
INSERT INTO DOCTOR VALUES ('D003','Dr Priyanka Yadav','F','CLACS, GNH Hospital, MG Road, Opp. Govt Girls College, Anamika Enclave, Gurugram, Haryana 122001','Dermatologist',7042795770);
INSERT INTO DOCTOR VALUES ('D004','Dr Kaushal Yadav','M','Sector 14, Gurugram, Haryana','Oral Surgeon',8800188336);
INSERT INTO DOCTOR VALUES ('D005','Dr. Praveen Gupta','M','Fortis Memorial Research Institute sector 44,Opposite HUDA City Centre Metro Station,Gurugram,Haryana 122002','Neurologist',9990766036);
/
select * from doctor;
````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````/

CREATE SEQUENCE bill_no_seq
MINVALUE 1
MAXVALUE 100000
START WITH 1
INCREMENT BY 1;
/
````````````````````````````````````````````````````````````````````````````````````````````````/
CREATE OR REPLACE TRIGGER bill_trg
BEFORE INSERT ON bill
FOR EACH ROW
DECLARE
doc_id VARCHAR2(10);
BEGIN
IF :NEW.bill_no IS NULL THEN
 SELECT bill_no_seq.NEXTVAL INTO :NEW.bill_no FROM dual; 
END IF ;

IF :NEW.pat_name IS NULL THEN
 SELECT pat_name INTO :NEW.pat_name FROM patient WHERE pat_id=:NEW.pat_id; 
END IF ;


IF :NEW.pat_gender IS NULL THEN
 SELECT pat_gender INTO :NEW.pat_gender FROM patient WHERE pat_id=:NEW.pat_id; 
END IF ;


IF :NEW.pat_address IS NULL THEN
 SELECT pat_address INTO :NEW.pat_address FROM patient WHERE pat_id=:NEW.pat_id; 
END IF ;


IF :NEW.doc_name IS NULL THEN
 SELECT pat_doc_code INTO doc_id FROM patient WHERE pat_id=:NEW.pat_id;
 SELECT doc_name INTO :NEW.doc_name FROM doctor WHERE doc_code =doc_id;
END IF ;

END;
/
INSERT INTO bill(pat_id,amount) VALUES ('P001',3000.4);
INSERT INTO bill(pat_id,amount) VALUES ('P002',5000.5);
INSERT INTO bill(pat_id,amount) VALUES ('P003',2500.5);
INSERT INTO bill(pat_id,amount) VALUES ('P004',5000);
INSERT INTO bill(pat_id,amount) VALUES ('P005',16000.7);
select * from bill;
commit;

select * from bill;
select * from patient;
select * from doctor;
select * from PATIENT_DIAGNOSIS;

select * from bill;


select p.pat_name,d.doc_name,d.doc_designation from patient p,doctor d
WHERE p.pat_doc_code=d.doc_code;
