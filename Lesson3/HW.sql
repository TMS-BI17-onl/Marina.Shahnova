--HOMEWORK LESSON3
USE AdventureWorks2017

-- TASK 2A
SELECT Name, StandardCost,
	CASE WHEN StandardCost =0 THEN 'Not for sale'
	     WHEN  StandardCost >0 AND StandardCost <100  THEN '<$100'  
		 WHEN  StandardCost >=100 AND StandardCost <500  THEN ' <$500'
	ELSE 'Not for sale'
	END as PriceRange
FROM Production.Product

-- TASK 2B
SELECT PV.ProductID, PV.BusinessEntityID,V.Name
FROM Purchasing.ProductVendor PV JOIN  Purchasing.Vendor V ON PV.BusinessEntityID=V.BusinessEntityID
WHERE PV.StandardPrice>10 AND (V.Name LIKE '%X%' OR V.Name LIKE'N%')

-- TASK 2C
SELECT V.Name
FROM  Purchasing.Vendor V LEFT JOIN Purchasing.ProductVendor PV ON PV.BusinessEntityID=V.BusinessEntityID
WHERE PV.ProductID IS NULL

-- TASK 3A
SELECT PP.Name,PP.StandardCost
FROM Production.Product  PP JOIN Production.ProductModel PM ON PP.ProductModelID=PM.ProductModelID
WHERE PM.Name LIKE 'LL%'


--TASK 3B
SELECT Name
FROM Purchasing.Vendor
UNION
SELECT Name
FROM Sales.Store
ORDER BY NAME
 
--TASK 3C
SELECT P.NAME 
FROM  (SELECT SOP.ProductID AS PID,COUNT(1) AS CID
       FROM Sales.SpecialOffer SO JOIN Sales.SpecialOfferProduct SOP ON SO.SpecialOfferID=SOP.SpecialOfferID 
       GROUP BY SOP.ProductID) S  JOIN Production.Product P ON S.PID=P.ProductID
WHERE S.CID>1

--TASK 4
SELECT GETDATE()
SELECT DATENAME(weekday,BirthDate)
FROM HumanResources.Employee
SELECT DATEPART(weekday,BirthDate)
FROM HumanResources.Employee
SELECT DAY(BirthDate)
FROM HumanResources.Employee
SELECT MONTH(BirthDate)
FROM HumanResources.Employee
SELECT YEAR(BirthDate)
FROM HumanResources.Employee
SELECT DATEDIFF(YEAR, BirthDate,GETDATE())
FROM HumanResources.Employee
SELECT DATEADD(MONTH,18,GETDATE())
SELECT EOMONTH(GETDATE())

--TASK 5
SELECT Instructions,CatalogDescription 
FROM  Production.ProductModel 