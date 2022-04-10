--Queries---

--Get all the buses that are not working anymore using UDF
SELECT dbo.UDF_InactiveBuses() AS 'Buses not Working';

--Get all the buses that are working
SELECT dbo.UDF_ActiveBuses() AS 'Buses Working';

--Get all the buses that need repairs using UDF
SELECT  dbo.UDF_ToBeRepairedBuses() AS 'Buses Need to be Repaired'