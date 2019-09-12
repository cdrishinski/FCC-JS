
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

---------------

SELECT GETDATE() --GIVES CURRENT DATE

SELECT GETDATE() - 2

------DATEPART

SELECT DATEPART(yyyy, GETDATE()) AS YEARNUMBER
SELECT DATEPART(MM, GETDATE()) AS MONTHNUMBER
SELECT DATEPART(DD, GETDATE()) AS DAYNUMBER


----DATEADD

SELECT DATEADD(DAY, 4, GETDATE())
SELECT DATEADD(MONTH, 4, GETDATE())
SELECT DATEADD(YEAR, 4, GETDATE())

-----

SELECT TOP 10 * FROM Production.WorkOrder

SELECT WorkOrderID, productID, StartDate, EndDate, DATEDIFF(day, startdate, enddate)
from Production.WorkOrder

SELECT DATEADD( DD, -([DATEPART](DAY, GETDATE()) -1 ), GETDATE())

---AGGREGATE FUNCTIONS

SELECT * FROM MYSALARY

SELECT AVG(SALARY) FROM MYSALARY

SELECT COUNT(*) FROM MYSALARY

SELECT SUM(SALARY) FROM MYSALARY

SELECT MIN(SALARY) FROM MYSALARY

SELECT MAX(SALARY) FROM MYSALARY


--MYORDER
SELECT * FROM ORDERS

--concat
PRINT CONCAT('STRING1', ' STRING2')

SELECT ORDER_NO, ORDER_NAME, CONCAT(ORDER_NAME, ' ', ORDER_NAME) AS CONCATENATEDTEXT 
FROM ORDERS

SELECT ORDER_NO, ORDER_NAME, CONCAT(ORDER_NAME, ' ', RAND()) AS CONCATENATEDTEXT 
FROM ORDERS

----LEFT

SELECT ORDER_NO, ORDER_NAME, LEFT(ORDER_NAME, 5) FROM ORDERS

--RIGHT
SELECT ORDER_NO, ORDER_NAME, RIGHT(ORDER_NAME, 5) FROM ORDERS

--SUBSTRING
SELECT ORDER_NO, ORDER_NAME, SUBSTRING(ORDER_NAME, 2, 5) FROM ORDERS

--lowercase
SELECT ORDER_NO, ORDER_NAME, LOWER(ORDER_NAME) FROM ORDERS

--UPPERCASE
SELECT ORDER_NO, ORDER_NAME, UPPER(ORDER_NAME) FROM ORDERS

--LENGTH
SELECT ORDER_NO, ORDER_NAME, LEN(ORDER_NAME) FROM ORDERS

--CAPITALIZE FIRST LETER, LOWERCASE THE REST

SELECT ORDER_NO, ORDER_NAME, CONCAT(UPPER(LEFT(ORDER_NAME, 1)), LOWER(SUBSTRING(ORDER_NAME, 2, LEN(ORDER_NAME)))) FROM ORDERS

--TRIM
SELECT LEN('     MYTEST     ')

--LTRIM - REMOVE SPACES ON LEFT OF TEXT
SELECT LTRIM('    MYEXT       ')
--RTRIM - REMOVE SPACES ON RIGHT OF TEXT
SELECT RTRIM('    MYEXT       ')

use AdventureWorks2014 

select * from person.Person
WHERE FirstName = 'ken'

select top 10 * from person.Person
select top 10 * from person.StateProvince

create TABLE A_friends(
    FriendID int NOT NULL,
    FName VARCHAR(20) NOT NULL,
    LName VARCHAR(20) NOT NULL,
    Phone INT,
    Email VARCHAR(30),
    DoB DATE,
    PRIMARY KEY (FriendID)
)

SELECT * FROM HumanResources.Department

CREATE VIEW V_HR
AS SELECT DEPARTMENTID, GROUPNAME
FROM HumanResources.Department

SELECT TOP (1000) [DEPARTMENTID]
      ,[GROUPNAME]
  FROM [AdventureWorks2014].[dbo].[V_HR]

  -- VIEWS (US VIEW)
CREATE VIEW MyCustomUSView
AS  
SELECT * FROM AdventureWorks2014.SALES.SalesTerritory
WHERE CountryRegionCode LIKE 'US'

SELECT * FROM MyCustomUSView


  CREATE VIEW NASalesQuota
AS
SELECT [Name], [Group], [SalesQuota], [Bonus]
FROM AdventureWorks2014.sales.SalesTerritory A INNER JOIN sales.salesperson B
ON a.TerritoryID = b.TerritoryID
WHERE [Group] LIKE 'NORTH AMERICA'

select * FROM NASalesQuota

------TRIGGERS--------


-------------------------------------
----------TABLE LEVEL TRIGGER--------
-------------------------------------
SELECT * FROM HumanResources.Shift


--WHEN INSERT OCCURS ON HUMANRESOURCES.SHIFT, NOTIFY MANAGEMENT BY ROLLING IT BACK

CREATE TRIGGER DemoTrigger
on HumanResources.Shift
after insert
as
begin
PRINT 'Insert is not allowed.  You need approval'
ROLLBACK TRANSACTION
END
GO

----TEST THE ABOVE TRIGGER
INSERT INTO HumanResources.Shift ([Name], [STARTTIME], [ENDTIME], [MODIFIEDDATE])
VALUES (
    'RAKESH2',
    '07:00:00',
    '8:00:00',
    getdate()
    )

-------------------------------------
-------DATABASE LEVEL TRIGGER--------
-------------------------------------

CREATE TRIGGER DEMO_DBLEVELTRIGGER
ON DATABASE
AFTER CREATE_TABLE
AS
BEGIN
PRINT 'CREATION OF NEW TABLES IS NOT ALLOWED'
ROLLBACK TRANSACTION
END
GO

CREATE TABLE MYDEMOTABLE( COL1 VARCHAR(90))


-- DROP THE TRIGGER-----
DROP TRIGGER IF EXISTS DEMO_DBLEVELTRIGGER
ON DATABASE


-------------------------------------
-------COMPUTED COLUMNS--------------
-------------------------------------
CREATE TABLE COMP_COLUMNS (
    firstname VARCHAR(40),
    lastname VARCHAR(40),
    fullname as firstname + ' ' +lastname
                )


INSERT INTO COMP_COLUMNS
VALUES ('CLARK', 'D')

SELECT * FROM COMP_COLUMNS

------------------------------------
-------STORED PROCEDURES-------------
-------------------------------------

CREATE PROCEDURE MyTestProc
AS
SET NOCOUNT ON --TELLS YOU NUMBER OF ROWS AFFECTED IN MESSAGES TAB
SELECT * FROM HumanResources.Shift


EXECUTE MyTestProc

CREATE PROCEDURE MyTestProc2
AS
SET NOCOUNT OFF --TELLS YOU NUMBER OF ROWS AFFECTED IN MESSAGES TAB
SELECT * FROM HumanResources.Shift

EXEC MyTestProc2

DROP PROC MyTestProc2

----USING PARAMETERS IN PROCS-------
CREATE PROCEDURE MyFirstParamProcedure
@Param_Name VARCHAR(30)
as
set NOCOUNT ON
select * from HumanResources.Shift
where Name = @Param_Name

EXEC MyFirstParamProcedure @Param_Name = 'Day'
--EXEC MyFirstParamProcedure 'Day' also works

CREATE PROCEDURE MyFirstParamProcedure2
@Param_Name VARCHAR(30) = 'EVENING' --SETS DEFAULT VALUE IF NO PARAM IS PASSED
as
set NOCOUNT ON
select * from HumanResources.Shift
where Name = @Param_Name

EXEC MyFirstParamProcedure2

-----OUTPUT PARAMETER---------
--STORE RESULTS INTO PARAMETER THEN ACCES FROM OUTPUT
CREATE PROC MyOutputSP
@TopShift VARCHAR(50) OUTPUT
AS
set @TopShift = (select top(1) shiftID from HumanResources.Shift)

DECLARE @outputresult VARCHAR(50)
EXEC MyOutputSP @outputresult output
SELECT @outputresult


--returning values from stored procedures------
CREATE PROC myFirstReturningSP
AS
RETURN 12

DECLARE @returnvalue INT
EXEC @returnvalue = myFirstReturningSP
select @returnvalue


--CREATE UPDATE TRIGER AND SEND EMAIL

select * from Sales.SpecialOffer

CREATE TRIGGER TRIGGER_QUIZ
ON SALES.SpecialOffer
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (select 1 from inserted where DiscountPct > .01)
    BEGIN
        EXEC msdb.dbo.sp_send_dbmail
            @recipients = 'clark@clark.com',
            @profile_name = 'default',
            @subject = 'Pct change',
            @body = 'Something changed'
    END
END
GO


update sales.SpecialOffer
set DiscountPct = 0.4
where SpecialOfferID = 1


-- Create a table similar to Purchasing.Vendor with an extra column. Call that column VendorCode.
-- The vendorCode should in the following format:
-- [CreditRating]_[PreferredVendorStatus]_2*CreditRating

select * from purchasing.vendor 

select * INTO CompColQuiz
from Purchasing.Vendor

select * from CompColQuiz

alter table CompColQuiz
add VendorCode as ([CreditRating]+[PreferredVendorStatus]+2*CreditRating)

-- Create a table similar to Production.ProductCostHistory and add an extra column to compute
-- the StandardCost in Euros i.e Standardcost * 0.89. Call this column StandardCostEuros

select * into CompColQuiz2
FROM Production.ProductCostHistory

select * from CompColQuiz2

ALTER Table CompColQuiz2
add StandardCostEuros as (StandardCost * 0.89)

-- What is the difference between a stored procedure and a trigger? 
--Stored procedure is duplicated code to be executed when called.
--a trigger executes automatically based on an event that occurs.  

-- 2. Write a stored procedure to return the # of employees and department name when group name
-- is passed as a parameter. 
-- hint: check humanresource.employee, humanresources.department,
-- humanresources.employeedepartmenthistory 

select * from HumanResources.Employee
select * from HumanResources.Department
select * from HumanResources.EmployeeDepartmentHistory

select distinct jobtitle, count(*) from HumanResources.Employee group by JobTitle

CREATE PROCEDURE ProcQuiz1
AS
SET NOCOUNT ON 
select distinct JobTitle, count(*) 
    from HumanResources.Employee
    group by JobTitle

exec procquiz1

-- 3. Explore the &quot;WITH RECOMPILE&quot; option. 
-- 4. What is the difference between &quot;SET NOCOUNT ON&quot; and &quot;SET NOCOUNT OFF&quot;
--nocount on prevents the message being displayed that shows how many rows were affected.  nocount off is the opposite and shows how many rows were affected.


-- What is the difference between a stored procedure and a trigger? 
--Stored procedure is duplicated code to be executed when called.
--a trigger executes automatically based on an event that occurs.  

-- 2. Write a stored procedure to return the # of employees and department name when group name
-- is passed as a parameter. 
-- hint: check humanresource.employee, humanresources.department,
-- humanresources.employeedepartmenthistory 

select * from HumanResources.Employee
select * from HumanResources.Department
select * from HumanResources.EmployeeDepartmentHistory

select distinct jobtitle, count(*) from HumanResources.Employee group by JobTitle

CREATE PROCEDURE ProcQuiz1
AS
SET NOCOUNT ON 
select distinct JobTitle, count(*) 
    from HumanResources.Employee
    group by JobTitle

exec procquiz1

-- 3. Explore the &quot;WITH RECOMPILE&quot; option. 
-- 4. What is the difference between &quot;SET NOCOUNT ON&quot; and &quot;SET NOCOUNT OFF&quot;
--nocount on prevents the message being displayed that shows how many rows were affected.  nocount off is the opposite and shows how many rows were affected.




------------------------------------
-------USER DEFINED FUNCTIONS--------
-------------------------------------


--SCALAR FUNCTIONS (MOST BASIC TYPE)---


SELECT * FROM SALES.SalesTerritory

CREATE FUNCTION YTDSALES()
RETURNS MONEY
AS 
BEGIN
DECLARE @YTDSALES MONEY
SELECT @YTDSALES = SUM(SALESYTD) FROM SALES.SalesTerritory
RETURN @YTDSALES
END

--TO CALL FUNCTION  CREATE VARIABLE WITH DATA TYPE
DECLARE @YTDRESULTS AS MONEY
--QUERY THAT VARIABLE BY ASSIGNING WHAT THE FUNCTION IS RETURNING TO IT
SELECT @YTDRESULTS = DBO.YTDSALES()
--PRINT THAT VARIABLE
PRINT @YTDRESULTS

DROP FUNCTION YTDSALES

---PARAMETERIZED FUNCTIONS-----
CREATE FUNCTION YTD_GROUP (@GROUP VARCHAR(50))

RETURNS MONEY
AS
BEGIN
DECLARE @YTDSALES AS MONEY
SELECT @YTDSALES = SUM(SALESYTD)
FROM Sales.SalesTerritory
WHERE [GROUP] = @GROUP
RETURN @YTDSALES
END

DECLARE @RESULTS MONEY
SELECT @RESULTS = DBO.YTD_GROUP('NORTH AMERICA')
PRINT @RESULTS

DROP FUNCTION YTD_GROUP

-----TABLE VALUE FUNCTION---------
CREATE FUNCTION ST_TABLEVALUED (@TERRITORYID INT)
    RETURNS TABLE
    AS  
    RETURN SELECT NAME, COUNTRYREGIONCODE, [GROUP], SALESYTD
    FROM SALES.SalesTerritory
    WHERE TERRITORYID = @TERRITORYID

SELECT * FROM ST_TABLEVALUED(7)

CREATE FUNCTION udf2 (@TERRITORYID INT)
    RETURNS TABLE
    AS  
    RETURN SELECT NAME, COUNTRYREGIONCODE, [GROUP], SALESYTD
    FROM SALES.SalesTerritory
    WHERE TERRITORYID = @TERRITORYID
    exec procquiz1

SELECT * FROM ST_TABLEVALUED(7)

USE [AdventureWorks2014]
GO
/****** Object:  Table [dbo].[Circle]    Script Date: 8/17/2015 6:24:00 PM ******/ 
SET ANSI_NULLS ON 
GO
SET QUOTED_IDENTIFIER ON 
GO
CREATE TABLE [dbo].[Circle]( 
[CircleID] [int] NULL, 
[Radius] [float] NULL, 
[Area] [float] NULL 
) ON [PRIMARY] 
 
 
GO
INSERT [dbo].[Circle] ([CircleID], [Radius], [Area]) VALUES (1, 3, NULL) 
GO
INSERT [dbo].[Circle] ([CircleID], [Radius], [Area]) VALUES (2, 5, NULL) 
GO
INSERT [dbo].[Circle] ([CircleID], [Radius], [Area]) VALUES (3, 3.2, NULL) 
GO
INSERT [dbo].[Circle] ([CircleID], [Radius], [Area]) VALUES (4, 5.76, NULL) 
GO
INSERT [dbo].[Circle] ([CircleID], [Radius], [Area]) VALUES (5, 3.22, NULL) 
GO
INSERT [dbo].[Circle] ([CircleID], [Radius], [Area]) VALUES (6, 4, NULL) 
GO
INSERT [dbo].[Circle] ([CircleID], [Radius], [Area]) VALUES (7, 3.66, NULL) 
GO
INSERT [dbo].[Circle] ([CircleID], [Radius], [Area]) VALUES (8, 9.22332, NULL) 
GO
INSERT [dbo].[Circle] ([CircleID], [Radius], [Area]) VALUES (9, 12, NULL) 
GO
INSERT [dbo].[Circle] ([CircleID], [Radius], [Area]) VALUES (10, 10, NULL) 
GO

select * FROM [dbo].[Circle]

create FUNCTION areaFunc()
returns FLOAT
AS
BEGIN
declare @AREA as FLOAT
select @AREA = radius * radius * 3.14
    FROM dbo.Circle
return @AREA
END
GO

--TO CALL FUNCTION  CREATE VARIABLE WITH DATA TYPE
DECLARE @X AS FLOAT
--QUERY THAT VARIABLE BY ASSIGNING WHAT THE FUNCTION IS RETURNING TO IT
SELECT @X = DBO.AREAFUNC()
--PRINT THAT VARIABLE

update [dbo].[Circle]
SET Area = @X
WHERE CircleID

----TRANSACTIONS AND ERROR HANDLING----
SELECT * FROM Sales.SalesTerritory

BEGIN TRANSACTION
    UPDATE Sales.SalesTerritory
    SET COSTYTD = 1.00
    WHERE TerritoryID = 1
COMMIT TRANSACTION


--@@error 0 = succes, > 0 means error

DECLARE @ERRORRESULTS VARCHAR(50)
BEGIN TRANSACTION
    INSERT INTO Sales.SalesTerritory
    VALUES('ABC','US', 'NA', 1.00, 1.00, 1.00, 1.00, '6dc4165a-5e4c-42d2-809d-4344e0ac75e9', GETDATE())

SET @ERRORRESULTS = @@ERROR
IF(@ERRORRESULTS = 0)
BEGIN
PRINT 'SUCCESS'
COMMIT TRANSACTION
END

ELSE
BEGIN
    PRINT 'STATEMENT FAILED'
    ROLLBACK TRANSACTION
END

--CUSTOM ERROR MESSAGE

DECLARE @ERRORRESULTS VARCHAR(50)
BEGIN TRANSACTION
    INSERT INTO Sales.SalesTerritory
    VALUES('ABC','US', 'NA', 1.00, 1.00, 1.00, 1.00, '6dc4165a-5e4c-42d2-809d-4344e0ac75e9', GETDATE())

SET @ERRORRESULTS = @@ERROR
IF(@ERRORRESULTS = 0)
BEGIN
PRINT 'SUCCESS'
COMMIT TRANSACTION
END

ELSE
BEGIN
    RAISERROR('STATEMENT FAILED!!!!', 16, 1)
    ROLLBACK TRANSACTION
END

---TRY AND CATCH---
BEGIN TRY
BEGIN TRANSACTION

DECLARE @ERRORRESULTS VARCHAR(50)
BEGIN TRANSACTION
    INSERT INTO Sales.SalesTerritory
    VALUES('ABC','US', 'NA', 1.00, 1.00, 1.00, 1.00, '6dc4165a-5e4c-42d2-809d-4344e0ac75e9', GETDATE())
    COMMIT TRANSACTION
END TRY

BEGIN CATCH
    PRINT 'CATCH STATEMENT ENTERED'
    ROLLBACK TRANSACTION
END CATCH


---COMMON TABLE EXPRESSION (CTE)---
SELECT * FROM Sales.SalesTerritory

WITH CTE_SALESTERR
AS 
(
    SELECT NAME, COUNTRYREGIONCODE  FROM Sales.SalesTerritory
)

SELECT * FROM CTE_SALESTERR
WHERE NAME LIKE 'NORTH%';

----GROUPING SETS-------

--GROUP BY
SELECT * FROM Sales.SalesTerritory

SELECT [NAME], CountryRegionCode, [GROUP], SUM(SALESYTD) 
FROM Sales.SalesTerritory
GROUP BY GROUPING SETS
(
    (Name),
    (Name, CountryRegionCode),
    (Name, CountryRegionCode,[Group])
)

----ROLLUP
SELECT NAME, COUNTRYREGIONCODE, [GROUP], SUM(SALESYTD)
FROM Sales.SalesTerritory
GROUP BY ROLLUP (
    (Name, CountryRegionCode,[Group])
)

--CUBE
SELECT NAME, COUNTRYREGIONCODE, [GROUP], SUM(SALESYTD)
FROM Sales.SalesTerritory
GROUP BY CUBE (
    (Name, CountryRegionCode,[Group])
)


---RANKING FUNCTIONS

SELECT * FROM Person.Address

SELECT PostalCode FROM Person.Address
WHERE PostalCode IN ('98052', '98207', '98055', '97205')

SELECT PostalCode,
ROW_NUMBER() OVER(ORDER BY POSTALCODE) AS 'ROW NUMBER',
RANK() OVER(ORDER BY POSTALCODE) AS 'RANK' --NEXT RANKED ITEM IS 96
FROM Person.Address
WHERE PostalCode IN ('98052', '98207', '98055', '97205')


SELECT PostalCode,
ROW_NUMBER() OVER(ORDER BY POSTALCODE) AS 'ROW NUMBER',
DENSE_RANK() OVER(ORDER BY POSTALCODE) AS 'DENSE RANK' --NEXT RANKED ITEM IS 2
FROM Person.Address
WHERE PostalCode IN ('98052', '98207', '98055', '97205')

SELECT PostalCode,
ROW_NUMBER() OVER(ORDER BY POSTALCODE) AS 'ROW NUMBER',
RANK() OVER(ORDER BY POSTALCODE) AS 'RANK',--NEXT RANKED ITEM IS 96
DENSE_RANK() OVER(ORDER BY POSTALCODE) AS 'DENSE RANK', --NEXT RANKED ITEM IS 2
NTILE(10) OVER(ORDER BY POSTALCODE) AS 'NTILE' --GROUPS RESULTS DATA INTO GROUPS
FROM Person.Address
WHERE PostalCode IN ('98052', '98207', '98055', '97205')

SELECT * FROM HumanResources.EmployeePayHistory

ALTER TABLE HumanResources.EmployeePayHistory
ADD ANNUAL_SALARY INT

    

INSERT INTO HumanResources.EmployeePayHistory(ANNUAL_SALARY)
VALUES (rate*payfrequency*12)

select *, (rate*payfrequency) AS 'ANLPAY',
RANK() OVER(ORDER BY 'ANLPAY') AS 'RANK'
FROM HumanResources.EmployeePayHistory



--------------------------
--------XML DATATYPES-----
--------------------------

CREATE TABLE SAMPLEXMLTABLE (XMLDATA XML)

SELECT * FROM SAMPLEXMLTABLE

insert into dbo.SAMPLEXMLTABLE (XMLDATA)
values (
    '<note>
    <to>Tove</to>
    <from>Jani</from>
    <heading>Reminder</heading>
    <body>Dont forget me this weekend!</body>
    </note>')

select * from Sales.SalesTerritory
for xml auto, elements, root ('Salesterritory')

select * from Sales.SalesTerritory
for xml RAW, elements, root ('Salesterritory')

select xmldata.query('./note/to') as [to]
from dbo.SAMPLEXMLTABLE

select xmldata.value('(/note/to)[1]', 'varchar(10)') as [to]
from dbo.SAMPLEXMLTABLE

select top 10 territoryid from Sales.SalesTerritory
for xml auto, elements, root('SalesTerritory')

select * from Sales.SalesTerritory
for xml RAW, elements, root ('Salesterritory')

DECLARE @xmlhandle int
DECLARE @xmldocument XML

set @xmldocument = (select * from sales.SalesTerritory
    for xml auto, elements, root('SalesTerritory'))

exec sp_xml_preparedocument @xmlhandle OUTPUT, @xmldocument

select * from openxml(@xmlhandle, '/SalesTerritory/Sales.SalesTerritory', 2)
with (TerritoryID int, SalesYTD money)

exec sp_xml_removedocument @xmlhandle

use devcamp_sql_course_schema;

select * 
from users
where users_email = 'kristine@test.com'
OR users_email = 'jordan@test.com';

select addresses_city, addresses_state
from addresses
where addresses_state = 'ny';

select * 
from addresses
where addresses_state = 'ny'
AND addresses_city = 'manhattan';


USE devcamp_sql_course_schema;

UPDATE users 
set users_email = 'update@test.com'
where users_id = 2;

SELECT * FROM USERS;

SELECT * FROM GUIDES;

UPDATE GUIDES
SET guides_title = 'SOMETHING ELSE'
WHERE GUIDES_TITLE = 'ANOTHER POST'
AND GUIDES_USERS_ID = 2;

UPDATE GUIDES
SET guides_title = 'SOMETHING ELSE AGAIN'
WHERE GUIDES_TITLE = 'SOMETHING ELSE'
AND GUIDES_USERS_ID = 1;

USE devcamp_sql_course_schema;

BEGIN;
UPDATE GUIDES
SET GUIDES_TITLE = 'OOPS'
WHERE GUIDES_USERS_ID = 1;

SELECT * FROM GUIDES;

USE devcamp_sql_course_schema;

SELECT DISTINCT GUIDES_TITLE
FROM GUIDES;

SELECT DISTINCT GUIDES_TITLE, GUIDES_USERS_ID, GUIDES_REVENUE
FROM GUIDES;

USE devcamp_sql_course_schema;

SELECT * FROM USERS
WHERE USERS_ID = 199;

BEGIN;
delete from users
where users_id = 199;

ROLLBACK;

USE devcamp_sql_course_schema;

select * from guides
where guides_revenue between 600 and 1000;

select * from guides
where guides_revenue not between 600 and 1000;


USE devcamp_sql_course_schema;

insert into guides (guides_revenue, guides_users_id, guides_title)
values (5000, 1, 'Another One of My Posts');

select *
from guides 
where guides_title like '%My%';

USE devcamp_sql_course_schema;
-- subqueries 
select guides_title, guides_revenue
from guides
where guides_revenue = (
	select max(cast(guides_revenue as unsigned))
	from guides
    )


select min(guides_revenue)
from guides;
    
    
    use devcamp_sql_course_schema;

select addresses_state, count(addresses_state)
from addresses
group by addresses_state;

select addresses_city, count(addresses_city)
FROM addresses
group by addresses_city;

select * from guides;

select guides_users_id, count(guides_title), sum(guides_revenue)
from guides
group by guides_users_id;


use devcamp_sql_course_schema;

select * from guides;

set SQL_SAFE_UPDATES = 0;

BEGIN;
UPDATE GUIDES
SET guides_qty = rand()*1000;

rollback;
