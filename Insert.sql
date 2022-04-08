USE master;
USE ReaVayaDB;

--Phases Data
INSERT INTO Phases(CityCode, Description) VALUES('SACB', 'Soweto though Auckland Park until CBD'),('CWPY', 'Cresta, Windsor West, Parktown, Yeoville'),('PAS', 'Parktown, Alexandra, Sandton'); 

-- Routes Data
INSERT INTO BusRoutes(PhaseID, FromCity, ToCity) VALUES('1','Protea Glen','Thokoza Park'),('1','Eldorado Park','Lakeview'),('1','Hillbrow',' Ellis Park'),('1','Braamfontein',' Ellis Park'),
('2','Auckland Park','Braamfontein'),('2','Rissik Street','Parktown'),('2','Auckland Park','Braamfontein'),('2','Noordgesig','Metro Centre'),
('3','Wynberg','Alexandra'),('3','Joburg CBD','Sandton'),('3','Orange Grove','Hillbrow'),('3','Yeoville','Bramley');