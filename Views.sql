--Views
USE master;
USE ReaVayaDB
GO

-- User info
CREATE view vUserInfo AS
SELECT
	u.FirstName,
	u.LastName,
	a.Balance,
	a.Points,
	bk.DateOfTravel,
	bk.TimeOfTravel,
	bt.TypeName,
	bt.SeatNumber,
	br.FromCity,
	br.ToCity,
	s.Name
FROM
	Users AS u
	LEFT JOIN Accounts AS a ON u.UserID = a.UserID
	LEFT JOIN Bookings AS bk ON a.AccountID = bk.AccountID
	LEFT JOIN Buses AS b ON bk.BusID = b.BusID
	LEFT JOIN BusType AS bt ON b.TypeID = bt.TypeID
	LEFT JOIN BusRoutes AS br ON b.RouteID = br.RouteID
	LEFT JOIN Stations AS s ON br.RouteID = s.RouteID;
GO

-- Employee info
CREATE view vEmployeeInfo AS

SELECT
	e.FirstName,
	e.LastName,
	p.PositionName
 	
FROM Employees AS e
LEFT JOIN Positions AS p ON e.PositionID = p.PositionID;
GO
-- Active buses
CREATE view ActiveBuses AS
SELECT BusID
FROM Buses WHERE Active = 1;

-- more views...