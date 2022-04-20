-- ReaVaya UDFs ----
USE master;

GO
    USE ReaVayaDB;
	GO

	-- Count InActive Buses
CREATE FUNCTION UDF_InactiveBuses()
RETURNS INT AS 
BEGIN 
	DECLARE @InactiveBuses INT
	SELECT @InactiveBuses = COUNT(Active) FROM Buses WHERE Active = 0
	RETURN @InactiveBuses
END
GO

	-- Count Active Buses
CREATE FUNCTION UDF_ActiveBuses()
RETURNS INT AS 
BEGIN 
	DECLARE @ActiveBuses INT
	SELECT @ActiveBuses = COUNT(Active) FROM Buses WHERE Active = 1
	RETURN @ActiveBuses
END
GO



	-- Count Buses That Need Repairs
CREATE FUNCTION UDF_ToBeRepairedBuses()
RETURNS INT AS 
BEGIN 
	DECLARE @RepBuses INT
	SELECT @RepBuses = COUNT(HealthStatus) FROM Buses WHERE HealthStatus = 0
	RETURN @RepBuses
END
;