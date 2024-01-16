commit;


/* 
 Sonam Sinah 
 Project Bank Management System 
 Sinha_bank_tables.sql 
 */ 
  

 CREATE TABLE bk_branch 
 ( bk_branch_code     VARCHAR2(10)   NOT NULL, 
   Head_office     VARCHAR2(30)   NOT NULL, 
   bk_branch_details  VARCHAR2(50)   NOT NULL, 
   City_name       VARCHAR2(30)   NOT NULL, 
  
   CONSTRAINT bk_branch_pk PRIMARY KEY(bk_branch_code) 
 ); 
  
 CREATE TABLE customers 
 ( customer_id   NUMBER(10)    NOT NULL, 
   First_name    VARCHAR2(50)  NOT NULL, 
   Last_name    VARCHAR2(50), 
   Birth_date    VARCHAR2(12)  NOT NULL, 
   Street_number  VARCHAR2(30)  NOT NULL, 
   Street_name   VARCHAR2(30)  NOT NULL, 
   Unit          VARCHAR2(10), 
   City      VARCHAR2(30)  NOT NULL, 
   State       CHAR(4)       NOT NULL, 
   Zip_code    NUMBER(10)    NOT NULL, 
   Email_id   VARCHAR2(40)  NOT NULL, 
   Social_security_number NUMBER(12)    NOT NULL, 
   bk_branch_code     VARCHAR2(10)  NOT NULL, 
   Credit_card     CHAR(5), 
   Loan         CHAR(5), 
  
   CONSTRAINT customers_pk PRIMARY KEY(customer_id), 
   CONSTRAINT customers_fk_bk_branch FOREIGN KEY(bk_branch_code) REFERENCES bk_branch(bk_branch_code)  
 ); 
  
  
 CREATE TABLE customer_phone 
 ( phone_number    VARCHAR2(20)  NOT NULL, 
   Customer_id     NUMBER(10)    NOT NULL, 
   Phone_type      VARCHAR2(30)  NOT NULL, 
  
   CONSTRAINT customer_phone_pk PRIMARY KEY(phone_number,customer_id), 
   CONSTRAINT customer_phone_fk_customers FOREIGN KEY(customer_id) REFERENCES 
               Customers(customer_id) 
 ); 
  
  
 CREATE TABLE accounts 
 ( account_number                        NUMBER(12)    NOT NULL, 
   Customer_id                           NUMBER(10)    NOT NULL, 
   Account_balance                       NUMBER(10,2)  NOT NULL, 
   Account_type                                    VARCHAR2(10)  NOT NULL, 
   Account_type_description                VARCHAR2(50)  NOT NULL, 
  
   CONSTRAINT accounts_pk PRIMARY KEY(account_number), 
   CONSTRAINT accounts_fk_customers FOREIGN KEY(customer_id) REFERENCES  
                 Customers(customer_id) 
 ); 
  
  
  CREATE TABLE credit_cards 
  ( 
          Credit_card_number NUMBER(16)  NOT NULL, 
          Credit_limit  NUMBER(6,2)  NOT NULL CHECK(credit_limit>= 500.00 AND credit_limit<= 5000.00), 
          Amount_spent NUMBER(6,2)NOT NULL, 
          Bill_payment_due_date DATE  NOT NULL, 
          Minimum_payment NUMBER(6,2)  NOT NULL CHECK(minimum_payment>=25.00 AND minimum_payment<=50.00), 
          Customer_id  NUMBER(10) NOT NULL, 

          CONSTRAINT credit_cards_pk PRIMARY KEY(credit_card_number), 
           CONSTRAINT credit_cards_fk_customers FOREIGN KEY(customer_id)REFERENCES 
               Customers(customer_id) 
  ); 
  
  
  CREATE TABLE loans 
  ( 
          Loan_number  NUMBER(12) NOT NULL, 
          Loan_amount  NUMBER(10,2)  NOT NULL   CHECK(loan_amount>=1000.00 AND loan_amount< 99999.00), 
          Loan_type    VARCHAR2(30) NOT NULL, 
          Loan_duration_months NUMBER(4) NOT NULL, 
          Interest_rate  NUMBER(4,2) NOT NULL CHECK(interest_rate> 00.00 AND interest_rate< 50.00), 
          Monthly_payment_due_date  NUMBER(2)  NOT NULL CHECK(monthly_payment_due_date>=01 AND monthly_payment_due_date<=31), 
          Monthly_minimum_payment  NUMBER(10,2) NOT NULL, 
          Payment_method  VARCHAR2(20)  NOT NULL, 
          Customer_id  NUMBER(10)  NOT NULL, 
          
          CONSTRAINT loans_pk PRIMARY KEY(loan_number), 
           CONSTRAINT loans_fk_customers FOREIGN KEY(customer_id)REFERENCES 
               Customers(customer_id) 
  );


select * from loans;
select * from credit_cards;
select * from customer_phone;
select * from accounts;
select * from customers;
select * from bk_branch;


/*Sonam Sinah 
 Project Bank Management System 
 Sinha_bank_data.sql*/ 
  
--	bk_branch TABLE DATA 
 INSERT INTO bk_branch(bk_branch_code, head_office,bk_branch_details,city_name) 
 VALUES ('UTSV008', 'Provo, Utah', 'Commercial','Springville'); 
  
 INSERT INTO bk_branch(bk_branch_code, head_office,bk_branch_details,city_name) 
 VALUES ('ARPH125', 'Phoenix, Arizona', 'Commercial','Phoenix'); 
  
 INSERT INTO bk_branch(bk_branch_code, head_office,bk_branch_details,city_name) 
 VALUES ('ILAH135', 'Chicago, Illinois', 'Private','Arlington Heights'); 
  
 INSERT INTO bk_branch(bk_branch_code, head_office,bk_branch_details,city_name) 
 VALUES ('NYHD118', 'Madison, New York', 'Commercial','Hudson'); 
  
 INSERT INTO bk_branch(bk_branch_code, head_office,bk_branch_details,city_name) 
 VALUES ('WILG117', 'Madison, Wisconsin', 'Commercial','Lake Geneva'); 
  
 INSERT INTO bk_branch(bk_branch_code, head_office,bk_branch_details,city_name) 
 VALUES ('INFV094', 'Louisville, Indiana', 'Commercial','Fort Wayne'); 
  
 INSERT INTO bk_branch(bk_branch_code, head_office,bk_branch_details,city_name) 
 VALUES ('INBG108', 'Louisville, Indiana', 'Commercial','Bloomington'); 
  
 INSERT INTO bk_branch(bk_branch_code, head_office,bk_branch_details,city_name) 
 VALUES ('ILSH008', 'Chicago, Illinois', 'Commercial','Schaumburg'); 
  
?	CUSTOMER TABLE DATA 
  
 INSERT INTO customers(customer_id,  
                       First_name,  
                       Last_name, 
                       Birth_date, 
                       Street_number,  
                       Street_name,  
                       Unit, 
                       City, 
                       State, 
                       Zip_code,  
                       Email_id,  
                       Social_security_number,  
                       bk_branch_code, 
                       Credit_card, 
                       Loan) 
 VALUES               (11010, 
                       'Rick', 
                       'Smith', 
                       '09/05/1989', 
                       'GL65', 
                       'Saint Ave.', 
                        NULL, 
                       'Springville', 
                       'UT', 
                       84663, 
                       'nick@gmail.com', 
                       669521008, 
                       'UTSV008', 
                       'Yes', 
                       NULL);  
  
 INSERT INTO customers(customer_id,  
                       First_name,  
                       Last_name, 
                       Birth_date, 
                       Street_number,  
                       Street_name,  
                       Unit, 
                       City, 
                       State, 
                       Zip_code,  
                       Email_id,  
                       Social_security_number,  
                       bk_branch_code, 
                       Credit_card, 
                       Loan) 
 VALUES                ( 11011, 
                         'Sam', 
                         'Mill', 
                         '05/09/1981', 
                         '9871', 
                         'Churchchill', 
                         261, 
                         'Phoenix', 
                         'AZ', 
                         51132, 
                         'smill@aol.com', 
                         897661310, 
                         'ARPH125', 
                         NULL, 
                         NULL); 
  
 INSERT INTO customers(customer_id,  
                       First_name,  
                       Last_name, 
                       Birth_date, 
                       Street_number,  
                       Street_name,  
                       Unit, 
                       City, 
                       State, 
                       Zip_code,  
                       Email_id,  
                       Social_security_number,  
                       bk_branch_code, 
                       Credit_card, 
                       Loan) 
 VALUES                ( 11012, 
                         'Rich', 
                         'Malcom', 
                         '11/11/1981', 
                         '4531', 
                         'Kim Street', 
                         136, 
                         'Arlington Heights', 
                         'IL', 
                         60510, 
                         'richm@yahoo.com', 
                         601993210, 
                         'ILAH135', 
                         'Yes', 
                         'Yes'); 
  
 INSERT INTO customers(customer_id,  
                       First_name,  
                       Last_name, 
                       Birth_date, 
                       Street_number,  
                       Street_name,  
                       Unit, 
                       City, 
                       State, 
                       Zip_code,  
                       Email_id,  
                       Social_security_number,  
                       bk_branch_code, 
                       Credit_card, 
                       Loan) 
 VALUES                ( 11013, 
                         'Kathy', 
                         'Meyer', 
                         '06/11/1991', 
                         'TL65', 
                         'King Street', 
                         240, 
                         'Hudson', 
                         'NY', 
                         73740, 
                         'kmalcom@gmail.com', 
                         611234861, 
                         'NYHD118', 
                         'Yes', 
                         'Yes'); 
  
 INSERT INTO customers(customer_id,  
                       First_name,  
                       Last_name, 
                       Birth_date, 
                       Street_number,  
                       Street_name,  
                       Unit, 
                       City, 
                       State, 
                       Zip_code,  
                       Email_id,  
                       Social_security_number,  
                       bk_branch_code, 
                       Credit_card, 
                       Loan) 
 VALUES                ( 11014, 
                         'Alex', 
                         'Baker', 
                         '12/01/1875', 
                         '1426', 
                         'South Wolf Raod', 
                          NULL, 
                         'Fort Wayne', 
                         'IN', 
                         46074, 
                         'alexb@gmail.com', 
                         800188021, 
                         'INFV094', 
                         'Yes', 
                         'Yes'); 
  
 INSERT INTO customers(customer_id,  
                       First_name,  
                       Last_name, 
                       Birth_date, 
                       Street_number,  
                       Street_name,  
                       Unit, 
                       City, 
                       State, 
                       Zip_code,  
                       Email_id,  
                       Social_security_number,  
                       bk_branch_code, 
                       Credit_card, 
                       Loan) 
 VALUES                ( 11015, 
                         'Alisha', 
                         'Nanda', 
                         '12/02/1990', 
                         '1435', 
                         'Parker Street', 
                         NULL, 
                         'Schaumburg', 
                         'IL', 
                         67012, 
                         'al_nanda@gmail.com', 
                         788518821, 
                         'ILSH008', 
                         'Yes', 
                         'Yes'); 
  
 INSERT INTO customers(customer_id,  
                       First_name,  
                       Last_name, 
                       Birth_date, 
                       Street_number,  
                       Street_name,  
                       Unit, 
                       City, 
                       State, 
                       Zip_code,  
                       Email_id,  
                       Social_security_number,  
                       bk_branch_code, 
                       Credit_card, 
                       Loan) 
 VALUES                ( 11016, 
                         'Alia', 
                         'Bright', 
                         '22/03/1991', 
                         '1635', 
                         'Park Street', 
                         NULL, 
                         'Schaumburg', 
                         'IL', 
                         60562, 
                         'alia@gmail.com', 
                         619812188, 
                         'ILSH008', 
                         NULL, 
                         'Yes'); 
 INSERT INTO customers(customer_id,  
                       First_name,  
                       Last_name, 
                       Birth_date, 
                       Street_number,  
                       Street_name,  
                       Unit, 
                       City, 
                       State, 
                       Zip_code,  
                       Email_id,  
                       Social_security_number,  
                       bk_branch_code, 
                       Credit_card, 
                       Loan) 
 VALUES                ( 11017, 
                         'Shawn', 
                          'White', 
                         '08/02/1990', 
                         '1715', 
                         'Bell Street', 
                         NULL, 
                         'Schaumburg', 
                         'IL', 
                         60560, 
                         'shawn1@gmail.com', 
                         736381313, 
                         'ILSH008', 
                         NULL, 
                         NULL); 
  
 INSERT INTO customers(customer_id,  
                       First_name,  
                       Last_name, 
                       Birth_date, 
                       Street_number,  
                       Street_name,  
                       Unit, 
                       City, 
                       State, 
                       Zip_code,  
                       Email_id,  
                       Social_security_number,  
                       bk_branch_code, 
                       Credit_card, 
                       Loan) 
 VALUES                ( 11018, 
                         'Shaan', 
                          NULL, 
                         '08/03/1990', 
                         '3115', 
                         'River Lane', 
                         NULL, 
                         'Lake Geneva', 
                         'WI', 
                         54423, 
                         's2g@gmail.com', 
                         657063812, 
                         'WILG117', 
                          NULL, 
                         NULL); 
  
  
 INSERT INTO customers(customer_id,  
                       First_name,  
                       Last_name, 
                       Birth_date, 
                       Street_number,  
                       Street_name,  
                       Unit, 
                       City, 
                       State, 
                       Zip_code,  
                       Email_id,  
                       Social_security_number,  
                       bk_branch_code, 
                       Credit_card, 
                       Loan) 
 VALUES                ( 11019, 
                         'Vincent', 
                          NULL, 
                         '06/08/1989', 
                         '1542', 
                         'Blue Avenue', 
                         267, 
                         'Bloomington', 
                         'IN', 
                         45310, 
                         'vin2@gmail.com', 
                         880638121, 
                         'INBG108', 
                         NULL, 
                         NULL); 
  
 INSERT INTO customers(customer_id,  
                       First_name,  
                       Last_name, 
                       Birth_date, 
                       Street_number,  
                       Street_name,  
                       Unit, 
                       City, 
                       State, 
                       Zip_code,  
                       Email_id,  
                       Social_security_number,  
                       bk_branch_code, 
                       Credit_card, 
                       Loan) 
 VALUES                (11020, 
                        'Vicky', 
                        NULL, 
                        '05/08/1987', 
                        1451, 
                        'Windsor Avenue', 
                        384, 
                        'Bloomington', 
                        'IN', 
                        46235, 
                        'vicky123@gmail.com', 
                        620638841, 
                        'INBG108', 
                        'Yes', 
                        'Yes'); 
  
 --CUSTOMER PHONE TABLE DATA 
 INSERT INTO customer_phone(phone_number,customer_id,phone_type) 
 VALUES('8018953214', 11010,'Cell Phone'); 
  
 INSERT INTO customer_phone(phone_number,customer_id,phone_type) 
 VALUES('8019874632', 11010,'Home Phone'); 
  
 INSERT INTO customer_phone(phone_number,customer_id,phone_type) 
 VALUES('6027461132', 11011,'Cell Phone'); 
  
 INSERT INTO customer_phone(phone_number,customer_id,phone_type) 
 VALUES('6021136878', 11011,'Home Phone'); 
  
 INSERT INTO customer_phone(phone_number,customer_id,phone_type) 
 VALUES('2246329874', 11012, 'Cell Phone'); 
  
 INSERT INTO customer_phone(phone_number,customer_id,phone_type) 
 VALUES('3129321651', 11012, 'Home Phone'); 
  
 INSERT INTO customer_phone(phone_number,customer_id,phone_type) 
 VALUES('9179114876', 11013,'Cell Phone'); 
  
 INSERT INTO customer_phone(phone_number,customer_id,phone_type) 
 VALUES('9170365632', 11013, 'Cell Phone'); 
  
 INSERT INTO customer_phone(phone_number,customer_id,phone_type) 
 VALUES('3177461321', 11014, 'Cell Phone'); 
  
 INSERT INTO customer_phone(phone_number,customer_id,phone_type) 
 VALUES('2249874622', 11015,'Cell Phone'); 
  
 INSERT INTO customer_phone(phone_number,customer_id,phone_type) 
 VALUES('3129874166', 11016,'Cell Phone'); 
  
 INSERT INTO customer_phone(phone_number,customer_id,phone_type) 
 VALUES('2248763122', 11017,'Cell Phone'); 
  
 INSERT INTO customer_phone(phone_number,customer_id,phone_type) 
 VALUES('6549871362', 11017,'Cell Phone'); 
  
 INSERT INTO customer_phone(phone_number,customer_id,phone_type) 
 VALUES('2629874622', 11018,'Cell Phone'); 
  
 INSERT INTO customer_phone(phone_number,customer_id,phone_type) 
 VALUES('3179874568', 11019,'Cell Phone'); 
  
 INSERT INTO customer_phone(phone_number,customer_id,phone_type) 
 VALUES('3179874982', 11019,'Cell Phone'); 
  
 INSERT INTO customer_phone(phone_number,customer_id,phone_type) 
 VALUES('3159876826', 11020,'Cell Phone'); 
  
  
?	ACCOUNTS TABLE DATA 
 INSERT INTO accounts(account_number, customer_id, account_balance,account_type,account_type_description) 
 VALUES(3982276530,11010,5000.00,'CHECKING','CHECKING ACCOUNT'); 
  
 INSERT INTO accounts(account_number, customer_id, account_balance,account_type,account_type_description) 
 VALUES(8902345125,11010, 60000.00,'SAVINGS','SAVINGS ACCOUNT'); 
  
 INSERT INTO accounts(account_number, customer_id, account_balance,account_type,account_type_description) 
 VALUES(9871702287, 11011,69999.70, 'MMA', 'MONEY MARKET ACCOUNT'); 
  
 INSERT INTO accounts(account_number, customer_id, account_balance,account_type,account_type_description) 
 VALUES(4345010261, 11012, 75000.00,'CD','CERTIFICATE OF DEPOSIT ACCOUNT'); 
  
 INSERT INTO accounts(account_number, customer_id, account_balance,account_type,account_type_description) 
 VALUES(9124003568, 11012, 50000.00, 'SAVINGS', 'SAVINGS ACCOUNT'); 
  
 INSERT INTO accounts(account_number, customer_id, account_balance,account_type,account_type_description) 
 VALUES(5189201392, 11013, 85000.00, 'SAVINGS','SAVINGS ACCOUNT'); 
  
 INSERT INTO accounts(account_number, customer_id, account_balance,account_type,account_type_description) 
 VALUES(8001939743, 11014, 15000.00, 'IRA', 'INDIVIDUAL RETIREMENT ACCOUNT'); 
  
 INSERT INTO accounts(account_number, customer_id, account_balance,account_type,account_type_description) 
 VALUES(6829743045, 11015, 65000.00,'SAVINGS', 'SAVINGS ACCOUNT'); 
  
 INSERT INTO accounts(account_number, customer_id, account_balance,account_type,account_type_description) 
 VALUES(8028492955, 11016, 6500.00, 'CHECKING', 'CHECKING ACCOUNT'); 
  
 INSERT INTO accounts(account_number, customer_id, account_balance,account_type,account_type_description) 
 VALUES(8027649295, 11016, 40000.00, 'SAVINGS', 'SAVINGS ACCOUNT'); 
  
 INSERT INTO accounts(account_number, customer_id, account_balance,account_type,account_type_description) 
 VALUES(8175492955, 11017, 8500.00, 'CHECKING', 'CHECKING ACCOUNT'); 
  
 INSERT INTO accounts(account_number, customer_id, account_balance,account_type,account_type_description) 
 VALUES(8028406355, 11017, 6500.00, 'SAVINGS', 'SAVINGS ACCOUNT'); 
  
 INSERT INTO accounts(account_number, customer_id, account_balance,account_type,account_type_description) 
 VALUES(8020292942, 11018, 20000.00, 'SAVINGS', 'SAVINGS ACCOUNT'); 
  
 INSERT INTO accounts(account_number, customer_id, account_balance,account_type,account_type_description) 
 VALUES(7377332955, 11019, 30000.00, 'SAVINGS', 'SAVINGS ACCOUNT'); 
  
 INSERT INTO accounts(account_number, customer_id, account_balance,account_type,account_type_description) 
 VALUES(8476322975,11020,2000,'CHECKING','CHECKING ACCOUNT'); 
  
?	CREDIT CARDs TABLE DATA 
  
 INSERT INTO credit_cards(credit_card_number, credit_limit, amount_spent, bill_payment_due_date, minimum_payment, customer_id) 
 VALUES(3714496353984371,3000.00, 900.00, '08-APR-15',25.00, 11010); 
  
 INSERT INTO credit_cards(credit_card_number, credit_limit, amount_spent, bill_payment_due_date, minimum_payment, customer_id) 
 VALUES(3643893643893654, 2000.00, 1050.00, '10-APR-15', 40.00, 11012); 
  
 INSERT INTO credit_cards(credit_card_number, credit_limit, amount_spent, bill_payment_due_date, minimum_payment, customer_id) 
 VALUES(6011016011016011, 1000.00, 500.00, '15-APR-15', 25.00,11013); 
  
 INSERT INTO credit_cards(credit_card_number, credit_limit, amount_spent, bill_payment_due_date, minimum_payment, customer_id) 
 VALUES(3611036110361276, 3500.00, 1000.00, '20-APR-15', 25.00,11014); 
  
 INSERT INTO credit_cards(credit_card_number, credit_limit, amount_spent, bill_payment_due_date, minimum_payment, customer_id) 
 VALUES(3611064749361281, 2000.00, 1060.00, '30-APR-15', 46.89, 11015 ); 
  
 INSERT INTO credit_cards(credit_card_number, credit_limit, amount_spent, bill_payment_due_date, minimum_payment, customer_id) 
 VALUES(4562036780362678, 2000.00, 1300.00,'27-APR-15',25.00,11020); 
  
?	LOANS TABLE DATA 
  
 INSERT INTO loans(loan_number, loan_amount, loan_type, loan_duration_months, interest_rate, monthly_payment_due_date, 
                                  Monthly_minimum_payment, payment_method,customer_id) 
 VALUES(44689319,10000.00, 'Car loan', 72, 0.03, 12,200.00, 'Cheque', 11012); 
  
 INSERT INTO loans(loan_number, loan_amount, loan_type, loan_duration_months, interest_rate, monthly_payment_due_date, 
                                  Monthly_minimum_payment, payment_method,customer_id) 
 VALUES(77489838, 15000.00, 'Personal loan', 60, 0.06, 15, 500.00, 'Cheque',11013); 
  
 INSERT INTO loans(loan_number, loan_amount, loan_type, loan_duration_months, interest_rate, monthly_payment_due_date, 
                                  Monthly_minimum_payment, payment_method,customer_id) 
 VALUES(63892734, 8000.00, 'Personal loan', 30, 0.07, 16, 600.00, 'Credit card', 11014); 
  
 INSERT INTO loans(loan_number, loan_amount, loan_type, loan_duration_months, interest_rate, monthly_payment_due_date, 
                                  Monthly_minimum_payment, payment_method,customer_id) 
 VALUES(62860134, 5000.00, 'Car loan', 12, 0.04, 28, 300.00, 'Credit card', 11014); 
  
 INSERT INTO loans(loan_number, loan_amount, loan_type, loan_duration_months, interest_rate, monthly_payment_due_date, 
                                  Monthly_minimum_payment, payment_method,customer_id) 
 VALUES(78363489, 50000.00, 'Mortgage loan', 150, 0.06, 6, 500.00, 'Cheque', 11015); 
  
 INSERT INTO loans(loan_number, loan_amount, loan_type, loan_duration_months, interest_rate, monthly_payment_due_date, 
                                  Monthly_minimum_payment, payment_method,customer_id) 
 VALUES(18467484, 5000.00, 'Personal loan', 12, 0.07, 2, 350, 'Credit card', 11016); 
  
 INSERT INTO loans(loan_number, loan_amount, loan_type, loan_duration_months, interest_rate, monthly_payment_due_date, 
                                  Monthly_minimum_payment, payment_method,customer_id) 
 VALUES(67417448, 3000.00, 'Personal loan', 17, 0.08, 2, 350, 'Credit card', 11020); 
 
 
 
commit;

 SELECT first_name||' '|| last_name AS customer_name , c.customer_id, loan_number, 
         Loan_amount,loan_type
 FROM customers c ,loans l,bk_branch b
 where c.customer_id = l.customer_id
 and c.bk_branch_code = b.bk_branch_code
and loan_amount >10000
and loan_duration_months > 60;



select * from loans;
select * from credit_cards;
select * from customer_phone;
select * from accounts;
select * from customers;
select * from bk_branch;


/*  Query 1  
 Write a query that returns customer name, customer_id, loan_number,loan_amount, 
 Loan_type from the customers and accounts table.The result set should contain  
 Customers associated with a bk_branch that have a loan against them with an amount 
 Of greater than 10,000 and a loan duration of more than 60 months. 
 */ 
--me
 SELECT first_name||' '|| last_name AS customer_name , c.customer_id, loan_number, 
         Loan_amount,loan_type
 FROM customers c ,loans l,bk_branch b
 where c.customer_id = l.customer_id
 and c.bk_branch_code = b.bk_branch_code
and loan_amount >10000
and loan_duration_months > 60;

 SELECT first_name||' '|| last_name AS customer_name , c.customer_id, loan_number, 
         Loan_amount,loan_type, b.bk_branch_code 
 FROM customers c  
   JOIN loans l ON 
    c.customer_id= l.customer_id 
    JOIN bk_branch b ON 
    c.bk_branch_code= b.bk_branch_code 
 WHERE loan_amount > 10000 
       AND loan_duration_months > 60; 
 /* 
 Query 1 Output- 
 CUSTOMER_NAME        CUSTOMER_ID                LOAN_NUMBER                LOAN_AMOUNT                LOAN_TYPE              bk_branch_CODE 
 Alisha Nanda        11015                     78363489            50000                           Mortgage loan          ILSH008 
  
 */ 
  
 /*  Query 2 
 Get the different types of accounts that have been opened up by customers at the 
 Bank. Also get the maximum balance with respect to each of the account types and 
 The customer details with respect to those accounts. 
 */ 
 
 --me
select c.customer_id,first_name,email_id,account_type,account_number from accounts a,customers c
where c.customer_id = a.customer_id
and account_balance IN (
                        select max(account_balance) from accounts
                        group by account_type
                        );


 SELECT cc.customer_id, cc.first_name, cc.last_name, acc.account_balance, 
 Acc.account_number,acc.account_type 
 FROM accounts acc, customers cc  
 WHERE account_balance IN ( 
                           SELECT MAX(a.account_balance) as max_balance 
                           FROM accounts a  
                           GROUP BY a.account_type)  
           AND cc.customer_id = acc.customer_id; 
 /* 
 Query2 Output- 
 CUSTOMER_ID        FIRST_NAME        LAST_NAME         ACCOUNT_BALANCE        ACCOUNT_NUMBER        ACCOUNT_TYPE 
 11017              Shawn              White             8500                          8175492955                CHECKING 
 11013              Kathy              Meyer             85000                         5189201392                SAVINGS 
 11011              Sam              Mill             69999.7                     9871702287                MMA 
 11012              Rich              Malcom         75000                         4345010261                CD 
 11014              Alex              Baker             15000                        8001939743                IRA 
  
 */           
  
  
 /* 
 QUERY 3 
 Write a query that returns a list of customers that have taken  
 Two or more loans from the bank. 
 */
 

 --me
 select customer_id,loan_number,loan_amount 
 from loans 
 where customer_id= ( 
                    select customer_id from loans
                    group by customer_id
                    having count(*) >1
                    );
 
 SELECT  c.customer_id,  first_name, last_name, COUNT(loan_number)AS  
       Total_number_of_loans 
 FROM customers c  
       JOIN loans l ON 
       c.customer_id = l.customer_id 
 GROUP BY  c.customer_id, first_name,last_name 
 HAVING COUNT(loan_number)>=2 
 ORDER BY c.customer_id; 
 /* 
 Query 3 Output- 
 CUSTOMER_ID        FIRST_NAME        LAST_NAME              TOTAL_NUMBER_OF_LOANS 
 11014              Alex              Baker                  2 
 */ 
  
select * from loans;
select * from credit_cards;
select * from customer_phone;
select * from accounts;
select * from customers;
select * from bk_branch;

 /* 
 QUERY 4 
 Write a query that returns bk_branch_code, customer_id, customer_name, 
 City and state for the bk_branches that are not in Utah(UT) and Arizona(AZ). 
 */ 
--me
select customer_id,first_name,city,state,b.bk_branch_code 
from customers c,bk_branch b
where c.bk_branch_code=b.bk_branch_code
and c.state NOT IN ('UT','AZ');


 SELECT b.bk_branch_code, customer_id,first_name||' '|| last_name AS customer_name,city, 
       State 
 FROM customers c JOIN bk_branch b ON 
       c.bk_branch_code= b.bk_branch_code 
 WHERE state NOT IN('UT', 'AZ') 
 ORDER BY city DESC; 
 /* 
 Query 4 Output- 
 bk_branch_CODE          CUSTOMER_ID         CUSTOMER_NAME            CITY                  STATE 
 ILSH008              11015                 Alisha Nanda            Schaumburg              IL   
 ILSH008              11017                 Shawn White            Schaumburg              IL   
 ILSH008              11016                 Alia Bright                  Schaumburg              IL   
 WILG117              11018                 Shaan                     Lake Geneva              WI   
 NYHD118              11013                 Kathy Meyer            Hudson                  NY   
 INFV094              11014                 Alex Baker                Fort Wayne              IN  
 INBG108       11020          Vicky              Bloomington       IN   
 INBG108              11019                 Vincent                 Bloomington              IN   
 ILAH135              11012                 Rich Malcom            Arlington Heights IL   
 */ 
  
 /*QUERY 5 
 Write a query that gives a list of customers who are not living in  
 Apartments/units. Get detailed customer information regarding these customers. 
 */ 
 
 --we
 select * from customers
 where UNIT IS NULL ;
 
 SELECT customer_id,first_name, last_name, street_number||' '||street_name||', ' 
       ||city ||', '||state||', '||zip_code  AS address 
 FROM customers 
 WHERE unit IS NULL 
 ORDER BY state DESC; 
 /* 
 Query 5 Output- 
 CUSTOMER_ID         FIRST_NAME          LAST_NAME                  ADDRESS 
 11018               Shaan                              3115 River Lane, Lake Geneva, WI  , 54423 
 11010               Rick                Smith              GL65 Saint Ave., Springville, UT  , 84663 
 11014               Alex                Baker              1426 South Wolf Raod, Fort Wayne, IN  , 46074 
 11017               Shawn            White              1715 Bell Street, Schaumburg, IL  , 60560 
 11016               Alia                Bright        1635 Park Street, Schaumburg, IL  , 60562 
 11015               Alisha            Nanda              1435 Parker Street, Schaumburg, IL  , 67012 
 */ 
  
 /*QUERY 6 
 Write a query that returns customer_name, customer_id, account_number, 
 Account_balance for the customers who have account_balance between 5000 and 7000 
 In their checking accounts. 
 */ 

--me
explain plan for
select c.customer_id,first_name||' '||last_name as customer_name,account_number,account_balance
from customers c,accounts a
where c.customer_id = a.customer_id
and account_balance between 5000 and 7000
and account_type ='CHECKING';
select * from TABLE(dbms_xplan.display());


explain  plan for 
SELECT first_name||' ' ||last_name AS customer_name, c.customer_id, account_number, account_balance 
 FROM customers c  
       JOIN accounts a ON 
       c.customer_id= a.customer_id 
 WHERE account_balance >= 5000 AND account_balance <7000 AND account_type= 'CHECKING' 
 ORDER BY account_number; 
 /* 
 Query 6 Output- 
 CUSTOMER_NAME          CUSTOMER_ID          ACCOUNT_NUMBER          ACCOUNT_BALANCE 
 Rick Smith              11010                  3982276530              5000 
 Alia Bright              11016                  8028492955              6500 
 */ 
  

 /* 
 QUERY 7 
 Write a query that returns customer_name, address,phone_number,phone_type, 
 Account_number and account_balance of customers whose account balances 
 Are equal to or more than 50000 and and have a cell phone (Phone Type- “Cell Phone”). 
 Order the result set by account balance. 
 */ 
--ME  
select c.customer_id, first_name customer_name,street_number||' '||street_name||' '||city address ,UNIT,phone_number,phone_type,account_number,account_balance
from customers c,accounts a,customer_phone cp
where c.customer_id =cp.customer_id
and c.customer_id =a.customer_id
and account_balance >=50000
and phone_type =INITCAP('cell phone')
AND  UNIT IS NOT NULL
order by account_balance;

   
 SELECT  c.customer_id, first_name||' '||last_name AS customer_name, account_number, 
       Account_balance , phone_number,phone_type, 
       Unit||', '||street_name||' '||street_number||', '||city||', '||state||', '|| 
       Zip_code AS customer_address 
 FROM customers c JOIN customer_phone cp ON 
       c.customer_id= cp.customer_id 
       JOIN accounts a 
       ON c.customer_id= a.customer_id 
 WHERE unit IS NOT NULL AND account_balance>= 50000 AND  
       Phone_type= 'Cell Phone' 
 ORDER BY account_balance; 
 /* 
 Query 7 Output- 
 CUSTOMER_ID        CUSTOMER_NAME        ACCOUNT_NUMBER        ACCOUNT_BALANCE        PHONE_NUMBER        PHONE_TYPE        CUSTOMER_ADDRESS 
 11012              Rich Malcom        9124003568            50000                  2246329874          Cell Phone        136, Kim Street 4531, Arlington Heights, IL, 60510 
 11011              Sam Mill                 9871702287            69999.7                  6027461132          Cell Phone        261, Churchchill 9871, Phoenix, AZ, 51132 
 11012              Rich Malcom        4345010261            75000                  2246329874          Cell Phone        136, Kim Street 4531, Arlington Heights,IL, 60510 
 11013              Kathy Meyer        5189201392            85000                  9179114876          Cell Phone        240, King Street TL65, Hudson, NY, 73740 
 */ 
  
 /* 
 QUERY 8 
 Write a query that gets the list of customers who have to pay their credit card bill 
 Between 06 April,2015 and 01 May, 2015 and have a credit limit at least $1000. 
 */ 
 SELECT c.customer_id, first_name||' '|| last_name AS customer_name,credit_limit, 
 Credit_card_number,bill_payment_due_date 
 FROM customers c JOIN credit_cards cc 
       ON c.customer_id= cc.customer_id 
 WHERE bill_payment_due_date BETWEEN '06-APR-15' AND '01-MAY-15' AND  
 Credit_limit>=1000 
 ORDER BY customer_id; 
 /* 
 Query 8 Output- 
 CUSTOMER_ID        CUSTOMER_NAME        CREDIT_LIMIT        CREDIT_CARD_NUMBER        BILL_PAYMENT_DUE_DATE 
 11010              Rick Smith          3000                3714496353984371          08-APR-15 
 11012              Rich Malcom          2000                3643893643893654          10-APR-15 
 11013              Kathy Meyer          1000                6011016011016011          15-APR-15 
 11014              Alex Baker          3500                3611036110361276          20-APR-15 
 11015              Alisha Nanda          2000                3611064749361281          30-APR-15 
 11020              Vicky           2000          4562036780362678      27-APR-15 
 */ 
  
 /* 
 QUERY 9 
 Query the data related to a customer who has the amount spent from a credit card 
 Totaling atleast $1000 and also determine the credit limit for the account.  
 Display the customer details, credit limit and the amount spent by the customer. 
 */ 
 
select c.customer_id, first_name customer_name,street_number||' '||street_name||' '||city address,credit_limit,amount_spent
from customers c,credit_cards cc
where c.customer_id =cc.customer_id
and amount_spent >=1000;
 
 
 
 SELECT c.customer_id, first_name||' '|| last_name AS customer_name,credit_limit, 
         Amount_spent 
 FROM customers c  
       JOIN credit_cards cc ON 
       c.customer_id= cc.customer_id 
 WHERE amount_spent>=1000; 
 /* 
 Query 9 Output- 
 CUSTOMER_ID        CUSTOMER_NAME        CREDIT_LIMIT        AMOUNT_SPENT 
 11012            Rich Malcom          2000                1050 
 11014            Alex Baker          3500                1000 
 11015            Alisha Nanda  2000                1060 
 11020       Vicky         2000          1300 
 */ 
  
  
 /*Query 10 
 Write a query to find out the customers that have more than $5000 with the bank.  
 Order the result set by total_account_balance in descending order. 
 */ 



select customer_id,sum(account_balance)from accounts
group by customer_id
having sum(account_balance)>=5000
order by 2 DESC;


 SELECT c.first_name,c.customer_id, SUM(account_balance) AS total_account_balance,c.state 
 FROM customers c  
     JOIN accounts a ON 
     c.customer_id = a.customer_id 
 GROUP BY c.first_name,c.customer_id, c.state 
 HAVING SUM(account_balance) > 5000 
 ORDER BY total_account_balance DESC; 
 /*Query 10 Output- 
  
 FIRST_NAME        CUSTOMER_ID        TOTAL_ACCOUNT_BALANCE        STATE 
 Rich              11012              125000                    IL   
 Kathy              11013              85000                        NY   
 Sam                  11011              69999.7                    AZ   
 Rick              11010              65000                        UT   
 Alisha              11015              65000                        IL   
 Alia              11016              46500                        IL   
 Vincent              11019              30000                        IN   
 Shaan              11018              20000                        WI   
 Alex              11014              15000                        IN   
 Shawn              11017              15000                        IL   
 */ 
 
 
select * from loans;
select * from credit_cards;
select * from customer_phone;
select * from accounts;
select * from customers;
select * from bk_branch;
 
 /*Query 11 
 Write a query that returns the account_balances that are greater than  
 The average account_balance for all the accounts.Return the customer_id, 
 Account_number and account_balance for each customer*/   




select customer_id,account_number,account_balance from accounts
where account_balance >(select avg(account_balance) from accounts);



 SELECT c.customer_id,account_number, account_balance 
 FROM accounts a 
     JOIN customers c ON 
     a.customer_id= c.customer_id 
 WHERE account_balance >( 
                       SELECT AVG(account_balance) 
                       FROM accounts); 
 /*Query 11 Output 
 CUSTOMER_ID        ACCOUNT_NUMBER        ACCOUNT_BALANCE 
 11010              8902345125            60000 
 11011              9871702287            69999.7 
 11012              4345010261            75000 
 11012              9124003568            50000 
 11013              5189201392            85000 
 11015              6829743045            65000 
 11016              8027649295            40000 
 */ 
 

