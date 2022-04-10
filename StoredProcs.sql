USE [ReaVayaDB]
GO
    --- Stored Procedures for ReaVaya DB ---
    DROP PROCEDURE IF EXISTS CancelBookings,
    CancelTicket;

GO
    --- Stored Procedure to Cancel Bookings ---
    CREATE PROCEDURE CancelBookings @BookingID int AS BEGIN
UPDATE
    Bookings
set
    StationID = null,
    TimeOfTravel = null,
    DateOfTravel = null
END EXECUTE CancelBookings '10';

GO
    --- Stored Procedure to Cancel Tickets ---
    create PROCEDURE CancelTicket @ticketID int AS BEGIN
UPDATE
    Tickets
set
    StationID = null,
    TicketType = null,
    SoldBy = null
where
    TicketID = @ticketID
END
GO
    --Stored Procedure for Inserting a new Bus
    CREATE PROCEDURE InsertBus -- Add the parameters for the stored procedure here
    @TypeID int,
    @RouteID int,
    @BusCode varchar(10),
    @HealthStatus BIT = 1,
    -- 0 Needs Fixing
    @Active bit = 1 AS BEGIN -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
SET
    NOCOUNT ON;

INSERT INTO
    Buses
VALUES
    (
        @TypeID,
        @RouteID,
        @BusCode,
        @HealthStatus,
        @Active
    )
END
GO
    -- Stored Procedure for Adding new Users
    CREATE PROCEDURE InsertUserDetails @FirstName nvarchar(100),
    @LastName nvarchar(100),
    @DateOfBirth date,
    @ResAddress varchar(100),
    @City varchar(100),
    @CellPhoneNum varchar(10),
    @EmailAddress nvarchar(50) AS BEGIN
SET
    NOCOUNT ON;

BEGIN TRY
INSERT INTO
    Users
VALUES
    (
        @FirstName,
        @LastName,
        @DateOfBirth,
        @ResAddress,
        @City,
        @CellPhoneNum,
        @EmailAddress
    );

PRINT 'SUCCESS'
END TRY BEGIN CATCH PRINT 'This is an error: ' + ERROR_MESSAGE()
END CATCH
END
GO
    -- Stored Procedure for Changing Booking Dates
    CREATE PROCEDURE ChangeBookingDate @BookingID int,
    @TimeOfTravel time,
    @DateOfTravel date AS BEGIN -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
SET
    NOCOUNT ON;

-- Insert statements for procedure here
UPDATE
    Bookings
set
    TimeOfTravel = @TimeOfTravel,
    DateOfTravel = @DateOfTravel
Where
    BookingID = @BookingID
END
GO
    --Stored Procedure for Changing User's Email Address
    CREATE PROCEDURE ChangeUserEmail @UserID int,
    @EmailAddress nvarchar(50) AS BEGIN
Update
    Users
set
    EmailAddress = @EmailAddress
END
GO