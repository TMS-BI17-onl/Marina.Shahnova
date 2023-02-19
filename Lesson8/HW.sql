
--1 USE EXCISTING TABLE PERSON.PERSON
SELECT DISTINCT TOP 1000000 p1.FirstName, p2.LastName
INTO TPERSON1
FROM Person.Person p1 CROSS JOIN Person.Person p2

/* I GENERATED CSV FILE  WITH 1000 RECORDS ON https://mockaroo.com AND UPLOAD TO OUR SCHEME AS TABLE MOCK_DATA
-- We have 1000 records IN TABLE MOCK_DATA so cross join return 1000000 and 'TOP 1000000' is not obligotory*/
SELECT m1.First_name, m2.Last_name
INTO TPERSON2
FROM mock_data m1 CROSS JOIN mock_data m2

