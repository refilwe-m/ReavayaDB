--Queries---
--Get all the buses that are not working anymore using UDF
SELECT
    dbo.UDF_InactiveBuses() AS 'Buses not Working';

--Get all the buses that are working
SELECT
    dbo.UDF_ActiveBuses() AS 'Buses Working';

--Get all the buses that need repairs using UDF
SELECT
    dbo.UDF_ToBeRepairedBuses() AS 'Buses Need to be Repaired';

--Cancel Booking
EXECUTE CancelBookings '10';

--Cancel Ticket
EXECUTE CancelTicket '4';

-- Insert Bus
execute InsertBus '2','1','1DC','1','1';

-- Insert User
EXECUTE InsertUserDetails 'Valentia', 'Brooke', '08 January 2013','60 Myers Dr', 'Thokoza', '0784804896','valentiab12@gmail.com';

-- Change Booking Dates
EXECUTE ChangeBookingDate '4','12:00:00','2022-04-15';