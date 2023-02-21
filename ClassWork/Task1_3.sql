
3) Вывести самый дорогой продукт для каждого цвета из [Production].[Product]
--TASK 1
SELECT pp.Title,pp.FirstName,pp.LastName,pp.MiddleName,pph.PhoneNumber
FROM Person.PersonPhone   pph JOIN Person.Person pp ON  pph.BusinessEntityID=pp.BusinessEntityID
WHERE pph.PhoneNumber like '4_5%'


--TASK 2
SELECT * , CASE WHEN DATEDIFF(YEAR,BirthDate,GETDATE())BETWEEN 17 AND 20 THEN 'Adolescence: 17-20'
				WHEN DATEDIFF(YEAR,BirthDate,GETDATE())BETWEEN 21 AND 59 THEN 'Adults: 21-59'
				WHEN DATEDIFF(YEAR,BirthDate,GETDATE())BETWEEN 60 AND 75 THEN 'Elderly: 60-75'
				WHEN DATEDIFF(YEAR,BirthDate,GETDATE())BETWEEN 76 AND 90 THEN 'Senile: 76-90'
		END	AS AGE_CATEGORY
FROM HumanResources.Employee

--TASK 3
SELECT COLOR,MAX

SELECT PG.Color,P.NAME, MAX_COST
FROM  (SELECT Color, MAX(StandardCost) AS MAX_COST FROM Production.Product GROUP BY COLOR) pG LEFT JOIN Production.Product p ON P.Color=PG.Color
WHERE P.StandardCost=PG.MAX_COST 

SELECT *
FROM (SELECT COLOR,NAME, StandardCost, MAX(StandardCost) OVER (PARTITION BY COLOR) AS MAX_COST
FROM Production.Product) P
WHERE P.StandardCost=P.MAX_COST
