USE master;

USE ReaVayaDB
GO
	DROP TABLE IF EXISTS Positions,
	Phases,
	Employees,
	BusRoutes,
	BusType,
	EmployeeBuses,
	Stations;

CREATE TABLE Users(
	UserID int IDENTITY (1, 1) PRIMARY KEY NOT NULL,
	FirstName nvarchar(100) NOT NULL,
	LastName nvarchar(100) NOT NULL,
	DateOfBirth date NOT NULL,
	ResAddress varchar(100) NOT NULL,
	City varchar(100) NOT NULL,
	CellphoneNum varchar(10) UNIQUE NOT NULL,
	EmailAddress nvarchar(50) UNIQUE NOT NULL,
);

GO
	CREATE TABLE AccountTypes(
		TypeID int IDENTITY(1, 1) PRIMARY KEY NOT NULL,
		TypeName varchar (50) NOT NULL,
	);

GO
	CREATE TABLE Accounts(
		AccountID int IDENTITY(1, 1) PRIMARY KEY NOT NULL,
		UserID int,
		CardNumber int UNIQUE NOT NULL,
		TypeID int,
		Points int DEFAULT 0,
		CreatedAT date NOT NULL,
		Balance money DEFAULT 0.0,
		FOREIGN KEY (UserID) REFERENCES Users(UserID),
		FOREIGN KEY (TypeID) REFERENCES AccountTypes (TypeID)
	);

GO
	CREATE TABLE Positions(
		PositionID INT IDENTITY (1, 1) PRIMARY KEY NOT NULL,
		PositionName VARCHAR (30) NOT NULL UNIQUE,
	);

GO
	CREATE TABLE Employees(
		EmployeeID int IDENTITY (1, 1) PRIMARY KEY NOT NULL,
		PositionID INT FOREIGN KEY REFERENCES Positions(PositionID),
		FirstName nvarchar(100) NOT NULL,
		LastName nvarchar(100) NOT NULL,
		DateOfBirth date NOT NULL,
		ResAddress varchar(100) NOT NULL,
		City varchar(100) NOT NULL,
		CellphoneNum varchar(10) UNIQUE NOT NULL,
		EmailAddress nvarchar(50) UNIQUE NOT NULL,
	);

GO
	CREATE TABLE Phases(
		PhaseID int IDENTITY(1, 1) PRIMARY KEY NOT NULL,
		CityCode varchar(5) NOT NULL,
		Description nvarchar (500) NOT NULL
	);

GO
	CREATE TABLE BusRoutes(
		RouteID int IDENTITY(1, 1) PRIMARY KEY NOT NULL,
		PhaseID int,
		FromCity varchar(30) NOT NULL,
		ToCity varchar(30) NOT NULL,
		FOREIGN KEY (PhaseID) REFERENCES Phases (PhaseID)
	);

GO
	CREATE TABLE Stations(
		StationID int IDENTITY(1, 1) PRIMARY KEY NOT NULL,
		RouteID int,
		Name varchar(30) NOT NULL,
		FOREIGN KEY (RouteID) REFERENCES BusRoutes(RouteID)
	);

GO
	CREATE TABLE BusTypes(
		TypeID int IDENTITY(1, 1) PRIMARY KEY NOT NULL,
		TypeName varchar(30) NOT NULL,
		SeatNumber int NOT NULL
	);

GO
	CREATE TABLE BusCodes(
		CodeID int IDENTITY(1, 1) PRIMARY KEY NOT NULL,
		Code VARCHAR(3) NOT NULL UNIQUE,
	);

GO
	CREATE TABLE Buses(
		BusID INT IDENTITY (1, 1) PRIMARY KEY NOT NULL,
		TypeID INT FOREIGN KEY REFERENCES BusType(TypeID),
		RouteID INT FOREIGN KEY REFERENCES BusRoutes(RouteID),
		CodeID INT NOT NULL FOREIGN KEY REFERENCES BusCodes(CodeID),
		HealthStatus BIT NOT NULL,
		Active BIT NOT NULL,
	);

GO
	CREATE TABLE Bookings(
		BookingID int IDENTITY(1, 1) PRIMARY KEY NOT NULL,
		AccountID int,
		BusID int FOREIGN KEY REFERENCES Buses (BusID),
		StationID int FOREIGN KEY REFERENCES Stations (StationID),
		TimeOfTravel time NOT NULL,
		DateOfTravel date NOT NULL,
		FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
	);

GO
	CREATE TABLE EmployeeBuses (
		EmployeeBusID int IDENTITY (1, 1) PRIMARY KEY NOT NULL,
		EmployeeID int,
		BusID int,
		StartDate date NOT NULL,
		EndDate date NOT NULL,
		FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID),
		FOREIGN KEY (BusID) REFERENCES Buses (BusID)
	);

GO
	CREATE TABLE Tickets(
		TicketID int IDENTITY(1, 1) PRIMARY KEY NOT NULL,
		StationID int,
		TicketType varchar(100) NOT NULL,
		SoldBy INT FOREIGN KEY REFERENCES Employees (EmployeeID),
		FOREIGN KEY (StationID) REFERENCES Stations(StationID)
	);

GO