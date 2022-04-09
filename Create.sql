USE master
GO

DROP DATABASE IF EXISTS ReaVayaDB;
CREATE DATABASE ReaVayaDB;
GO

USE ReaVayaDB
GO

DROP TABLE IF EXISTS Users;
CREATE TABLE Users(
	UserID int IDENTITY (1,1) PRIMARY KEY NOT NULL,
	FirstName nvarchar(100) NOT NULL,
	LastName nvarchar(100) NOT NULL,
	DateOfBirth date NOT NULL,
	ResAddress varchar(100) NOT NULL,
	City varchar(100) NOT NULL,
	CellphoneNum varchar(10) UNIQUE NOT NULL,
	EmailAddress nvarchar(50) UNIQUE NOT NULL,

);
GO
DROP TABLE IF EXISTS Accounts;
CREATE TABLE Accounts(

	AccountID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	CardNumber int UNIQUE NOT NULL,
	UserID int,
	AccountType varchar(20) NOT NULL,
	Points int DEFAULT 0,
	CreatedAT date NOT NULL,
	Balance money DEFAULT 0.0,
	FOREIGN KEY (UserID) REFERENCES Users(UserID)   
);
GO

DROP TABLE IF EXISTS Departments;
CREATE TABLE Departments(
	DepartmentID int IDENTITY (1,1) PRIMARY KEY NOT NULL,
	DepName varchar (30) NOT NULL,
);
GO


CREATE TABLE Employees(
	EmployeeID int IDENTITY (1,1) PRIMARY KEY NOT NULL,
	DepartmentID int ,
	FirstName nvarchar(100) NOT NULL,
	LastName nvarchar(100) NOT NULL,
	DateOfBirth date NOT NULL,
	ResAddress varchar(100) NOT NULL,
	City varchar(100) NOT NULL,
	CellphoneNum varchar(10) UNIQUE NOT NULL,
	EmailAddress nvarchar(50) UNIQUE NOT NULL,
	FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)

	
);
GO

CREATE TABLE Phases(
	PhaseID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	CityCode varchar(5) NOT NULL,
	Description nvarchar (500) NOT NULL
	
);
GO
CREATE TABLE BusRoutes(
	RouteID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	PhaseID int,
	FromCity varchar(30) NOT NULL,
	ToCity varchar(30) NOT NULL,
	FOREIGN KEY (PhaseID) REFERENCES Phases (PhaseID)
	
);
GO

CREATE TABLE Stations(
	StationID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	RouteID int,
	Name varchar(30) NOT NULL,
	FOREIGN KEY (RouteID) REFERENCES BusRoutes(RouteID)
);
GO

CREATE TABLE BusType(
	TypeID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	TypeName varchar(30) NOT NULL ,
	SeatNumber int NOT NULL

);
GO

CREATE TABLE Buses(
	BusID int IDENTITY (1,1) PRIMARY KEY NOT NULL,
	TypeID int,
	RouteID int,	
	BusCode varchar (10) NOT NULL,
	BusType varchar (50) NOT NULL,
	HealthStatus bit NOT NULL,
	Active bit NOT NULL,
	FOREIGN KEY (TypeID) REFERENCES BusType(TypeID),	
	FOREIGN KEY (RouteID) REFERENCES BusRoutes(RouteID)

	
);
GO

DROP TABLE IF EXISTS Bookings;
CREATE TABLE Bookings(
	BookingID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	AccountID int,
	BusID int FOREIGN KEY REFERENCES Buses (BusID),
	TravellingTime date NOT NULL,
	FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
	
);
GO

CREATE TABLE EmployeeBuses (
	EmployeeBusID int IDENTITY (1,1) PRIMARY KEY NOT NULL,
	EmployeeID int,
	BusID int,
	StartDate date NOT NULL,
	EndDate date NOT NULL,

	FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID),
	FOREIGN KEY (BusID) REFERENCES Buses (BusID)


);
GO

CREATE TABLE Tickets(
	TicketID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	StationID int,
	TicketType varchar(100) NOT NULL,
	SoldBy INT FOREIGN KEY REFERENCES Employees (EmployeeID),
	FOREIGN KEY (StationID) REFERENCES Stations(StationID)
);

GO


