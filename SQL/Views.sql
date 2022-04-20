--Views
USE master;

USE ReaVayaDB
GO

-- View Company Statitics
CREATE VIEW CompanyStats AS
SELECT
	(SELECT COUNT(*) FROM dbo.Users) AS 'Total Clients',
	(SELECT COUNT(*) FROM dbo.Buses) AS 'Total Buses',
	(SELECT COUNT(*) FROM dbo.Employees) AS 'Total Employess',
	(SELECT COUNT(*) FROM dbo.Tickets) AS 'Total Sales'
GO

