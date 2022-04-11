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
    Phases(CityCode, Description)
VALUES
    ('SACB', 'Soweto though Auckland Park until CBD'),
    (
        'CWPY',
        'Cresta, Windsor West, Parktown, Yeoville'
    ),
    ('PAS', 'Parktown, Alexandra, Sandton');

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
    BusCodes (CodeName)
VALUES
    ('T1'),
    ('T2'),
    ('T3'),
    ('C1'),
    ('C2'),
    ('C3'),
    ('C4'),
    ('F1'),
    ('F2'),
    ('F3'),
    ('F4'),
    ('F6'),
    ('F7'),
    ('F8'),
    ('F9'),
    ('F10'),
    ('F11'),
    ('F12');

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
    (13, 'Milpark'),
    (8, 'SABC Media Park'),
    (12, 'Hillbrow');

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
    Buses(
        TypeID,
        RouteID,
        CodeID,
        Healthstatus,
        Active
    )
VALUES
    (3, 2, 1, 1, 1),
    (3, 5, 2, 1, 1),
    (3, 7, 1, 0, 1),
    (3, 3, 3, 0, 1),
    (3, 3, 3, 0, 1),
    (2, 3, 4, 0, 1),
    (2, 4, 5, 1, 0),
    (2, 6, 5, 1, 1),
    (1, 3, 6, 0, 1),
    (1, 3, 6, 0, 1),
    (1, 5, 7, 0, 0),
    (1, 10, 8, 1, 0),
    (1, 8, 9, 1, 1),
    (1, 2, 10, 1, 1),
    (1, 12, 11, 1, 1),
    (1, 11, 12, 1, 1),
    (1, 2, 13, 1, 1),
    (1, 9, 14, 1, 0),
    (1, 11, 15, 1, 0),
    (1, 6, 16, 0, 1),
    (1, 7, 17, 1, 1),
    (1, 4, 18, 1, 1);

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
();

GO
    --EmployeeBuses Data
INSERT INTO
    EmployeeBuses(EmployeeID, BusID, StartDate, EndDate)
VALUES
();

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
    (12, 1, 4);