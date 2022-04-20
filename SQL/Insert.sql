USE master;

GO
    USE ReaVayaDB;

--Users Data
INSERT INTO
    Users (
        FirstName,
        LastName,
        DateOfBirth,
        ResAddress,
        City,
        CellphoneNum,
        EmailAddress
    )
VALUES
    (
        'Refilwe',
        'Mashile',
        '1995-12-27',
        '806 Grandrose Ave',
        'Soweto',
        '0845434648',
        'refilwe-mashile@yahoo.com'
    ),
    (
        'Nomcebo',
        'Ndimande',
        '1999-12-29',
        '26 Market Drive',
        'Park Town',
        '0817217371',
        'ndimandnomcebo1@gmail.com'
    ),
    (
        'Itumeleng',
        'Matheba',
        '1997-02-26',
        '60 Mandela St',
        'Braamfontein',
        '0674545321',
        'itumeleng123@gmail.com'
    ),
    (
        'Ryan',
        'Williams',
        '1990-11-23',
        '16 James St',
        'Park Town',
        '0804359867',
        'williams.ryan@yahoo.com'
    ),
    (
        'Andrew',
        'Brown',
        '1989-10-27',
        '75 East Hanry Lane',
        'Lake View',
        '0675145325',
        'andrewcool123@gmail.com'
    ),
    (
        'Aaron',
        'Wilson',
        '2000-01-01',
        '81 Baker Av',
        'Thokoza',
        '0876573902',
        'aaronaaron@gmail.com'
    ),
    (
        'Jordan',
        'Smith',
        '1985-06-27',
        '63 Thompson Lane',
        'Ellis Park',
        '0839838784',
        'jordan1120@gmail.com'
    ),
    (
        'August',
        'Alsina',
        '1989-04-24',
        '167 Gartner St',
        'Braamfontein',
        '0849709865',
        'augustalsin@yahho.com'
    ),
    (
        'Buhle',
        'Mlilo',
        '1994-06-07',
        '73 Cambridge St',
        'Dobsonville',
        '0739843621',
        'mlilobuhle23@yahoo.com'
    ),
    (
        'Thando',
        'Mvubu',
        '1999-07-21',
        '72 Daffodil Cres',
        'Cresta',
        '0659782975',
        'thandom@gmail.com'
    ),
    (
        'Emily',
        'Jones',
        '2001-08-01',
        '720 West Port Drive',
        'Soweto',
        '0651629852',
        'jonesemy@gmail.com'
    );

GO
    --AccountTypes Data
INSERT INTO
    AccountTypes (TypeName)
VALUES
    ('Online'),
    ('On-Site');

GO
    --Accounts Data
INSERT INTO
    Accounts (
        UserID,
        CardNumber,
        TypeID,
        Points,
        CreatedAT,
        Balance
    )
VALUES
    ('1', '0001', '1', '23', '2020-01-17', '80'),
    ('2', '0002', '2', '10', '2022-12-01', '23'),
    ('3', '0003', '2', '20', '2018-03-08', '56'),
    ('4', '0004', '1', '50', '2020-02-05', '0'),
    ('5', '0005', '1', '0', '2022-11-01', '0'),
    ('6', '0006', '1', '28', '2021-07-26', '15'),
    ('7', '0007', '1', '30', '2017-08-01', '74'),
    ('8', '0008', '2', '100', '2022-01-08', '89'),
    ('9', '0009', '1', '78', '2021-10-30', '51'),
    ('10', '0010', '2', '63', '2022-04-01', '23'),
    ('11', '0011', '2', '0', '2022-04-09', '0');

GO
    --Positions Data
INSERT INTO
    Positions (PositionName)
VALUES
    ('Admin'),
    ('BookingClerk'),
    ('Driver'),
    ('StationManager');

GO
    --Fares Data
INSERT INTO
    Fares (StartKM, EndKM, Fare)
VALUES
    (0, 5, 9),
    (5.1, 10, 11),
    (10.1, 15, 13.50),
    (15.1, 25, 16),
    (25.1, 35, 17),
    (35.1, 50, 18);

GO
    --Employees Data
INSERT INTO
    Employees (
        PositionID,
        FirstName,
        LastName,
        DateOfBirth,
        ResAddress,
        City,
        CellphoneNum,
        EmailAddress
    )
VALUES
    (
        3,
        'Lebo',
        'Matheba',
        '21 September 1950',
        '3 Olivia Road',
        'Berea',
        '0728974565',
        'lebom@gmail.com'
    ),
    (
        1,
        'Thabo',
        'Zuma',
        '21 January 1990',
        '3 Proes Street',
        'Pretoria',
        '0718964566',
        'thaboz@gmail.com'
    ),
    (
        3,
        'Benny',
        'Thomas',
        '01 May 1984',
        '33 Bendile Street',
        'Soweto',
        '0838974545',
        'Bennyt@gmail.com'
    ),
    (
        4,
        'Sam',
        'Tau',
        '21 August 1950',
        '05 5th Street',
        'Pretoria',
        '0728574562',
        'samt@gmail.com'
    ),
    (
        3,
        'Thembi',
        'Moroka',
        '21 June 1997',
        '1 13th Road',
        'Midrand',
        '0728974261',
        'Thembim@gmail.com'
    ),
    (
        3,
        'Lebo',
        'Davids',
        '05 September 1989',
        '25 Church Street',
        'Pretoria',
        '0728921567',
        'lebod@gmail.com'
    ),
    (
        2,
        'kate',
        'Bosworth',
        '21 July 1995',
        '09 First Avenue',
        'Soweto',
        '0738973665',
        'kateb@gmail.com'
    ),
    (
        4,
        'Zandile',
        'Dhlamini',
        '01 September 1996',
        '28 Sunset Street',
        'Johannesburg',
        '0728974258',
        'zandiled@gmail.com'
    ),
    (
        1,
        'Nicole',
        'Dhlamini',
        '07 March 1998',
        '02 Sunset Street',
        'Sandton',
        '072891001',
        'nicoled@gmail.com'
    ),
    (
        2,
        'Sam',
        'Zulu',
        '07 May 1998',
        '19 Winter Street',
        'Sandton',
        '073891401',
        'samz@gmail.com'
    ),
    (
        1,
        'Nick',
        'Davids',
        '09 December 1998',
        '05 Hilton Street',
        'Sandton',
        '072491701',
        'nickd@gmail.com'
    ),
    (
        4,
        'David',
        'Smith',
        '08 December 1976',
        '28 Sunset Street',
        'Braamfontein',
        '0742569565',
        'davids@gmail.com'
    );

GO
    --Phases Data
INSERT INTO
    Phases(PhaseCode, Description)
VALUES
    (
        '1A',
        'Ellis Park in Doornfontein and Thokoza Park in Soweto'
    ),
    (
        '1B',
        'From Thokoza Park through Noordgesig Extension, Westbury, Auckland Park, Milpark, Parktown and to Library Gardens in the Joburg CBD'
    ),
    (
        '1C',
        'from the inner city through Hillbrow, Yeoville, Orange Grove, Bramley, Wynberg to Alexanda and Sandton.'
    );

GO
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

GO
    --Insert Bus Codes
INSERT INTO
    RouteCodes (CodeName, RouteID)
VALUES
    ('T1', 2),
    ('T2', 2),
    ('T3', 2),
    ('C1', 2),
    ('C2', 4),
    ('C3', 3),
    ('C4', 4),
    ('F1', 6),
    ('F2', 5),
    ('F3', 7),
    ('F4', 8),
    ('F6', 8),
    ('F7', 7),
    ('F8', 8),
    ('F9', 6),
    ('F10', 3),
    ('F11', 4),
    ('F12', 2);

GO
    -- Stations
INSERT INTO
    Stations(RouteID, Name)
VALUES
    (3, 'Lakeview'),
    (2, 'Thokoza Park'),
    (5, 'Wits Station'),
    (8, 'UJ Sophiatown Res'),
    (7, 'Parktown'),
    (2, 'Joburg Theatre'),
    (11, 'Russik Street'),
    (7, 'Library Gardens'),
    (1, 'Milpark'),
    (8, 'SABC Media Park'),
    (12, 'Hillbrow');

GO
    --Bus Statuses Data
INSERT INTO
    BusStatuses (Status, Description)
VALUES
    (
        'Available',
        'Bus is available (Unallocated to any Driver)'
    ),
    ('Repairs', 'Bus is sent for Repairs'),
    (
        'Decommissioned',
        'Bus is no longer in use(Permanently)'
    ),
    (
        'Commissioned',
        'Bus is currently in use (Allocated to Driver)'
    );

GO
    --Bus Types
INSERT INTO
    BusTypes (TypeName, SeatsNumber)
VALUES
    ('Feeder', 100),
    ('Complementary', 150),
    ('Trunk', 300);

GO
    -- Buses Data
INSERT INTO
    Buses(Registration, RouteCode, StatusID)
VALUES
    ('TDG 643 MP', 2, 4),
    ('TDG 613 MP', 5, 2),
    ('TSG 623 MP', 7, 1),
    ('TDT 673 MP', 3, 3),
    ('TGG 603 MP', 1, 2),
    ('TDG 653 MP', 3, 4),
    ('TDG 663 MP', 4, 1),
    ('HGG 683 MP', 6, 3),
    ('TDG 693 MP', 8, 3),
    ('TDG 843 MP', 3, 2),
    ('TDG 233 MP', 5, 1),
    ('FDG 443 MP', 10, 1),
    ('TDG 943 MP', 8, 3);

GO
    --Bookings Data
INSERT INTO
    Bookings(
        FareID,
        AccountID,
        BusID,
        StationID,
        TimeOfTravel,
        DateOfTravel
    )
VALUES
    (1, 11, 17, 5, '12:00:00', '2022-01-22'),
    (1, 2, 18, 4, '12:50:00', '2022-03-13'),
    (2, 3, 20, 2, '12:30:00', '2022-02-22'),
    (4, 10, 20, 3, '17:45:00', '2022-01-22'),
    (1, 7, 21, 10, '12:15:00', '2022-01-22'),
    (1, 10, 12, 11, '13:35:00', '2022-04-11'),
    (3, 1, 13, 4, '12:00:00', '2022-01-22'),
    (1, 4, 1, 3, '11:45:00', '2022-01-16'),
    (4, 1, 6, 1, '09:00:00', '2022-01-10'),
    (6, 1, 8, 7, '13:05:00', '2022-01-29'),
    (5, 10, 10, 8, '14:10:00', '2022-01-22'),
    (1, 4, 19, 10, '15:00:00', '2022-01-22'),
    (4, 10, 2, 11, '17:00:00', '2022-01-22'),
    (2, 6, 3, 8, '08:30:00', '2022-02-01'),
    (1, 2, 4, 10, '16:00:00', '2022-01-22'),
    (2, 10, 5, 1, '12:00:00', '2022-01-02'),
    (3, 8, 7, 9, '12:00:00', '2022-01-22'),
    (1, 5, 9, 8, '10:05:00', '2022-02-23'),
    (5, 9, 14, 6, '12:10:00', '2022-03-22'),
    (6, 9, 15, 5, '12:20:00', '2022-04-01');

GO
    --EmployeeBuses Data
INSERT INTO
    EmployeeBuses (EmployeeID, BusID, StartDate, EndDate)
VALUES
    ('1', '1', '2022-04-01', '2022-04-15'),
    ('3', '2', '2022-04-16', '2022-04-30'),
    ('5', '3', '2022-05-01', '2022-05-15'),
    ('6', '4', '2022-05-16', '2022-05-31'),
    ('1', '5', '2022-06-01', '2022-06-15'),
    ('1', '6', '2022-06-16', '2022-06-30'),
    ('3', '7', '2022-07-01', '2022-07-15'),
    ('5', '8', '2022-07-16', '2022-07-31'),
    ('3', '9', '2022-08-01', '2022-08-15');

GO
GO
    -- Insert Ticket Types
INSERT INTO
    TicketTypes (TicketType, Price)
VALUES
    ('Single', 25),
    ('Return', 50);

GO
    -- Tickets
INSERT INTO
    Tickets(StationID, TicketType, SoldBy)
VALUES
    (11, 1, 12),
    (2, 1, 12),
    (3, 2, 12),
    (4, 1, 12),
    (5, 1, 4),
    (6, 2, 4),
    (7, 1, 12),
    (8, 2, 4),
    (9, 1, 4),
    (10, 1, 4),
    (10, 2, 12),
    (10, 2, 12),
    (10, 1, 4),
    (11, 2, 12),
    (11, 1, 4);

GO