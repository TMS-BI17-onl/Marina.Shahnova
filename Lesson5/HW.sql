--TASK 6

CREATE TABLE Patients
(
    ID		        INT IDENTITY(1,1), 
    FirstName		NVARCHAR(100), 
    LastName		NVARCHAR(100), 
	SSN				VARCHAR(10) UNIQUE,
	Email           AS CONCAT(UPPER(LEFT(FirstName,1)),LOWER(LEFT(LastName,3)),'@gmail.com'),
	Temp		    DECIMAL(5,2),
	CreatedDate     DATE
);

--TASK 7
INSERT INTO Patients (FirstName, LastName, SSN,Temp, CreatedDate)
VALUES
    ('Ivan','Adams','adaiva',37.2, '2022-04-05'),
	('Lesha','Dams','DaLes', 36.2, '2022-06-03'),
	('Petya','Ivanov',NULL , 36.6, '2021-04-05'),
	('Igar','Arilov','ArIga', 37.0, '2020-02-25'),
	('Marina','Larina','Lmar',39.2, '2021-04-05')

--TASK 8
ALTER TABLE Patients 
ADD TempType AS CASE WHEN Temp<37 THEN '< 37°C'
					 WHEN Temp>37 THEN '> 37°C'	
				ELSE '=37°C'
				END
 SELECT *
 FROM Patients

--TASK 9
 CREATE VIEW vPatients
 AS SELECT * , Temp*9/5+32 as TempF
    FROM Patients

 SELECT *
 FROM vPatients

 --TASK 10
CREATE FUNCTION TempF(@TempC AS DECIMAL(5,2)) 
RETURNS DECIMAL(5,2)
AS 
BEGIN 
DECLARE @TTemp DECIMAL(5,2);
SET @TTemp=@TempC*9/5+32
RETURN @TTemp
END

SELECT * , dbo.TempF(Temp)
FROM Patients

SELECT dbo.TempF(37.9)

--TASK 11
 DECLARE @DATE AS DATE = '2023-03-31' 
 SELECT DATEADD(WEEK,DATEDIFF(WEEK, 0, (DATEADD(DAY, (6-DATEPART(DAY, @DATE)),@DATE))),0)