USE master;

USE ReaVayaDB;

--Phases Data
INSERT INTO
    Phases(CityCode, Description)
VALUES
('SACB', 'Soweto though Auckland Park until CBD'),
(
        'CWPY',
        'Cresta, Windsor West, Parktown, Yeoville'
    ),
('PAS', 'Parktown, Alexandra, Sandton');

-- Routes Data
INSERT INTO
    BusRoutes(PhaseID, FromCity, ToCity)
VALUES
('1', 'Protea Glen', 'Thokoza Park'),
('1', 'Eldorado Park', 'Lakeview'),
('1', 'Hillbrow', ' Ellis Park'),
('1', 'Braamfontein', ' Ellis Park'),
    ('2', 'Auckland Park', 'Braamfontein'),
('2', 'Rissik Street', 'Parktown'),
('2', 'Auckland Park', 'Braamfontein'),
('2', 'Noordgesig', 'Metro Centre'),
    ('3', 'Wynberg', 'Alexandra'),
('3', 'Joburg CBD', 'Sandton'),
('3', 'Orange Grove', 'Hillbrow'),
('3', 'Yeoville', 'Bramley');

-- Stations
INSERT INTO
    Stations(RouteID, Name)
VALUES
(1, 'Lakeview'),
(1, 'Thokoza Park'),
    (2, 'Wits Station'),
(2, 'UJ Sophiatown Res'),
(2, 'Parktown'),
(2, 'Joburg Theatre'),
(2, 'Russik Street'),
(2, 'Library Gardens'),
(2, 'Milpark'),
(2, 'SABC Media Park'),
    (3, 'Hillbrow');

-- Tickets
--INSERT INTO Tickets(StationID, TicketType, SoldBy) VALUES(ADD AFTER EMPLOYEES ARE POPULATED);
-- Employees
INSERT INTO
    Departments (DepName)
VALUES
    ('Admin'),
('BookingClerk'),
('Driver'),
('StationManager');

INSERT INTO
    Employees (
        DepartmentID,
        FirstName,
        LastName,
        DateOfBirth,
        CellphoneNum,
        EmailAddress
    )
VALUES
    (
        3,
        'Lebo',
        'Matheba',
        '21 September 1950',
        '0728974565',
        'lebom@gmail.com'
    ),
    (
        1,
        'Thabo',
        'Zuma',
        '21 January 1990',
        '0718964566',
        'thaboz@gmail.com'
    ),
    (
        3,
        'Benny',
        'Thomas',
        '01 May 1984',
        '0838974545',
        'Bennyt@gmail.com'
    ),
    (
        4,
        'Sam',
        'Tau',
        '21 August 1950',
        '0728574562',
        'samt@gmail.com'
    ),
    (
        3,
        'Thembi',
        'Moroka',
        '21 June 1997',
        '0728974261',
        'Thembim@gmail.com'
    ),
    (
        3,
        'Lebo',
        'Davids',
        '05 September 1989',
        '0728921567',
        'lebod@gmail.com'
    ),
    (
        2,
        'kate',
        'Bosworth',
        '21 July 1995',
        '0738973665',
        'kateb@gmail.com'
    ),
    (
        3,
        'Zandile',
        'Dhlamini',
        '01 September 1996',
        '0728974258',
        'zandiled@gmail.com'
    ),
    (
        1,
        'Nicole',
        'Dhlamini',
        '07 March 1998',
        '072891001',
        'nicoled@gmail.com'
    ),
    (
        3,
        'David',
        'Smith',
        '08 December 1976',
        '0742569565',
        'davids@gmail.com'
    );