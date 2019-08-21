
SELECT COUNT(*)
FROM reviews;

use [AdventureWorks2014]

SELECT * FROM [HumanResources].[Department]

--SHOW ME ALL DEPT NAMES

SELECT Name 
FROM HumanResources.Department

-- SHOW ME ALL THE GROUPS

SELECT GroupName FROM HumanResources.Department

-- SHOW ME ALL THE DISTINCT GROUPS

SELECT DISTINCT GroupName FROM HumanResources.Department

--SELECT RECORDS WITH MANUFACTURING IN THEM

SELECT Name, GroupName from HumanResources.Department
    WHERE GroupName Like 'MANUFACTURING'

-- GIVE ME ALL THE EMPLOYEES FROM THE EMPLOYEE TABLE

SELECT * FROM HumanResources.Employee

--GIVE ME A LIST OF ALL EMPLOYEE WHO HAVE ORGLEVEL OF 2
SELECT * FROM HumanResources.Employee WHERE OrganizationLevel = 2

--GIVE ME A LIST OF ALL EMPLOYEES WHO HAVE ORGLEVEL = 2 OR 3
SELECT * FROM HumanResources.Employee WHERE OrganizationLevel IN (2,3)

--GIVE ME A LIST OF EMPLOYEES WHO HAVE A TITLE OF FACILITIES MANAGER
SELECT * FROM HumanResources.Employee WHERE JobTitle LIKE 'Facilities Manager'

--GIVE ME ALL EMPLOYEES WHO HAVE THE WORD CONTROL IN THEIR TITLE

SELECT * FROM HumanResources.Employee WHERE JobTitle LIKE '%Control%'

--GIVE ME ALL EMPLOYEES BORN AFTER JAN 1, 1980
SELECT * FROM HumanResources.Employee WHERE BirthDate > '1/1/1980' 

--GIVE ME ALL EMPLOYEES BORN BETWEEN JAN 1, 1970 AND JAN 1, 1980
SELECT * FROM HumanResources.Employee WHERE BirthDate > '1/1/1970' AND BirthDate < '1/1/1980'
SELECT * FROM HumanResources.Employee WHERE BirthDate BETWEEN '1/1/1970' AND '1/1/1980'

--CALCULATED COLUMNS.
SELECT Name, ListPrice FROM Production.Product

SELECT Name, ListPrice, ListPrice + 10 AS ADJUSTED_LIST_PRICE FROM Production.Product

--INTO
--CREATES NEW TABLE BASED ON PRODUCTION.PRODUCT TABLE

SELECT NAME, LISTPRICE, LISTPRICE + 10 AS ADJUSTED_LIST_PRICE INTO PRODUCTION.PRODUCT_2 FROM Production.Product

--CHECK TO SEE IF NEW TABLE WAS CREATED
SELECT * FROM Production.PRODUCT_2

--creates temporary table, only availble to me, not saved in the DB like the table above.

seLECT NAME, LISTPRICE, LISTPRICE + 10 AS ADJUSTED_LIST_PRICE INTO #tmpname FROM Production.Product

SELECT * FROM #tmpname

--DELETE DATA FROM A TABLE

--DELETE ROW WITH NAME BEARING BALL
DELETE FROM Production.PRODUCT_2 WHERE NAME LIKE 'BEARING BALL'
SELECT * FROM Production.PRODUCT_2

--UPDATE DATA

UPDATE Production.PRODUCT_2 
SET NAME = 'BLADE_NEW'
WHERE NAME LIKE 'BLADE'

SELECT * FROM Production.PRODUCT_2

---------------------------------------------------
---------------------------------------------------
-------------------JOINS-----------------------------
---------------------------------------------------
---------------------------------------------------

CREATE TABLE MYEMPLOYEE (
    EMPLOYEEID INT,
    FIRSTNAME VARCHAR(20),
    LASTNAME VARCHAR(20)
)

INSERT INTO MYEMPLOYEE VALUES (1, 'MICHAEL', 'SCOTT')
INSERT INTO MYEMPLOYEE VALUES (2, 'PAM', 'BEESLY')
INSERT INTO MYEMPLOYEE VALUES (3, 'DWIGHT', 'SCHRUTE')

SELECT * FROM MYEMPLOYEE

create table MYSALARY (EMPLOYEEID INT, SALARY FLOAT)

INSERT INTO MYSALARY VALUES (1, 10000)
INSERT INTO MYSALARY VALUES (2, 8000)
INSERT INTO MYSALARY VALUES (3, 6000)
INSERT INTO MYSALARY VALUES (4, 7000)

SELECT * FROM MYEMPLOYEE
SELECT * FROM MYSALARY

SELECT A.FIRSTNAME, A.LASTNAME, B.SALARY 
FROM MYEMPLOYEE A INNER JOIN MYSALARY B ON A.EMPLOYEEID = B.EMPLOYEEID

--LEFT OUTER JOIN
CREATE TABLE MYPHONE (EMPLOYEEID INT, PHONENUMBER INT)

INSERT INTO MYPHONE VALUES (1, 121212121)
INSERT INTO MYPHONE VALUES (2, 1212124564)

SELECT * FROM MYEMPLOYEE
SELECT * FROM MYPHONE

SELECT A.EMPLOYEEID, A.FIRSTNAME, A.LASTNAME, B.PHONENUMBER
 FROM MYEMPLOYEE A LEFT JOIN MYPHONE B ON A.EMPLOYEEID = B.EMPLOYEEID

 --RIGHT OUTER JOIN

CREATE TABLE PARKINGSPOT (EMPLOYEE_ID INT, PARKING_SPOT VARCHAR(29))

INSERT INTO PARKINGSPOT VALUES (1, 'A1')
INSERT INTO PARKINGSPOT VALUES (2, 'A2')

SELECT * FROM PARKINGSPOT

CREATE TABLE EMPNAME (EMPLOYEE_ID INT, EMPLOYEE_NAME VARCHAR(40))

INSERT INTO EMPNAME VALUES(1, 'RAKESH')
INSERT INTO EMPNAME VALUES(2, 'JOHN')
INSERT INTO EMPNAME VALUES(3, 'MICHAEL')
INSERT INTO EMPNAME VALUES(4, 'BRIAN')

SELECT * FROM PARKINGSPOT
SELECT * FROM EMPNAME

SELECT A.PARKING_SPOT, B.EMPLOYEE_ID, B.EMPLOYEE_NAME
FROM PARKINGSPOT A RIGHT JOIN EMPNAME B ON A.EMPLOYEE_ID = B.EMPLOYEE_ID

----FULL OUTER JOIN

CREATE TABLE CUSTNAME (CUSTOMER_ID INT, CUSTOMER_NAME VARCHAR(34))

INSERT INTO CUSTNAME VALUES (1, 'RAKESH')
INSERT INTO CUSTNAME VALUES (3, 'JOHN')

CREATE TABLE ORDERS (ORDER_NO INT, ORDER_NAME VARCHAR(34), CUSTOMER_ID INT)

INSERT INTO ORDERS VALUES (1, 'SOMEORDER1', 1)
INSERT INTO ORDERS VALUES (2, 'SOMEORDER2', 2)
INSERT INTO ORDERS VALUES (3, 'SOMEORDER3', 7)
INSERT INTO ORDERS VALUES (4, 'SOMEORDER4', 8)

SELECT * FROM CUSTNAME
SELECT * FROM ORDERS

SELECT A.CUSTOMER_ID, A.CUSTOMER_NAME, B.ORDER_NO, B.ORDER_NAME
FROM CUSTNAME A FULL OUTER JOIN ORDERS B ON A.CUSTOMER_ID = B.CUSTOMER_ID

----CROSS JOIN----

CREATE TABLE DEPTNO (EMPLOYEEID INT, DEPARTMENTID VARCHAR(44))

INSERT INTO DEPTNO VALUES (1, 'A1')
INSERT INTO DEPTNO VALUES (2, 'A2')

CREATE TABLE DEPTNAME (DEPARTMENTID VARCHAR(44), DEPTNAME VARCHAR(33))

INSERT INTO DEPTNAME VALUES ('A1', 'SALES')
INSERT INTO DEPTNAME VALUES ('A2', 'MARKETING')

SELECT * FROM DEPTNO
SELECT * FROM DEPTNAME

SELECT * 
FROM DEPTNO A CROSS JOIN DEPTNAME B
