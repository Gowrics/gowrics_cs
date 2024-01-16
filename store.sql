create table stock_details(s_number number,product_name varchar2(50),buying_price number,selling_price number);
SELECT * FROM STOCK_DETAILS;
ALTER TABLE STOCK_DETAILS MODIFY S_NUMBER NUMBER PRIMARY KEY;
ALTER TABLE STOCK_DETAILS RENAME COLUMN S_NUMBER TO P_ID;

create sequence str_sno
start with 1
increment by 1
MINVALUE 1
maxvalue 100
nocycle;

create or replace procedure add_stock(p_name varchar2,buy_price number,sell_price number)
as
begin
insert into stock_details values (str_sno.nextval,p_name,buy_price,sell_price);
end;
/
EXEC add_stock('EVERYDAY NORMAL BULB 0W ',12,15);



