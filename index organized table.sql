
--iod
-- this is normal tb

CREATE TABLE ind_tb(roll_number NUMBER);
INSERT INTO ind_tb VALUES(101);
INSERT INTO ind_tb VALUES(104);
INSERT INTO ind_tb VALUES(103);
INSERT INTO ind_tb VALUES(106);
INSERT INTO ind_tb VALUES(102);
INSERT INTO ind_tb VALUES(105);
INSERT INTO ind_tb VALUES(107);

SELECT * FROM ind_tb;


-- this is index organized tb

DROP TABLE ind_tb;

CREATE TABLE ind_tb(roll_number NUMBER CONSTRAINT prm PRIMARY KEY)ORGANIZATION INDEX ;
INSERT INTO ind_tb VALUES(101);
INSERT INTO ind_tb VALUES(104);
INSERT INTO ind_tb VALUES(103);
INSERT INTO ind_tb VALUES(106);
INSERT INTO ind_tb VALUES(102);
INSERT INTO ind_tb VALUES(105);
INSERT INTO ind_tb VALUES(107);

SELECT * FROM ind_tb;

--see the result tis is IOT
