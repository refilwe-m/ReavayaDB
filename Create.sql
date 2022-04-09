--Create Tables
USE master
GO

DROP DATABASE IF EXISTS ReaVayaDB;
CREATE DATABASE ReaVayaDB;
GO

USE ReaVayaDB
GO


CREATE TABLE Users(
	UserID INT NOT NULL IDENTITY(1,1),
	UserName VARCHAR(50) NOT NULL,
	UserPassword VARCHAR(50) NOT NULL,
	UserEmail VARCHAR(50) NOT NULL,
	UserPhone VARCHAR(50) NOT NULL,
	UserAddress VARCHAR(50) NOT NULL,
	UserCity VARCHAR(50) NOT NULL,
	
);
GO

CREATE TABLE Accounts(

	AccountID INT NOT NULL IDENTITY(1,1),
	AccountName VARCHAR(50) NOT NULL,
	AccountType VARCHAR(50) NOT NULL,
	AccountNumber VARCHAR(50) NOT NULL,
	AccountBalance VARCHAR(50) NOT NULL,
	AccountUserID INT NOT NULL,
	FOREIGN KEY (AccountUserID) REFERENCES Users(UserID)

);
GO

CREATE TABLE Departments(
	DepartmentID INT NOT NULL IDENTITY(1,1),
	DepartmentName VARCHAR(50) NOT NULL,

	FOREIGN KEY (DepartmentUserID) REFERENCES Users(UserID)

);
GO

CREATE TABLE Employees(
	EmployeeID INT NOT NULL IDENTITY(1,1),
	EmployeeName VARCHAR(50) NOT NULL,
	EmployeePhone VARCHAR(50) NOT NULL,
	EmployeeEmail VARCHAR(50) NOT NULL,
	EmployeeAddress VARCHAR(50) NOT NULL,
	EmployeeCity VARCHAR(50) NOT NULL,
	EmployeeDepartmentID INT NOT NULL,
	FOREIGN KEY (EmployeeDepartmentID) REFERENCES Departments(DepartmentID)


	
);
GO

CREATE TABLE Phases(
	PhaseID INT NOT NULL IDENTITY(1,1),
	PhaseName VARCHAR(50) NOT NULL,
	PhaseDescription VARCHAR(50) NOT NULL,
	PhaseStatus VARCHAR(50) NOT NULL,
	PhaseEmployeeID INT NOT NULL,
	FOREIGN KEY (PhaseEmployeeID) REFERENCES Employees(EmployeeID)

	
);
GO
CREATE TABLE BusRoutes(
	RouteID INT NOT NULL IDENTITY(1,1),
	RouteName VARCHAR(50) NOT NULL,
	RouteDescription VARCHAR(50) NOT NULL,
	RouteStatus VARCHAR(50) NOT NULL,
	RouteEmployeeID INT NOT NULL,
	FOREIGN KEY (RouteEmployeeID) REFERENCES Employees(EmployeeID)

);
GO

CREATE TABLE Stations(
	StationID INT NOT NULL IDENTITY(1,1),
	StationName VARCHAR(50) NOT NULL,
	StationDescription VARCHAR(50) NOT NULL,
	StationStatus VARCHAR(50) NOT NULL,
	StationEmployeeID INT NOT NULL,
	FOREIGN KEY (StationEmployeeID) REFERENCES Employees(EmployeeID)
);
GO

CREATE TABLE BusType(
	TypeID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	TypeName VARCHAR(30) NOT NULL ,
	SeatNumber INT NOT NULL

);
GO

CREATE TABLE Buses(
	BusID INT NOT NULL IDENTITY(1,1),
	BusName VARCHAR(50) NOT NULL,
	BusTypeID INT NOT NULL,
	BusRouteID INT NOT NULL,
	BusStationID INT NOT NULL,
	BusStatus VARCHAR(50) NOT NULL,
	BusEmployeeID INT NOT NULL,
	FOREIGN KEY (BusEmployeeID) REFERENCES Employees(EmployeeID),
	FOREIGN KEY (BusTypeID) REFERENCES BusType(TypeID),
	FOREIGN KEY (BusRouteID) REFERENCES BusRoutes(RouteID),
	FOREIGN KEY (BusStationID) REFERENCES Stations(StationID)

);
	
);
GO

CREATE TABLE Bookings(
	BookingID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	AccountID INT,
	BusID INT FOREIGN KEY REFERENCES Buses (BusID),
	CreatedAt date NOT NULL,
	fromAddress VARCHAR(100) NOT NULL,
	toAddress VARCHAR(100) NOT NULL,
	DateOfTravel date NOT NULL,
	TimeOfTravel time NOT NULL,
	FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
	
);
GO

CREATE TABLE EmployeeBuses (
	EmployeeBusID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	EmployeeID INT,
	BusID INT,
	StartDate date NOT NULL,
	EndDate date NOT NULL,

	FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID),
	FOREIGN KEY (BusID) REFERENCES Buses (BusID)


);
GO

CREATE TABLE Tickets(
	TicketID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	StationID INT,
	TicketType VARCHAR(100) NOT NULL,
	SoldBy INT FOREIGN KEY REFERENCES Employees (EmployeeID),
	FOREIGN KEY (StationID) REFERENCES Stations(StationID)
);

GO


