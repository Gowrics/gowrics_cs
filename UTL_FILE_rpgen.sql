--replace();

DROP TABLE rep_dtls_tb;

CREATE TABLE rep_dtls_tb
(
 rep_id       NUMBER
,ctry_cd      VARCHAR2(5)
,dir_name     VARCHAR2(15)
,file_name    VARCHAR2(100)
,file_date_ft VARCHAR2(15)
,ext          VARCHAR2(5)
,file_mode    CHAR
,delimtr      CHAR(5) 
,hdr_txt      VARCHAR2(50)
,hdr_dtfmt    VARCHAR2(50)
,ftr_txt      VARCHAR2(50)
,ftr_dtfmt    VARCHAR2(50)
,ftr_cnt_size NUMBER
,filled_with  VARCHAR2(2)
,hf_cnt_ind   CHAR
); 

select * FROM rep_dtls_tb;

INSERT INTO rep_dtls_tb(rep_id,ctry_cd,dir_name,file_name,
                        file_date_ft,ext,file_mode,  
                        delimtr,hdr_txt,hdr_dtfmt,
                        ftr_txt,ftr_dtfmt,ftr_cnt_size,
                        filled_with,hf_cnt_ind)  
 VALUES(1000,'IND','REPORT_DIR','ret_<ctr>sal_rep_<date>','DDMMYYYY','.txt',
    'w',',','HDR_<date>','DDMMYYYY','FTR_<date>','DDMMYYYY',5,0,'y');            


INSERT INTO rep_dtls_tb(rep_id,ctry_cd,dir_name,file_name,
                        file_date_ft,ext,file_mode,  
                        delimtr,hdr_txt,hdr_dtfmt,
                        ftr_txt,ftr_dtfmt,ftr_cnt_size,
                        filled_with,hf_cnt_ind)  
 VALUES(1001,'SIN','REPORT_DIR','ret_<ctr>sal_rep_<date>','DDMMYY','.txt',
    'w','',' HR_<date>','ddmmyy',' FR_<date>','ddmmyy',5,0,'y');            

INSERT INTO rep_dtls_tb(rep_id,ctry_cd,dir_name,file_name,
                        file_date_ft,ext,file_mode,  
                        delimtr,hdr_txt,hdr_dtfmt,
                        ftr_txt,ftr_dtfmt,ftr_cnt_size,
                        filled_with,hf_cnt_ind)  
 VALUES(1002,'HK','REPORT_DIR','ret_<ctr>sal_rep_<date>','MMYYYY','.txt',
    'w','~','H_<date>','mmyyyy',' F_<date>','mmyyyy',5,0,'y');            
COMMIT;

select * FROM all_directories;
-------------------------------------------------------------------
--BATCH CREATION--/



CREATE OR REPLACE PROCEDURE new_rep_gen_sp(p_rep_id IN NUMBER,
                                           p_ctry_cd IN VARCHAR2)
AS
  v_file UTL_FILE.FILE_TYPE;
  v_data VARCHAR2(200);
  v_h VARCHAR2(100);
  v_f VARCHAR2(100);
  v_count NUMBER:=0;
  v_rep_id        rep_dtls_tb.rep_id%TYPE;
  v_ctry_cd       rep_dtls_tb.ctry_cd%TYPE;
  v_dir_name      rep_dtls_tb.dir_name%TYPE;
  v_file_name     rep_dtls_tb.file_name%TYPE;
  v_file_date_ft  rep_dtls_tb.file_date_ft%TYPE;
  v_ext           rep_dtls_tb.ext%TYPE;
  v_file_mode     rep_dtls_tb.file_mode%TYPE;
  v_delimtr       rep_dtls_tb.delimtr%TYPE;
  v_hdr_txt       rep_dtls_tb.hdr_txt%TYPE;
  v_hdr_dtfmt     rep_dtls_tb.hdr_dtfmt%TYPE;
  v_ftr_txt       rep_dtls_tb.ftr_txt%TYPE;
  v_ftr_dtfmt     rep_dtls_tb.ftr_dtfmt%TYPE;
  v_ftr_cnt_size  rep_dtls_tb.ftr_cnt_size%TYPE;
  v_filled_with   rep_dtls_tb.filled_with%TYPE;
  v_hf_cnt_ind    rep_dtls_tb.hf_cnt_ind%TYPE;

CURSOR dep_c
IS
  SELECT department_id,department_name,manager_id,location_id
  FROM departments;

BEGIN
  
SELECT 
   dir_name    
  ,file_name   
  ,file_date_ft
  ,ext         
  ,file_mode   
  ,delimtr     
  ,hdr_txt     
  ,hdr_dtfmt   
  ,ftr_txt     
  ,ftr_dtfmt     
  ,ftr_cnt_size 
  ,filled_with 
  ,hf_cnt_ind  
INTO
  v_dir_name    
  ,v_file_name   
  ,v_file_date_ft
  ,v_ext         
  ,v_file_mode   
  ,v_delimtr     
  ,v_hdr_txt    
  ,v_hdr_dtfmt   
  ,v_ftr_txt     
  ,v_ftr_dtfmt   
  ,v_ftr_cnt_size
  ,v_filled_with 
  ,v_hf_cnt_ind  
FROM rep_dtls_tb rp
WHERE rp.rep_id=p_rep_id
AND rp.ctry_cd =p_ctry_cd;

v_file_name:=REPLACE(REPLACE(v_file_name,'<ctr>',p_ctry_cd),'<date>',TO_CHAR(SYSDATE,v_file_date_ft))||v_ext;

v_file:=UTL_FILE.FOPEN(v_dir_name,v_file_name,v_file_mode);


v_h:=REPLACE(v_hdr_txt,'<date>',TO_CHAR(sysdate,v_hdr_dtfmt));
utl_file.put_line(v_file,v_h);


FOR i IN dep_c
LOOP
v_count:=v_count+1;
IF v_delimtr IS NOT NULL THEN
DBMS_OUTPUT.PUT_LINE('inside if');
   v_data:=i.department_id ||v_delimtr||
           i.department_name ||v_delimtr||
           i.location_id;
DBMS_OUTPUT.PUT_LINE('inside if:'||v_data);

utl_file.put_line(v_file,v_data );

ELSE

DBMS_OUTPUT.PUT_LINE('inside else');

v_data:=  RPAD(i.department_id,3,'  ')
        ||RPAD(i.department_name,20,'  ')
        ||RPAD(i.manager_id,3,'X')
    --  ||RPAD(NVL(i.manager_id,'0'),3,' ')
        ||RPAD(i.location_id,4,'  ');
DBMS_OUTPUT.PUT_LINE('inside if:'||v_data);

utl_file.put_line(v_file,v_data );

END IF;

END LOOP;


v_f:=REPLACE(v_ftr_txt,'<date>',TO_CHAR(sysdate,v_ftr_dtfmt));
 
v_f:=v_f||LPAD(v_count,v_ftr_cnt_size,v_filled_with);

utl_file.put_line(v_file,v_f);

UTL_FILE.FCLOSE(v_file);
END new_rep_gen_sp;
/


EXEC new_rep_gen_sp(1002,'HK');

show error;


set serveroutput on;





