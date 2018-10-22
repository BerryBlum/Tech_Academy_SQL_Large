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

