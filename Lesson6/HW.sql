CREATE PROCEDURE UpdateNatIDNum
    @BEID  int,
    @NUDN  nvarchar(15) 
AS
UPDATE HumanResources.Employee
SET [NationalIDNumber]=@NUDN
WHERE [BusinessEntityID]=@BEID;

EXEC UpdateNatIDNum 15,'879341111'
