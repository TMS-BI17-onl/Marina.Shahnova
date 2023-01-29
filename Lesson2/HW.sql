--HOMEWORK LESSON2
USE AdventureWorks2017

--TASK 1A
SELECT *
FROM Sales.SalesTerritory 

--TASK 1B
SELECT TerritoryID ,Name 
FROM Sales.SalesTerritory 

--TASK 1C
SELECT *
FROM Person.Person 
WHERE LastName = 'Norman'

--TASK 1D
SELECT *
FROM Person.Person 
WHERE EmailPromotion<>2


/* TASK  3 
  BESIDES MIN, MAX, SUM, AVG, COUNT
  T-SQL provides the following aggregate functions:
	APPROX_COUNT_DISTINCT
	CHECKSUM_AGG
	COUNT_BIG
	GROUPING
	GROUPING_ID
	STDEV
	STDEVP
	STRING_AGG
	VAR
	VARP
*/
--EXAMPLE 1
SELECT CHECKSUM_AGG(SalesOrderID)
FROM Sales.SalesOrderDetail

--EXAMPLE 2
SELECT STDEVP(ListPrice) AS STDEVP_ListPrice 
FROM Production.ProductListPriceHistory

--EXAMPLE 3
SELECT ProductID, STDEV(ListPrice) AS STDEV_ListPrice 
FROM Production.ProductListPriceHistory
GROUP BY ProductID

--EXAMPLE 4
SELECT STRING_AGG(CurrencyCode, ' ;')  AS CC
FROM Sales.Currency

--EXAMPLE 5
SELECT ProductID, MIN(ListPrice) AS MIN_ListPrice , GROUPING(ProductID) AS GROUPING_ProductID 
FROM Production.ProductListPriceHistory
GROUP BY ProductID  WITH ROLLUP

--EXAMPLE 6
SELECT YEAR(ModifiedDate) AS MODYEAR, ProductID, VAR(LineTotal) AS VAR_TOTAL, GROUPING_ID(YEAR(ModifiedDate),ProductID) as GR_ID  
FROM Sales.SalesOrderDetail
GROUP BY ROLLUP (YEAR(ModifiedDate),ProductID)
ORDER BY YEAR(ModifiedDate),ProductID 

--TASK 4A
SELECT COUNT( DISTINCT PersonType)
FROM Person.Person
WHERE LastName LIKE 'Ì%' OR EmailPromotion<>1

--TASK 4B
 SELECT TOP 3  *
 FROM Sales.SpecialOffer
 WHERE StartDate>='2013-01-01' AND StartDate<='2014-01-01'  
 ORDER BY DiscountPct DESC

 --TASK 4C
 SELECT MIN(Weight) as min_weight, MAX(Size) as max_size
 FROM  Production.Product

 --TASK 4D
 SELECT ProductSubcategoryID,MIN(Weight) as min_weight, MAX(Size) as max_size
 FROM  Production.Product
 GROUP BY ProductSubcategoryID

 --TASK 4E 
 SELECT ProductSubcategoryID,MIN(Weight) as min_weight, MAX(Size) as max_size
 FROM  Production.Product
 WHERE Color IS NOT NULL
 GROUP BY ProductSubcategoryID