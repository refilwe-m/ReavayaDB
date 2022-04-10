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
    Positions (PositionName)
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
        '3 Olivia Road', 'Berea',
        '0728974565',
        'lebom@gmail.com'
    ),
    (
        1,
        'Thabo',
        'Zuma',
        '21 January 1990', '3 Proes Street', 'Pretoria',
        '0718964566',
        'thaboz@gmail.com'
    ),
    (
        3,
        'Benny',
        'Thomas',
        '01 May 1984', '33 Bendile Street', 'Soweto',
        '0838974545',
        'Bennyt@gmail.com'
    ),
    (
        4,
        'Sam',
        'Tau',
        '21 August 1950', '05 5th Street', 'Pretoria',
        '0728574562',
        'samt@gmail.com'
    ),
    (
        3,
        'Thembi',
        'Moroka',
        '21 June 1997', '1 13th Road', 'Midrand',
        '0728974261',
        'Thembim@gmail.com'
    ),
    (
        3,
        'Lebo',
        'Davids',
        '05 September 1989', '25 Church Street', 'Pretoria',
        '0728921567',
        'lebod@gmail.com'
    ),
    (
        2,
        'kate',
        'Bosworth',
        '21 July 1995', '09 First Avenue', 'Soweto',
        '0738973665',
        'kateb@gmail.com'
    ),
    (
        4,
        'Zandile',
        'Dhlamini',
        '01 September 1996', '28 Sunset Street', 'Johannesburg',
        '0728974258',
        'zandiled@gmail.com'
    ),
    (
        1,
        'Nicole',
        'Dhlamini',
        '07 March 1998','02 Sunset Street', 'Sandton',
        '072891001',
        'nicoled@gmail.com'
    ),
  (
        2,
        'Sam',
        'Zulu',
        '07 May 1998','19 Winter Street', 'Sandton',
        '073891401',
        'samz@gmail.com'
    ),

      (
        1,
        'Nick',
        'Davids',
        '09 December 1998','05 Hilton Street', 'Sandton',
        '072491701',
        'nickd@gmail.com'
    ),

    (
        4,
        'David',
        'Smith',
        '08 December 1976','28 Sunset Street', 'Braamfontein',
        '0742569565',
        'davids@gmail.com'
    );

USE ReaVayaDB;

GO
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

INSERT INTO
    AccountTypes (TypeName)
VALUES
    ('Online'),
('On-Site');

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

    