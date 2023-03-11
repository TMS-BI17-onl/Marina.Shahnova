-- CHANGE CONDITIONS  4 or more sales - 3 points, 2-3 - 2 points, 1  - 1 point 

SELECT TOP 50 WITH TIES M.FirstName,M.LastName, SUM(T.CNT) AS SUM_CNT 
FROM (	SELECT ManagerId,SalesDate , CASE WHEN COUNT(SalesId) >3  THEN 3
									     WHEN COUNT(SalesId) BETWEEN 2 AND 3 THEN 2
										 ELSE 1
										 END AS CNT
		FROM FctSales
		GROUP BY  ManagerId,SalesDate )T  JOIN DimManagers M ON  T.ManagerId=M.ManagerId    
GROUP BY M.FirstName,M.LastName
ORDER BY SUM_CNT DESC