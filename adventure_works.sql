--USE AdventureWorks2014


--CREATE PROC dbo.uspGetAddress
--AS
--SELECT * FROM person.Address
--GO

--uspGetAddress

--CREATE PROC dbo.uspGetAddressCity @city nvarchar(30)
--AS
--SELECT * FROM Person.Address
--WHERE city = @city
--GO

--dbo.uspGetAddressCity @city = 'New York'

--CREATE PROC dbo.uspGetAddressCityStart @city nvarchar(30) = NULL
--AS
--SELECT * FROM Person.Address
--WHERE City = ISNULL(@city,City)
--GO

--dbo.uspGetAddressCityStart

--CREATE PROC dbo.uspGetAddressCityStartWith @City nvarchar(30) = NULL, @AddressLine1 nvarchar(60) = NULL
--AS
--SELECT * FROM Person.Address
--WHERE City = ISNULL(@City, City) AND AddressLine1 LIKE '%' + ISNULL(@AddressLine1, Addressline1) + '%'
--GO

--dbo.uspGetAddressCityStartWith @City = 'Calgary'
--dbo.uspGetAddressCityStartWith @City = 'Calgary', @AddressLine1 ='A'

--CREATE PROCEDURE dbo.uspGetAddressCount @City nvarchar(30), @AddressCount int OUTPUT
--AS
--SELECT @AddressCount = count(*)
--FROM AdventureWorks2014.Person.Address
--WHERE City = @City

--DECLARE @AddressCount INT
--EXEC dbo.uspGetAddressCount 'Calgary', @AddressCount OUTPUT
--SELECT @AddressCount

--CREATE PROCEDURE dbo.uspTryCatchTest
--AS
--BEGIN TRY
--	SELECT 1/0
--END TRY
--BEGIN CATCH
--	SELECT ERROR_NUMBER() AS ErrorNumber,
--	ERROR_SEVERITY() AS ErrorSeverity,
--	ERROR_STATE() AS ErrorState,
--	ERROR_PROCEDURE() AS ErrorProcedure,
--	ERROR_LINE() AS ErrorLine,
--	ERROR_MESSAGE() AS ErrorMessage;
--END CATCH

--dbo.uspTryCatchTest --usp for USER STORED PROCEDURE
--KEEP NAMING SIMPLE AND MEANINGFUL

--SCHEMA.PREFIX(ACTION/OBJECT) NAMING CONVENTION

--CREATE PROC dbo.uspGetAddressCity @City nvarchar(30)
--AS
--SELECT * FROM Person.Address
--WHERE City = @City
--GO

--CREATE PROC dbo.uspGetAddressCity @City nvarchar(30)  --START OF ALTER COMMANDS
--AS
--SET NOCOUNT ON
--SELECT * FROM Person.Address
--WHERE City = @City
--PRINT @@ROWCOUNT
--GO

--DROP PROC dbo.uspGetAddressCity
--GO

--ALTER PROC dbo.uspGetAddressCity @City nvarchar(30)
--AS
--SET NOCOUNT OFF
--SELECT * FROM Person.Address
--WHERE City LIKE @City + '%'
--PRINT @@ROWCOUNT
--GO

--dbo.uspGetAddressCity @City = 'Calgary'

ALTER PROC dbo.uspPersonalInformation @City nvarchar(30), @Rate int
AS
SELECT a1.City, a1.AddressLine1, a2.Rate, a3.HireDate, a4.PhoneNumber
FROM Person.Address a1
INNER JOIN HumanResources.Employee a3 ON a3.BusinessEntityID = a1.AddressID
INNER JOIN HumanResources.EmployeePayHistory a2 ON a2.BusinessEntityID = a3.BusinessEntityID
INNER JOIN Person.PersonPhone a4 ON a4.BusinessEntityID = a3.BusinessEntityID
WHERE a1.City = @City AND a2.Rate = @Rate
GO

dbo.uspPersonalInformation @City = 'Seattle', @Rate = 25 --DEFINITELY NOT FOR NEFARIOUS DEEDS...

--Definitely referenced https://www.sqldatadictionary.com/AdventureWorks2014.pdf --