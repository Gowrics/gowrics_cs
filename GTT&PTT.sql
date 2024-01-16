%%%%%%%%%%%%%%%%%%%  GTT and PTT %%%%%%%%%%%%%%%%%%%%%

--GLOBAL TEMPORARY TABLE
 
 create global temporary table test_gtt(pid number,oname varchar2(30)) 
                    on commit delete rows;
 insert into test_gtt values(1,'prd1');
 insert into test_gtt values(2,'prd2');
 insert into test_gtt values(3,'prd3');
 insert into test_gtt values(4,'prd4');
--go to command prompt
select * from test_gtt;
commit;


 create private temporary table ora$ppt_tst_ptt(pid number,oname varchar2(30))
 on commit drop definition;


drop table test_gtt; purge; --cannot drop

 create global temporary table test_gtt(pid number,pname varchar2(30)) 
                    on commit preserve rows;

insert into test_gtt1 values(1,'prd1');
 insert into test_gtt1 values(2,'prd2');
 insert into test_gtt1 values(3,'prd3');
 insert into test_gtt1 values(4,'prd4');
 insert into test_gtt1 values(6,'prd4');

commit;
select * from test_gtt1;
                    
exit;
    set serveroutput on;
show parameter private_temp_table_prefix