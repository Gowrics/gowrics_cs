DECLARE
v_a NUMBER:=1000;
v_b NUMBER:=2000;
v_c NUMBER;
BEGIN
v_c:=v_a+v_b;
dbms_output.put_line(v_c);
END;
/
set serveroutput on;
DECLARE
v_dp_acc NUMBER:=10000;
v_dp_fnc NUMBER:=25000;
v_tot NUMBER;
BEGIN
v_tot:=v_dp_acc+v_dp_fnc;
dbms_output.put_line('The total financial is'+v_tot   );
END;
/


DECLARE
v_ad CONSTANT NUMBER:=250;
v_emp_id NUMBER NOT NULL:=100;
v_dob DATE DEFAULT SYSDATE;
v_name VARCHAR2(30):=INITCAP('bala');
--v_dob DATE:= TO_DATE('02-05-99');
v_ddt1 DATE := SYSDATE;
v_ddt2 VARCHAR2(30) := TO_CHAR(SYSDATE,'dd/mon/yyyy');
v_ddt3 DATE := SYSDATE+10;
v_salary NUMBER:=20000;
v_null VARCHAR2(30);
v_space varchar2(30):=' ';
BEGIN
v_dob:= TO_DATE('12-06-89');
dbms_output.put_line('emp_ad:'||v_ad);
dbms_output.put_line('emp_id:'||v_emp_id);
dbms_output.put_line('name:'||v_name);
dbms_output.put_line('date of birth:'||v_dob);
dbms_output.put_line('salary:'||v_salary);
dbms_output.put_line('date:'||v_ddt1);
dbms_output.put_line('date1:'||v_ddt2);
dbms_output.put_line('date2:'||TO_CHAR(v_ddt3,'dd,month/yyyy'));
dbms_output.put_line('null:'||v_null);
dbms_output.put_line('null:'||NVL(v_null,0));
dbms_output.put_line('space:'||v_space);
dbms_output.put_line('space:'||NVL(v_space,0));
END;
/

DECLARE
v_tot NUMBER(10);
BEGIN
SELECT SUM(salary) INTO v_tot FROM employees;
dbms_output.put_line('sum uf salary:'||v_tot);
END;
/


DECLARE
v_emp_id NUMBER(10);
v_name VARCHAR2(30);
v_dept_id NUMBER(10);
v_salary NUMBER(10);
BEGIN
   SELECT employee_id,first_name,department_id,salary INTO v_emp_id,v_name,v_dept_id ,v_salary 
   FROM employees WHERE employee_id=100;
dbms_output.put_line(v_emp_id);
dbms_output.put_line(v_name);
dbms_output.put_line(v_dept_id);
dbms_output.put_line(v_salary);
END;
/



select substr('welcome to oracle plsql',instr('welcome to oracle plsql',' ',1,3)+1) from dual;













