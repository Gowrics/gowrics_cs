
ALTER TABLE BRANCH DROP CONSTRAINT  BRANCH_FK;


--LIBRARY PROJECT�
  
 --CREATE TABLES�
 CREATE TABLE Card( 
   cardID NUMBER, 
   status VARCHAR2(1) CHECK ((status = 'A') OR (status = 'B')), 
   fines NUMBER, 
   CONSTRAINT Card_PK PRIMARY KEY (cardID)); 
  
 CREATE TABLE Customer( 
   customerID NUMBER, 
   name VARCHAR2(40), 
   customerAddress VARCHAR2(50), 
   phone NUMBER(9), 
   password VARCHAR2(20), 
   userName VARCHAR2(10), 
   dateSignUp DATE, 
   cardNumber NUMBER, 
   CONSTRAINT Customer_PK PRIMARY KEY (customerID)); 
  
 CREATE TABLE Employee( 
   employeeID NUMBER, 
   name VARCHAR2(40), 
   employeeAddress VARCHAR2(50), 
   phone NUMBER(9), 
   password VARCHAR2(20), 
   userName VARCHAR2(10), 
   paycheck NUMBER (8, 2), 
   branchName VARCHAR2(40), 
   cardNumber NUMBER, 
   CONSTRAINT Employee_PK PRIMARY KEY (employeeID)); 
  
 CREATE TABLE Branch( 
   Name VARCHAR2(40), 
   Address VARCHAR2(50), 
   Phone NUMBER(9), 
   CONSTRAINT Branch_PK PRIMARY KEY (name)); 
  
 CREATE TABLE Location( 
   Address VARCHAR2(50), 
   CONSTRAINT Location_PK PRIMARY KEY (address)); 
  
 CREATE TABLE Rent( 
   cardID NUMBER, 
   itemID VARCHAR2(6), 
   apporpriationDate DATE, 
   returnDate DATE, 
   CONSTRAINT Rent_PK PRIMARY KEY (cardID,itemID)); 
  
 CREATE TABLE Book( 
   ISBN VARCHAR2(4), 
   bookID VARCHAR2(6), 
   state VARCHAR2(10), 
   avalability VARCHAR2(1) CHECK ((avalability = 'A') OR (avalability = 'O')), 
   debyCost NUMBER(10,2), 
   lostCost NUMBER(10,2), 
   address VARCHAR2(50), 
   CONSTRAINT Book_PK PRIMARY KEY (ISBN,bookID)); 
  
 CREATE TABLE Video( 
   Title VARCHAR2(50), 
   Year INT, 
   videoID VARCHAR2(6), 
   state VARCHAR2(10), 
   avalability VARCHAR2(1) CHECK ((avalability = 'A') OR (avalability = 'O')), 
   debyCost NUMBER(10,2), 
   lostCost NUMBER(10,2), 
   address VARCHAR(50), 
   CONSTRAINT Video_PK PRIMARY KEY (title,year,videoID)); 
  
  
 --SELECT�
 SELECT * FROM Card; 
 SELECT * FROM Customer; 
 SELECT * FROM Employee; 
 SELECT * FROM Branch; 
 SELECT * FROM Location; 
 SELECT * FROM Book; 
 SELECT * FROM Video; 
 SELECT * FROM Rent; 
  
  
 --DROP TABLES�
 DROP TABLE Card; 
 DROP TABLE Customer; 
 DROP TABLE Employee; 
 DROP TABLE Branch; 
 DROP TABLE Location; 
 DROP TABLE Book; 
 DROP TABLE Video; 
 DROP TABLE Rent; 
  
  
 --FOREIGN KEYS�
 ALTER TABLE Customer 
 ADD CONSTRAINT Customer_FK 
 FOREIGN KEY (cardNumber) 
 REFERENCES Card(cardID); 
  
 ALTER TABLE Employee 
 ADD CONSTRAINT Employee_FK_Card 
 FOREIGN KEY (cardNumber) 
 REFERENCES Card(cardID); --on update cascade; 
  
 ALTER TABLE Employee 
 ADD CONSTRAINT Employee_FK_Branch 
 FOREIGN KEY (branchName) 
 REFERENCES Branch(name); 
  
 ALTER TABLE Branch 
 ADD CONSTRAINT Branch_FKS 
 FOREIGN KEY (address) 
 REFERENCES Location(address); 

 ALTER TABLE location 
 ADD CONSTRAINT location_FK 
 FOREIGN KEY (address) 
 REFERENCES Branch(address); 

  
 ALTER TABLE Book 
 ADD CONSTRAINT Book_FK 
 FOREIGN KEY (address) 
 REFERENCES Location(address); 
  
 ALTER TABLE Video 
 ADD CONSTRAINT Video_FK 
 FOREIGN KEY (address) 
 REFERENCES Location(address); 
  
 ALTER TABLE Rent 
 ADD CONSTRAINT Rent_FK_Card 
 FOREIGN KEY (cardID) 
 REFERENCES Card(cardID); 
  
 ALTER TABLE Rent 
 ADD CONSTRAINT Rent_FK_Book 
 FOREIGN KEY (itemID) 
 REFERENCES Book(bookID); 
  
 ALTER TABLE Rent 
 ADD CONSTRAINT Rent_FK_Video 
 FOREIGN KEY (itemID) 
 REFERENCES Video(videoID); 
  
  
  select * from  ALL_CONS_COLUMNS
  where table_name  in ('VIDEO','RENT','BOOK');
  
  
  
 --INSERTS�
 INSERT INTO Card VALUES (101,'A',0); 
 INSERT INTO Card VALUES (102,'A',0); 
 INSERT INTO Card VALUES (103,'A',0); 
 INSERT INTO Card VALUES (104,'A',0); 
 INSERT INTO Card VALUES (105,'A',0); 
 INSERT INTO Card VALUES (106,'A',0); 
 INSERT INTO Card VALUES (107,'B',50); 
 INSERT INTO Card VALUES (108,'B',10); 
 INSERT INTO Card VALUES (109,'B',25.5); 
 INSERT INTO Card VALUES (110,'B',15.25); 
 INSERT INTO Card VALUES (151,'A',0); 
 INSERT INTO Card VALUES (152,'A',0); 
 INSERT INTO Card VALUES (153,'A',0); 
 INSERT INTO Card VALUES (154,'A',0); 
 INSERT INTO Card VALUES (155,'A',0); 
  --------------
 INSERT INTO Branch VALUES ('ARCHEOLOGY', 'ARCHEOLOGY ROAD', 645645645); 
 INSERT INTO Branch VALUES ('CHEMISTRY', 'CHEMISTRY ROAD', 622622622); 
 INSERT INTO Branch VALUES ('COMPUTING', 'COMPUTING ROAD', 644644644); 
 INSERT INTO Branch VALUES ('PHYSICS', 'PHYSICS ROAD', 666666666); 
  
 INSERT INTO Customer VALUES (1, 'ALFRED', 'BACON STREET', 623623623, 'alfred123', 'al1', '12-05-2018', 101); 
 INSERT INTO Customer VALUES (2, 'JAMES', 'DOWNTOWN ABBEY', 659659659, 'james123', 'ja2', '10-05-2018', 102); 
 INSERT INTO Customer VALUES (3, 'GEORGE', 'DETROIT CITY', 654654654, 'george123', 'ge3', '21-06-2017', 103); 
 INSERT INTO Customer VALUES (4, 'TOM', 'WASHINGTON DC.', 658658658, 'tom123', 'tom4', '05-12-2016', 104); 
 INSERT INTO Customer VALUES (5, 'PETER', 'CASTERLY ROCK', 652652652, 'peter123', 'pe5', '09-08-2016', 105); 
 INSERT INTO Customer VALUES (6, 'JENNY', 'TERRAKOTA', 651651651, 'jenny123', 'je6', '30-04-2017', 106); 
 INSERT INTO Customer VALUES (7, 'ROSE', 'SWEET HOME ALABAMA', 657657657, 'rose123', 'ro7', '28-02-2018', 107); 
 INSERT INTO Customer VALUES (8, 'MONICA', 'FAKE STREET 123', 639639639, 'monica123', 'mo8', '15-01-2016', 108); 
 INSERT INTO Customer VALUES (9, 'PHOEBE', 'CENTRAL PERK', 678678678, 'phoebe123', 'pho9', '25-03-2016', 109); 
 INSERT INTO Customer VALUES (10, 'RACHEL', 'WHEREVER', 687687687, 'rachel123', 'ra10', '01-09-2017', 110); 
-----------------------------  
 INSERT INTO Employee VALUES (211, 'ROSS', 'HIS HOUSE', 671671671, 'ross123', 'ro11', 1200, 'ARCHEOLOGY', 551); 
 INSERT INTO Employee VALUES (212, 'CHANDLER', 'OUR HEARTHS', 688688688, 'chandler123', 'chand12', 1150.50, 'ARCHEOLOGY', 552); 
 INSERT INTO Employee VALUES (213, 'JOEY', 'LITTLE ITAYLY', 628628628, 'joey123', 'jo13', 975.75, 'ARCHEOLOGY', 553); 
 INSERT INTO Employee VALUES (214, 'VICTOR', 'SANTA FE', 654321987, 'victor123', 'vic14', 2200, 'COMPUTING', 554); 
 INSERT INTO Employee VALUES (215, 'JAIRO', 'ARMILLA', 698754321, 'jairo123', 'ja15', 2200.50, 'CHEMISTRY', 555); 
  
 INSERT INTO Location VALUES ('ARCHEOLOGY ROAD'); 
 INSERT INTO Location VALUES ('CHEMISTRY ROAD'); 
 INSERT INTO Location VALUES ('COMPUTING ROAD'); 
 INSERT INTO Location VALUES ('PHYSICS ROAD'); 
  
 INSERT INTO Book VALUES ('A123', 'B1A123', 'GOOD', 'A', 5, 20, 'ARCHEOLOGY ROAD'); 
 INSERT INTO Book VALUES ('A123', 'B2A123', 'NEW', 'O', 6, 30, 'ARCHEOLOGY ROAD'); 
 INSERT INTO Book VALUES ('B234', 'B1B234', 'NEW', 'A', 2, 15, 'CHEMISTRY ROAD'); 
 INSERT INTO Book VALUES ('C321', 'B1C321', 'BAD', 'A', 1, 10, 'PHYSICS ROAD'); 
 INSERT INTO Book VALUES ('H123', 'B1H123', 'GOOD', 'A', 3, 15, 'CHEMISTRY ROAD'); 
 INSERT INTO Book VALUES ('Z123', 'B1Z123', 'GOOD', 'O', 4, 20, 'COMPUTING ROAD'); 
 INSERT INTO Book VALUES ('L321', 'B1L321', 'NEW', 'O', 4, 20, 'COMPUTING ROAD'); 
 INSERT INTO Book VALUES ('P321', 'B1P321', 'USED', 'A', 2, 12, 'CHEMISTRY ROAD'); 
  
 INSERT INTO Video VALUES ('CHEMISTRY FOR DUMMIES', 2016, 'V1CH16', 'NEW', 'O', 10, 50, 'CHEMISTRY ROAD'); 
 INSERT INTO Video VALUES ('CHEMISTRY FOR DUMMIES', 2016, 'V2CH16', 'BAD', 'A', 5, 20, 'CHEMISTRY ROAD'); 
 INSERT INTO Video VALUES ('COMPUTING MANAGER', 2014, 'V1CO14', 'GOOD', 'A', 4, 20, 'COMPUTING ROAD'); 
 INSERT INTO Video VALUES ('JAVA LANGUAGE', 2015, 'V1JA15', 'USED', 'O', 4, 20, 'COMPUTING ROAD'); 
 INSERT INTO Video VALUES ('DINOSAURS', 2000, 'V1DI00', 'GOOD', 'O', 5, 25, 'ARCHEOLOGY ROAD'); 
 INSERT INTO Video VALUES ('T-REX, DEADLY KING', 1992, 'V1TR92', 'USED', 'A', 10, 50, 'ARCHEOLOGY ROAD'); 
 INSERT INTO Video VALUES ('ANCESTORS OF THE HUMANITY', 1998, 'V1AN98', 'BAD', 'A', 3, 15, 'ARCHEOLOGY ROAD'); 
 INSERT INTO Video VALUES ('PHYSICS, MOST BORING SH*T', 2018, 'V1PH18', 'NEW', 'A', 1, 5, 'PHYSICS ROAD'); 
  
 INSERT INTO Rent VALUES (101, 'B2A123', '10-05-2018', '20-05-2018'); 
 INSERT INTO Rent VALUES (102, 'B1Z123', '10-05-2018', '25-05-2018'); 
 INSERT INTO Rent VALUES (104, 'V1JA15', '01-05-2018', '21-05-2018'); 
 INSERT INTO Rent VALUES (105, 'V1DI00', '02-05-2018', '25-05-2018'); 
 INSERT INTO Rent VALUES (154, 'B1L321', '04-05-2018', '26-05-2018'); 
 INSERT INTO Rent VALUES (155, 'V1CH16', '29-04-2018', '29-05-2018'); 
  
  commit;
  
 --FUNCTIONS�
 --1�
 
 --CUSTOMER�   login process
 CREATE OR REPLACE PROCEDURE loginCustomer_library(user IN VARCHAR2, pass IN VARCHAR2) 
 IS 
   passAux customer.password%TYPE; 
   incorrect_password EXCEPTION; 
 BEGIN 
   SELECT password INTO passAux 
   FROM customer 
   WHERE username LIKE user; 
  
   IF passAux LIKE pass THEN 
     DBMS_OUTPUT.PUT_LINE('User ' || user || ' loging succesfull'); 
   ELSE 
     RAISE incorrect_password; 
   END IF; 
  
   EXCEPTION 
   WHEN no_data_found OR incorrect_password THEN  
        DBMS_OUTPUT.PUT_LINE('Incorrect username or password'); 
 END; 
 /
EXEC  loginCustomer_library('hosdde','jhjhsdsj');                             ---------success
  
 SET SERVEROUTPUT ON; 
 DECLARE 
   User customer.username%TYPE; 
   Pass customer.password%TYPE; 
 BEGIN 
   User := '&Username'; 
   Pass := '&Password'; 
   LoginCustomer_library(user,pass); 
 END; 
/                                                                                 --success
  
 --EMPLOYEE- 
CREATE OR REPLACE PROCEDURE loginEmployee_library(user IN VARCHAR2, pass IN VARCHAR2) 
 IS 
   passAux employee.password%TYPE; 
   incorrect_password EXCEPTION; 
 BEGIN 
   SELECT password INTO passAux 
   FROM employee 
   WHERE username LIKE user; 
  
   IF passAux LIKE pass THEN 
     DBMS_OUTPUT.PUT_LINE('User ' || user || ' loging succesfull'); 
ELSE 
     RAISE incorrect_password; 
END IF; 
  
EXCEPTION 
WHEN no_data_found OR incorrect_password THEN  
        DBMS_OUTPUT.PUT_LINE('Incorrect username or password'); 
END; 
/  
 SET SERVEROUTPUT ON; 
DECLARE 
   User employee.username%TYPE; 
   Pass employee.password%TYPE; 
BEGIN 
   User := '&Username'; 
   Pass := '&Password'; 
   loginEmployee_library(user,pass); 
END; 
/ 
  
  
 --2�  select the details of book or video
 CREATE OR REPLACE PROCEDURE viewItem_library(auxItemID IN VARCHAR2) 
 IS 
   auxISBN VARCHAR2(4); 
   auxTitle VARCHAR2(50); 
   auxYear NUMBER; 
   auxState VARCHAR2(10); 
   auxDebyCost NUMBER(10,2); 
   auxLostCost NUMBER(10,2); 
   auxAddress VARCHAR2(50); 
   auxAbala VARCHAR2(1); 
   auxVideo NUMBER; 
   auxBook NUMBER; 
 BEGIN 
  
   SELECT COUNT(*) INTO auxBook 
   FROM book 
   WHERE bookid LIKE auxItemID; 
  
   SELECT COUNT(*) INTO auxVideo 
   FROM video 
   WHERE videoid LIKE auxItemID; 
  
   IF auxBook > 0 THEN 
     SELECT isbn, state, avalability, debycost, lostcost, address 
     INTO auxISBN, auxState, auxAbala, auxDebyCost, auxLostCost, auxAddress 
     FROM book 
     WHERE bookid LIKE auxItemID; 
  
     DBMS_OUTPUT.PUT_LINE('BOOK ' || auxItemID || ' INFO'); 
     DBMS_OUTPUT.PUT_LINE('------------------------------------------'); 
     DBMS_OUTPUT.PUT_LINE('ISBN: ' || auxISBN); 
     DBMS_OUTPUT.PUT_LINE('STATE: ' || auxState); 
     DBMS_OUTPUT.PUT_LINE('AVALABILITY: ' || auxAbala); 
     DBMS_OUTPUT.PUT_LINE('DEBY COST: ' || auxDebyCost); 
     DBMS_OUTPUT.PUT_LINE('LOST COST: ' || auxLostCost); 
     DBMS_OUTPUT.PUT_LINE('ADDRESS: ' || auxAddress); 
     DBMS_OUTPUT.PUT_LINE('------------------------------------------'); 
   ELSIF auxVideo > 0 THEN 
     SELECT title, year, state, avalability, debycost, lostcost, address 
     INTO auxTitle, auxYear, auxState, auxAbala, auxDebyCost, auxLostCost, auxAddress 
     FROM video 
     WHERE videoid LIKE auxItemID; 
  
     DBMS_OUTPUT.PUT_LINE('VIDEO ' || auxItemID || ' INFO'); 
     DBMS_OUTPUT.PUT_LINE('------------------------------------------'); 
     DBMS_OUTPUT.PUT_LINE('TITLE: ' || auxTitle); 
     DBMS_OUTPUT.PUT_LINE('YEAR: ' || auxYear); 
     DBMS_OUTPUT.PUT_LINE('STATE: ' || auxState); 
     DBMS_OUTPUT.PUT_LINE('AVALABILITY: ' || auxAbala); 
     DBMS_OUTPUT.PUT_LINE('DEBY COST: ' || auxDebyCost); 
     DBMS_OUTPUT.PUT_LINE('LOST COST: ' || auxLostCost); 
     DBMS_OUTPUT.PUT_LINE('ADDRESS: ' || auxAddress); 
     DBMS_OUTPUT.PUT_LINE('------------------------------------------'); 
   END IF; 
 END; 
 /
 SET SERVEROUTPUT ON; 

 DECLARE 
   auxItemID VARCHAR2(10); 
 BEGIN 
   auxItemID := '&Item_ID'; 
   viewItem_library(auxItemID); 
 END;                                                                                    ---SUCCESS
/
  select * from customer;

(   SELECT COUNT(*)FROM rent 
   WHERE cardid LIKE 104; 

   SELECT fines
   --INTO auxFines 
   FROM card 
   WHERE cardid LIKE 104; 
);

  
 --3�
 --CUSTOMER�
 CREATE OR REPLACE PROCEDURE customerAccount_library(custoID IN customer.customerid%TYPE) 
 IS 
   auxCard NUMBER; --cs cardid
   auxFines NUMBER; 
   auxItem VARCHAR(6); -- rent itemid 
   rented number := 0;  --rnt cardid count
 BEGIN 
   SELECT cardnumber INTO auxCard 
   FROM customer 
   WHERE customerid LIKE custoID; 
  
   SELECT COUNT(*) INTO rented 
   FROM rent 
   WHERE rent.cardid LIKE auxcard; 
  
   DBMS_OUTPUT.PUT_LINE('The user card is ' || auxCard);   
   IF (rented > 0) THEN                   
           /* in rent table 1 card num holder borrow 2 different books so tis code return one are more row.
           so error accu(fetch return more than 1 row) 
           SELECT rent.itemid INTO auxItem 
           FROM rent,card 
           WHERE card.cardid = rent.cardid 
           AND card.cardid LIKE auxCard;       
           DBMS_OUTPUT.PUT_LINE('The user has ' || auxItem || ' rented'); 
           */
      DBMS_OUTPUT.PUT_LINE('The user has rented '||rented||' items'); 

          FOR i IN ( SELECT rent.itemid
                     FROM rent,card 
                     WHERE card.cardid = rent.cardid 
                     AND card.cardid LIKE auxCard)
           LOOP    
            DBMS_OUTPUT.PUT_LINE(i.itemid); 
           END LOOP;
     ELSE     
        DBMS_OUTPUT.PUT_LINE('This user has no rents');

   END IF; 
  
   SELECT fines INTO auxFines 
   FROM card 
   WHERE cardid LIKE auxcard; 
  
   DBMS_OUTPUT.PUT_LINE('The user fines are ' || auxFines); 
  
   EXCEPTION WHEN no_data_found THEN  
   DBMS_OUTPUT.PUT_LINE('NOT DATA FOUND'); 
 END; 
 / 
 SET SERVEROUTPUT ON; 
 DECLARE 
   custoID customer.customerid%TYPE; 
 BEGIN 
   custoID := &Customer_ID; 
   customerAccount_library(custoID); 
 END; 
/  
  
 --EMPLOYEE�
 CREATE OR REPLACE PROCEDURE employeeAccount_library(emploID IN employee.employeeid%TYPE) 
 IS 
   auxCard NUMBER; 
   auxFines NUMBER; 
   auxItem VARCHAR(6); 
   rented number := 0; 
 BEGIN 
   SELECT cardnumber INTO auxCard 
   FROM employee 
   WHERE employeeid LIKE emploID; 
  
   SELECT COUNT(*) INTO rented 
   FROM rent 
   WHERE rent.cardid LIKE auxcard; 
  
   DBMS_OUTPUT.PUT_LINE('The user card is ' || auxCard);   
   IF (rented > 0) THEN 
     SELECT rent.itemid INTO auxItem 
     FROM rent,card 
     WHERE card.cardid = rent.cardid 
     AND card.cardid LIKE auxCard;     
  
     DBMS_OUTPUT.PUT_LINE('The user has ' || auxItem || ' rented'); 
   ELSE     
     DBMS_OUTPUT.PUT_LINE('This user has no rents');  
   END IF; 
  
   SELECT fines INTO auxFines 
   FROM card 
   WHERE cardid LIKE auxcard; 
  
   DBMS_OUTPUT.PUT_LINE('The user fines are ' || auxFines); 
  
   EXCEPTION WHEN no_data_found THEN  
   DBMS_OUTPUT.PUT_LINE('NOT DATA FOUND'); 
 END; 
 / 
 SET SERVEROUTPUT ON; 
 DECLARE 
   emploID employee.employeeid%TYPE; 
 BEGIN 
   emploID := &Employee_ID; 
   employeeAccount_library(emploID); 
 END; 
 / 
  
  SELECT * FROM customer; 
 SELECT * FROM rent; 
 SELECT * FROM card; 
 SELECT * FROM book; 
 
 --4�
CREATE OR REPLACE PROCEDURE rentItem_library(auxCard IN NUMBER, auxItemID IN VARCHAR2, itemType IN VARCHAR2, auxDate IN DATE) 
 IS 
   statusAux VARCHAR2(1);  
   itemStatus VARCHAR2(1); 
   no_data exception ;
 BEGIN 
  
   SELECT status INTO statusAux 
   FROM card 
   WHERE cardid LIKE auxCard; 
   IF statusAux LIKE 'A' THEN                                            -----1
     IF itemType LIKE 'book' THEN                                   ------2
       SELECT avalability INTO itemStatus 
       FROM book 
       WHERE bookid LIKE auxItemID;
       IF itemStatus LIKE 'A' THEN                               ------2.1                
         UPDATE book 
         SET avalability = 'O'                         ----update book
         WHERE bookid LIKE auxItemID; 
  
         INSERT INTO rent                              ---- insert rent
         VALUES (auxCard,auxItemID,sysdate,auxDate); 
         DBMS_OUTPUT.PUT_LINE('Item ' || auxItemID || ' rented'); 
       ELSE                                                          
         DBMS_OUTPUT.PUT_LINE('The item is already rented'); 
       END IF;                                                   ------2.1
  
     ELSIF itemType LIKE 'video' THEN                                -----2elsif 
  
       SELECT avalability INTO itemStatus 
       FROM video 
       WHERE videoid LIKE auxItemID; 
  
       IF itemStatus LIKE 'A' THEN                        ----------2.1
         UPDATE video 
         SET avalability = 'O' 
         WHERE videoid LIKE auxItemID; 
  
         INSERT INTO rent 
         VALUES (auxCard,auxItemID,sysdate,auxDate); 
         DBMS_OUTPUT.PUT_LINE('Item ' || auxItemID || ' rented'); 
       ELSE 
         DBMS_OUTPUT.PUT_LINE('The item is already rented'); 
       END IF;                                          --------2.1end
  else 
  raise no_data;
      END IF;     
   ELSE                                     -----1elsif
     DBMS_OUTPUT.PUT_LINE('The user is blocked'); 
      END IF;     
EXCEPTION WHEN no_data THEN
DBMS_OUTPUT.PUT_LINE('enter valid input value'); 
END;
/

DECLARE
 auxCard NUMBER; 
 auxItemID VARCHAR2(10); 
 itemType VARCHAR2(20); 
 auxDate DATE; 
 BEGIN 
   auxCard := &Card_ID; 
   itemType := '&Item_Type_book_or_video';   
   auxItemID := '&ID_Item';   
   auxDate := '&Return_date'; 
   rentItem_library(auxCard,auxItemID,itemType,auxDate); 
 END; 
/
select * from rent;
select * from video;
    -- in this proc we can add 1 more item book added in same cust card id so we change customerAccount_library 
  
 --5� please refer gowricoding.sql---------------------------
 CREATE OR REPLACE PROCEDURE payFines_library(auxCard IN card.cardid%TYPE, money IN NUMBER) 
 IS 
   finesAmount NUMBER; 
   total NUMBER; 
 BEGIN 
   SELECT fines INTO finesAmount 
   FROM card 
   WHERE cardid LIKE auxCard; 
   
   IF finesAmount < money THEN 
     Total := money - finesAmount; 
     DBMS_OUTPUT.PUT_LINE('YOU PAY ALL YOUR FINES AND YOU HAVE ' || total || ' MONEY BACK'); 
  
     UPDATE card 
     SET status = 'A', fines = 0 
     WHERE cardid = auxCard; 
  
   ELSIF finesAmount = money THEN 
     Total := money - finesAmount; 
     DBMS_OUTPUT.PUT_LINE('YOU PAY ALL YOUR FINES'); 
  
     UPDATE card 
     SET status = 'A', fines = 0 
     WHERE cardid = auxCard; 
  
   ELSE 
     Total := finesAmount - money; 
     DBMS_OUTPUT.PUT_LINE('YOU WILL NEED TO PAY ' || total || ' MORE DOLLARS TO UNLOCK YOUR CARD'); 
  
     UPDATE card 
     SET fines = total 
     WHERE cardid = auxCard; 
   END IF; 
 END; 
  /
 SET SERVEROUTPUT ON; 
 DECLARE 
   auxCard card.cardid%TYPE; 
   money NUMBER; 
 BEGIN 
   auxCard := &Card_ID; 
   money := &Money_To_Pay; 
   payFines_library(auxCard,money); 
 END; 
 / 
  
  
 --6�
 --CUSTOMER� update the customer details 
select * from customer;
 CREATE OR REPLACE PROCEDURE updateInfoCusto_library(auxCustomer IN customer.customerid%TYPE, pNumber NUMBER, address VARCHAR2, newPass VARCHAR2) 
 IS 
 BEGIN 
   UPDATE customer 
   SET phone = pNumber, customeraddress = address, password = newPass 
   WHERE customerid = auxCustomer; 
 END; 
/
 SET SERVEROUTPUT ON; 
 DECLARE 
   auxCustomer customer.customerid%TYPE; 
   pNumber customer.phone%TYPE; 
   address customer.customeraddress%TYPE; 
   newPass customer.password%TYPE; 
 BEGIN 
   auxCustomer := &Customer_ID; 
   pNumber := &Write_your_new_phone_number_or_the_old_one_if_you_do_not_want_to_change_it; 
   address := '&Write_your_new_address_or_the_old_one_if_you_do_not_want_to_change_it'; 
   newPass := '&Write_your_new_password_or_the_old_one_if_you_do_not_want_to_change_it'; 
   updateInfoCusto_library(auxCustomer,pNumber,address,newPass); 
 END; 
 / 
 
 --EMPLOYEE� update employee details
 select * from employee;
 CREATE OR REPLACE PROCEDURE updateInfoEmp_library(auxEmployee IN employee.employeeid%TYPE, pNumber NUMBER, address VARCHAR2, newPass VARCHAR2, newPayCheck NUMBER,newBranch VARCHAR2) 
 IS 
 BEGIN 
   UPDATE employee 
   SET phone = pNumber, employeeaddress = address, password = newPass, paycheck = auxEmployee, branchname = newBranch 
   WHERE employeeid = auxEmployee; 
 END; 
  /
 SET SERVEROUTPUT ON; 
 DECLARE 
   auxEmployee employee.employeeid%TYPE; 
   pNumber employee.employeeid%TYPE; 
   address employee.employeeaddress%TYPE; 
   newPass employee.password%TYPE; 
   newPayCheck employee.paycheck%TYPE; 
   newBranch employee.branchname%TYPE; 
 BEGIN 
   auxEmployee := &employee_ID; 
   pNumber := &Write_your_new_phone_number_or_the_old_one_if_you_do_not_want_to_change_it; 
   address := '&Write_your_new_address_or_the_old_one_if_you_do_not_want_to_change_it'; 
   newPass := '&Write_your_new_password_or_the_old_one_if_you_do_not_want_to_change_it'; 
   newPayCheck := &Write_your_new_paycheck_or_the_old_one_if_you_do_not_want_to_change_it; 
   newBranch := '&Write_your_new_branch_or_the_old_one_if_you_do_not_want_to_change_it'; 
   updateInfoEmp_library(auxemployee,pNumber,address,newPass,newPayCheck,newBranch); 
 END; 
 /
 --7� add the new customer
 select * from customer;
 select * from employee;
 select * from card;
 
 
 DELETE CUSTOMER
 WHERE CUSTOMERID =216 ;
 
 UPDATE CUSTOMER 
 SET CUSTOMERID=13
 WHERE NAME=''

 CREATE OR REPLACE PROCEDURE addCustomer_library(auxCustomerId IN NUMBER, auxName IN VARCHAR2, auxCustomerAddress IN VARCHAR2, auxPhone IN NUMBER, 
 auxPass IN VARCHAR2, auxUserName IN VARCHAR2, auxCardNumber IN NUMBER) 
 IS 
 BEGIN 
   INSERT INTO customer 
   VALUES (auxCustomerId,auxName,auxCustomerAddress,auxPhone,auxPass,auxUserName,sysdate,auxCardNumber); 
 END; 
 / 
 SET SERVEROUTPUT ON; 
 DECLARE 
   auxCustomerId customer.customerid%TYPE; 
   auxName customer.name%TYPE; 
   auxCustomerAddress customer.customeraddress%TYPE; 
   auxPhone customer.phone%TYPE; 
   auxPass customer.password%TYPE; 
   auxUserName customer.username%TYPE; 
   auxCardNumber customer.cardnumber%TYPE; 
 BEGIN 
   auxCustomerId := &Customer_ID; 
   auxName := '&Name'; 
   auxCustomerAddress := '&Address'; 
   auxPhone := &Phone; 
   auxPass := '&Password'; 
   auxUserName := '&User_Name'; 
   auxCardNumber := &Card_Numeber; 
   addCustomer_library(auxCustomerId,auxName,auxCustomerAddress,auxPhone,auxPass,auxUserName,auxCardNumber); 
 END;     --this execution got error a new customer not presense in parent card tb so before insert we must create a trigger for insett parent card tb. 
/  


  
 --8�
 --CUSTOMER�  create a trigger for insett parent card tb.  
 / --Edited by me
 CREATE OR REPLACE TRIGGER addCardCusto_library  
 AFTER INSERT OR DELETE
 ON customer 
 FOR EACH ROW 
 DECLARE 
 BEGIN 
 IF inserting THEN
   INSERT INTO card 
   VALUES (:new.cardnumber,'A',0); 
 END IF;
 IF  deleting THEN
   DELETE FROM CARD
   WHERE  cardid = :old.cardnumber;
 END IF;
   DBMS_OUTPUT.PUT_LINE('Card created'); 
 END; 
 / 
 --EMPLOYEE�
 CREATE OR REPLACE TRIGGER addCardEmp_library 
 AFTER INSERT 
 ON employee 
 FOR EACH ROW 
 DECLARE 
 BEGIN 
   INSERT INTO card 
   VALUES (:new.cardnumber,'A',0); 
  
   DBMS_OUTPUT.PUT_LINE('Card created'); 
 END; 
  
 --EXAMPLE�
 /
 INSERT INTO customer 
 VALUES (12,'MARI CARMEN','CORDOBA',645892456,'maricarmen123','ma11',sysdate,112); 
select * from employee; / 
  
 INSERT INTO customer 
 VALUES (216,'MARISH','CODOBA',645834498,'maricarn123','marico',sysdate,556); 
 /

  
 --9�
 CREATE OR REPLACE PROCEDURE allMedia_library(mediaType VARCHAR2) 
 IS 
   CURSOR cBooks 
   IS 
     SELECT * 
     FROM book; 
  
   CURSOR cVideos 
   IS 
     SELECT * 
     FROM video; 
  
   xBooks cBooks%ROWTYPE; 
   xVideos cVideos%ROWTYPE; 
 BEGIN 
   IF mediaType LIKE 'books' THEN 
     OPEN cBooks; 
  
     DBMS_OUTPUT.PUT_LINE('ISBN     ID     STATE     AVALABILITY     DEBY_COST     LOST_COST    LOCATION'); 
     DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------------------------------'); 
  
     LOOP 
       FETCH cBooks 
       INTO xBooks; 
       EXIT WHEN cBooks%NOTFOUND; 
  
       DBMS_OUTPUT.PUT_LINE(xBooks.isbn || '     ' || xBooks.bookid || '     ' || xBooks.state || '     ' || xBooks.avalability || '     ' || xBooks.debycost || '     ' || 
       xBooks.lostcost || '     ' || xBooks.address); 
     END LOOP; 
   ELSIF mediaType LIKE 'videos' THEN 
     OPEN cVideos; 
     DBMS_OUTPUT.PUT_LINE('TITLE                      YEAR  ID   STATE  AVALABILITY  DEBY_COST  LOST_COST LOCATION'); 
     DBMS_OUTPUT.PUT_LINE('---------------------------------------------------------------------------------------'); 
     LOOP 
       FETCH cVideos 
       INTO xVideos; 
       EXIT WHEN cVideos%NOTFOUND; 
 
       DBMS_OUTPUT.PUT_LINE(RPAD(xVideos.title,30,' ') ||RPAD(xVideos.year,4,' ') || RPAD(xVideos.videoid,7,' ')|| RPAD(xVideos.state,5,' ') ||RPAD( xVideos.avalability,2,' ') ||RPAD( xVideos.debycost,2,' ')|| 
       RPAD(xVideos.lostcost,3,' ')||RPAD( xVideos.address,35,' ')); 
     END LOOP; 
   ELSE 
     DBMS_OUTPUT.PUT_LINE('TYPE INCORRECT, you must choose between books or videos'); 
   END IF; 
 END; 
  /
 SET SERVEROUTPUT ON; 
 DECLARE 
   typeItem VARCHAR2(10); 
 BEGIN 
   typeItem := '&Select_between_books_or_videos'; 
   allMedia_library(typeItem); 
 END; 
 
  /

   SELECT COUNT(*)
   FROM rent 
   WHERE itemid LIKE 'V1JA15'; 


SELECT * FROM RENT;
  
 --10�  this is altered refer gowri coding
 --(
 CREATE OR REPLACE PROCEDURE handleReturns_library(auxItemID IN VARCHAR2) 
 IS 
   auxRented NUMBER; 
   auxBook NUMBER; 
   auxVideo NUMBER; 
 BEGIN 
   SELECT COUNT(*) INTO auxRented 
   FROM rent 
   WHERE itemid LIKE auxItemID; 
  
   SELECT COUNT(*) INTO auxBook 
   FROM book 
   WHERE bookid LIKE auxItemID; 
  
   SELECT COUNT(*) INTO auxVideo 
   FROM video 
   WHERE videoid LIKE auxItemID; 
  
   IF auxRented > 0 THEN 
     DELETE FROM rent 
     WHERE itemid = auxItemID; 
     IF auxBook > 0 THEN 
       UPDATE book 
       SET avalability = 'A' 
       WHERE bookid LIKE auxItemID; 
       DBMS_OUTPUT.PUT_LINE('The book ' || auxItemID || ' is now avaible.'); 
     ELSIF auxVideo > 0 THEN 
       UPDATE video 
       SET avalability = 'A' 
       WHERE videoid LIKE auxItemID; 
       DBMS_OUTPUT.PUT_LINE('The video ' || auxItemID || ' is now avaible.'); 
     END IF; 
   ELSE 
     DBMS_OUTPUT.PUT_LINE('This item is not rented at the moment'); 
   END IF; 
   EXCEPTION WHEN no_data_found THEN  
   DBMS_OUTPUT.PUT_LINE('Item ID incorrect');     
 END; 
 / 
 SET SERVEROUTPUT ON; 
 DECLARE 
   auxItemID VARCHAR2(10); 
 BEGIN 
   auxItemID := '&ItemID_to_return'; 
   handleReturns_library(auxItemID); 
 END; 
 / 
 SELECT * FROM rent; 
 SELECT * FROM card; 
 SELECT * FROM VIDEO; 
  
  
  
  
 --11�   mutating error accur
 
 drop trigger modifyFines_library;
 CREATE OR REPLACE TRIGGER modifyFines_library 
 AFTER DELETE 
 ON rent 
 FOR EACH ROW 
 DECLARE 
   auxCardID NUMBER; 
   auxItemID VARCHAR2(6); 
   auxBook NUMBER; 
   auxVideo NUMBER; 
   auxDeby NUMBER; 
 BEGIN   
   SELECT cardid, itemid INTO auxCardID, auxItemID 
   FROM rent 
   WHERE cardid LIKE :old.cardid; 
  
   SELECT COUNT(*) INTO auxBook 
   FROM book 
      WHERE bookid LIKE auxItemID; 
  
   SELECT COUNT(*) INTO auxVideo 
   FROM video 
   WHERE videoid LIKE auxItemID; 
  
   IF sysdate > :old.returndate THEN 
     IF auxVideo > 0 THEN  
       SELECT debyCost INTO auxDeby 
       FROM video 
       WHERE videoid LIKE auxItemID; 
     ELSIF auxBook > 0 THEN 
       SELECT debyCost INTO auxDeby 
       FROM book 
       WHERE bookid LIKE auxItemID; 
     END IF; 
  
     UPDATE card 
     SET status = 'B', fines = (fines + auxDeby) 
     WHERE cardid LIKE auxCardID; 
   ELSE 
     DBMS_OUTPUT.PUT_LINE('The item has been return before deadline'); 
   END IF; 
 END; 
 /
 --)  because the trigger not work---------------------------- mutating error accur-- refer gowricoding.sql (handleReturns_pkg  )  --------- 
 
 
 
 
 --EXAMPLE�
 INSERT INTO customer 
 VALUES (12,'ALEJANDRO','ZAIDIN',629629629,'alex123','al12',sysdate,112); 
  
 SELECT * FROM customer; 
  
 SET SERVEROUTPUT ON; 
 DECLARE 
   auxCard NUMBER; 
   auxItemID VARCHAR2(10); 
   itemType VARCHAR2(20); 
   auxDate DATE; 
 BEGIN 
   auxCard := &Card_ID; 
   itemType := &Item_Type_book_or_video;   
   auxItemID := &ID_Item;   
   auxDate := &Return_date; 
   rentItem_library(auxCard,auxItemID,itemType,auxDate); 
 END; 
  /
 SELECT * FROM card; 
  
 SET SERVEROUTPUT ON; 
 DECLARE 
   auxItemID VARCHAR2(10); 
 BEGIN 
   auxItemID := &ItemID_to_return; 
   handleReturns_library(auxItemID); 
 END; 
 / 
 DELETE FROM card WHERE cardid LIKE 112; 
 SELECT * FROM card; 
  
  
  
 --12�
 --BOOK� we try to/ add book in book tb error:parent key not found so we add parent key location
 
 
 delete location where address ='KAMBAR ST';
 delete BOOK where address ='KABILAT ST';
 select * from book;
 select * from location;
 set serveroutput on;
 CREATE OR REPLACE PROCEDURE addBook_library(auxISBN IN VARCHAR2, auxBookID IN VARCHAR2, auxState IN VARCHAR2, auxDebyCost IN NUMBER, 
 auxLostCost IN NUMBER, auxAddress IN VARCHAR2) 
 IS 
 fnd NUMBER;
  BEGIN
  --altered
 select count(*) into fnd from location
 where address =auxaddress;

 if fnd =0 then
  INSERT INTO location values(auxaddress);

   INSERT INTO book 
   VALUES(auxISBN,auxBookID,auxState,'A',auxDebyCost,auxLostCost,auxAddress); 
   DBMS_OUTPUT.PUT_LINE('Book inserted correctly'); 

else 
   INSERT INTO book 
   VALUES(auxISBN,auxBookID,auxState,'A',auxDebyCost,auxLostCost,auxAddress); 
   DBMS_OUTPUT.PUT_LINE('Book inserted correctly'); 
end if;
--
 END; 
 / 
 --VIDEO� will alter the procedure like addBook_library procedure
 
 CREATE OR REPLACE PROCEDURE addVideo_library(auxTitle IN VARCHAR2, auxYear IN INT, auxVideoID IN VARCHAR2, auxState IN VARCHAR2, auxDebyCost IN NUMBER, 
 auxLostCost IN NUMBER, auxAddress IN VARCHAR2) 
 IS 
 BEGIN 
   INSERT INTO video 
   VALUES(auxTitle,auxYear,auxVideoID,auxState,'A',auxDebyCost,auxLostCost,auxAddress); 
   DBMS_OUTPUT.PUT_LINE('Video inserted correctly'); 
 END; 
 /
 
 --EXAMPLES�
 SET SERVEROUTPUT ON; 
 DECLARE 
   auxISBN book.isbn%type; 
   auxItemID book.bookid%type; 
   auxState book.state%type; 
   auxDebyCost book.debycost%type; 
   auxLostCost book.lostcost%type; 
   auxAddress book.address%type; 
 BEGIN 
     auxISBN := '&ISBN'; 
     auxItemID := '&ItemID'; 
     auxState := '&State'; 
     auxDebyCost := &Deby_Cost; 
     auxLostCost := &Lost_Cost; 
     auxAddress := '&Location'; 
     addBook_library(auxISBN, auxItemID, auxState, auxDebyCost, auxLostCost, auxAddress); 
 END; 
 / 
  
 SET SERVEROUTPUT ON; 
 DECLARE 
   auxTitle VARCHAR2(50); 
   auxYear INT; 
   auxItemID VARCHAR2(6); 
   auxState VARCHAR2(10); 
   auxDebyCost NUMBER(10,2); 
   auxLostCost NUMBER(10,2); 
   auxAddress VARCHAR2(50); 
 BEGIN 
     auxTitle := '&Title'; 
     auxYear := &Year; 
     auxItemID := '&ItemID'; 
     auxState := '&State'; 
     auxDebyCost := &Deby_Cost; 
     auxLostCost := &Lost_Cost; 
     auxAddress := '&Location'; 
     addVideo_library(auxTitle, auxYear, auxItemID, auxState, auxDebyCost, auxLostCost, auxAddress); 
 END; 
 / 
 SELECT * FROM video; 
  
  
  
 --13�
 CREATE OR REPLACE PROCEDURE removeItem_library(auxItemID IN VARCHAR2) 
 IS 
   auxBook NUMBER; 
   auxVideo NUMBER; 
 BEGIN 
   SELECT COUNT(*) INTO auxBook 
   FROM book 
   WHERE bookid LIKE auxItemID; 
  
   SELECT COUNT(*) INTO auxVideo 
   FROM video 
   WHERE videoid LIKE auxItemID; 
  
   IF auxBook > 0 THEN 
     DELETE FROM book 
     WHERE bookid LIKE auxItemID; 
     DBMS_OUTPUT.PUT_LINE('Book removed correctly'); 
   ELSIF auxVideo > 0 THEN 
     DELETE FROM video 
     WHERE videoid LIKE auxItemID; 
     DBMS_OUTPUT.PUT_LINE('Video removed correctly'); 
   END IF; 
 END; 
 / 
 SET SERVEROUTPUT ON; 
 DECLARE 
   auxItemID VARCHAR2(10); 
 BEGIN 
   auxItemID := '&ItemID_to_remove'; 
   removeItem_library(auxItemID); 
 END; 
 / 
  
  
 --14�
 --The statement indicates the creation of another function, but we have made function five meet both needs�
  
  
 --14�
 
 select * from customer;
 CREATE OR REPLACE PROCEDURE viewCustomer_library(auxCustomerID IN NUMBER) 
 IS 
   custoName VARCHAR2(40); 
   custoAdd VARCHAR2(50); 
   custoPhone NUMBER(9); 
   userNaM VARCHAR2(10); 
   custoDate DATE; 
   custoCard NUMBER; 
 BEGIN 
   SELECT name,customeraddress,phone,username,datesignup,cardnumber 
   INTO custoName, custoAdd, custoPhone, userNaM, custoDate, custoCard 
   FROM customer 
   WHERE customerid LIKE auxCustomerID; 
  
   DBMS_OUTPUT.PUT_LINE('CUSTOMER ' || auxCustomerID || ' INFO'); 
   DBMS_OUTPUT.PUT_LINE('------------------------------------------'); 
   DBMS_OUTPUT.PUT_LINE('NAME: ' || custoName); 
   DBMS_OUTPUT.PUT_LINE('ADDRESS: ' || custoAdd); 
   DBMS_OUTPUT.PUT_LINE('PHONE: ' || custoPhone); 
   DBMS_OUTPUT.PUT_LINE('USER NAME: ' || userNaM); 
   DBMS_OUTPUT.PUT_LINE('DATE OF SIGN UP: ' || custoDate); 
   DBMS_OUTPUT.PUT_LINE('CARD NUMBER: ' || custoCard); 
   DBMS_OUTPUT.PUT_LINE('------------------------------------------'); 
  
 END; 
  
 SET SERVEROUTPUT ON; 
 DECLARE 
   auxCustoID VARCHAR2(10); 
 BEGIN 
   auxCustoID := &CustomerID; 
   viewCustomer_library(auxCustoID); 
 END; 
 / 
  
  
 --OBJECT�
 CREATE OR REPLACE TYPE director_library AS OBJECT( 
 Employeeid NUMBER, 
 Name VARCHAR2(40), 
 Address VARCHAR2(50), 
 Phone INT(9), 
 Paycheck NUMBER(10,2), 
 Extrapaycheck NUMBER(10,2) 
 ); 
/



 SET SERVEROUTPUT ON; 
 DECLARE  
    Director director_library;  
 BEGIN  
    Director := director_library('212', 'CHANDLER', 'OUR HEARTHS', 688688688,1150.5,500);  
    Dbms_output.put_line('DIRECTOR ID: '|| director.employeeid);  
    Dbms_output.put_line('--------------------------------------------' );  
    Dbms_output.put_line('NAME: '|| director.name);  
    Dbms_output.put_line('ADDRESS: '|| director.address);  
    Dbms_output.put_line('PHONE: '|| director.phone);  
    Dbms_output.put_line('PAYCHECK: '|| director.paycheck);  
    Dbms_output.put_line('EXTRA: '|| director.extrapaycheck); 
    Dbms_output.put_line('--------------------------------------------' );  
 END;
 /
 
CREATE TABLE rent_his(cardid number,itemid varchar2(20),returndate date);
/
select * from rent_his;
 CREATE OR REPLACE TRIGGER addrentdetails_trg
 BEFORE INSERT OR DELETE  ON rent
 FOR EACH ROW
 BEGIN
 IF inserting THEN
 insert into rent_his values(:new.cardid,:new.itemid,:new.returndate);
END IF; 
IF deleting THEN
 insert into rent_his values(:old.cardid,:old.itemid,:old.returndate);
END IF;
 END;
 /
 
 --------------------------------------------------------------end--------------------------------------------------------------------
 