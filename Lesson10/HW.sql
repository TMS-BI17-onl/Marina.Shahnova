SELECT year_s ,[01] AS 'January',[02] AS 'February', [12] AS 'December'
FROM 
(SELECT Year(StartDate) as year_s,MONTH(StartDate) as Month_s,OrderQty
    FROM Production.WorkOrder
) AS SourceTable  
PIVOT
( 
	Sum(OrderQty)
	FOR  Month_s IN ( [01], [02], [12])
) AS PivotTable