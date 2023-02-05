--TASK 4A
SELECT *
FROM Production.UnitMeasure

SELECT *
FROM Production.UnitMeasure
WHERE UnitMeasureCode LIKE 'T%'

INSERT INTO Production.UnitMeasure (UnitMeasureCode,Name,ModifiedDate)
VALUES ('TT1', 'Test 1', '2020-09-09'),
       ( 'TT2', 'Test 2', getdate())
--TASK 4B
SELECT UnitMeasureCode,Name,ModifiedDate
INTO Production.UnitMeasureTest
FROM Production.UnitMeasure
WHERE UnitMeasureCode LIKE 'T%'

INSERT INTO Production.UnitMeasureTest
SELECT UnitMeasureCode,Name,ModifiedDate
FROM Production.UnitMeasure
WHERE UnitMeasureCode='CAN'

SELECT *
FROM Production.UnitMeasureTest
ORDER BY UnitMeasureCode

--TASK 4C
UPDATE Production.UnitMeasureTest
SET UnitMeasureCode='TTT'

--TASK 4D
DELETE 
FROM Production.UnitMeasureTest
--TASK 4E
SELECT * 
FROM Sales.SalesOrderDetail
WHERE SalesOrderID IN (43659,43664)  

SELECT SalesOrderID, 
	   MAX(LineTotal) OVER( PARTITION BY SalesOrderID) AS "Max",
       MIN(LineTotal) OVER( PARTITION BY SalesOrderID) AS "Min", 
	   AVG(LineTotal) OVER( PARTITION BY SalesOrderID) AS "Avg"
FROM Sales.SalesOrderDetail

--TASK 4F
SELECT FirstName,LastName,TerritoryGroup,SalesYTD
      ,RANK() OVER (ORDER BY S.SalesYTD DESC) AS 'Rank'				
	  ,CONCAT(UPPER(LEFT(LASTNAME,3)),'Login',TerritoryGroup) AS'LOGIN'
FROM Sales.vSalesPerson S

SELECT TOP(1) WITH TIES FirstName,LastName,TerritoryGroup,SalesYTD
      ,RANK() OVER (ORDER BY S.SalesYTD DESC) AS 'Rank'				
FROM Sales.vSalesPerson S
ORDER BY Rank


SELECT TOP(1) WITH TIES FirstName,LastName,TerritoryGroup,SalesLastYear
      ,RANK() OVER (ORDER BY S.SalesLastYear DESC) AS 'Rank'				
FROM Sales.vSalesPerson S
ORDER BY Rank

SELECT TOP(1) WITH TIES FirstName,LastName,TerritoryGroup,SalesLastYear
      ,RANK() OVER (ORDER BY S.SalesLastYear ) AS 'Rank'				
FROM Sales.vSalesPerson S
ORDER BY Rank

--TASK 4G
DECLARE @DATE AS DATE = '2023-03-31'  -- ÃŒ∆ÕŒ »«Ã≈Õﬂ“‹ “ŒÀ‹ Œ  Õ”∆Õ€… √Œƒ » Ã≈—ﬂ÷ 
SELECT DATEADD(WEEK,DATEDIFF(WEEK, 0, (DATEADD(DAY, (6-DATEPART(DAY, @DATE)),@DATE))),0)