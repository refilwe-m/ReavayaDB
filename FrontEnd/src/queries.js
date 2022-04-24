const sql = require("mssql/msnodesqlv8");
const config = require("../config");

const dbConnect = new sql.connect(config, (err) =>
  err
    ? console.log(err)
    : console.log(`connected to the "${config.database}" database.`)
);

/*            B U S   F U N C T I O N S               */
const getIDFromCode = async (Code) => {
  try {
    const pool = await sql.connect(config);
    const result = await pool
      .request()
      .input("CODE", Code)
      .query(`SELECT CodeID FROM dbo.RouteCodes WHERE CodeName = @CODE`);
    return result.recordset[0].CodeID;
  } catch (error) {
    console.log(error);
  }
};
//getIDFromCode("T1").then(console.log);

const getAllBuses = async () => {
  try {
    const pool = await sql.connect(config);
    const buses = await pool.request().query("SELECT * FROM dbo.Buses");
    return buses.recordsets[0];
  } catch (error) {
    console.log(error);
  }
};
//getAllBuses().then((res)=>console.log(res))

const addBus = async (registration, codeID, seats) => {
  console.log(registration, codeID, seats);
  try {
    const pool = await sql.connect(config);
    pool
      .request()
      .query(
        `INSERT INTO dbo.Buses (Registration, RouteCodeID, Seats) VALUES ('${registration}', ${codeID}, ${seats})`
      );
  } catch (error) {
    console.log(error);
  }
};
//addBus('REF 743 MP', 2, 150);

const getAllWorkingBuses = async () => {
  try {
    const pool = await sql.connect(config);
    const buses = await pool
      .request()
      .query("SELECT * FROM dbo.Buses WHERE StatusID IN  (1,4)");
    return buses.recordsets[0];
  } catch (error) {
    console.log(error);
  }
};
//getAllWorkingBuses().then((result) =>console.log("Working (ALLOCATED & AVAILABLE): \n",result));

const getReadyForAllocationBuses = async () => {
  try {
    const pool = await sql.connect(config);
    const buses = await pool
      .request()
      .query("SELECT * FROM dbo.Buses WHERE StatusID = 1");
    return buses.recordsets[0];
  } catch (error) {
    console.log(error);
  }
};
//getReadyForAllocationBuses().then((result) =>console.log("Unallocated: \n",result));

const getAllAllocatedBuses = async () => {
  try {
    const pool = await sql.connect(config);
    const buses = await pool
      .request()
      .query(
        "SELECT * FROM dbo.Buses WHERE BusID IN (SELECT BusID FROM dbo.EmployeeBuses)"
      );
    return buses.recordsets[0];
  } catch (error) {
    console.log(error);
  }
};

const getAllFaultyBuses = async () => {
  try {
    const pool = await sql.connect(config);
    const buses = await pool
      .request()
      .query("SELECT * FROM dbo.Buses WHERE HealthStatus = 0");
    return buses.recordsets[0];
  } catch (error) {
    console.log(error);
  }
};

//Remove Bus
const removeBus = async (busID) => {
  try {
    const pool = await sql.connect(config);
    const buses = await pool
      .request()
      .query("DELETE FROM dbo.Buses WHERE BusID = " + busID);
    return buses.recordsets[0];
  } catch (error) {
    console.log(error);
  }
};

/*            E M P L O Y E E S   F U N C T I O N S               */
const addEmployee = async (
  positionID,
  name,
  surname,
  dob,
  address,
  phone,
  email
) => {
  try {
    const pool = await sql.connect(config);
    await pool
      .request()
      .query(
        `INSERT INTO dbo.Employees (PositionID, FirstName, LastName, DateOfBirth, ResAddress, CellphoneNum, EmailAddress) 
        VALUES (${positionID},'${name}', '${surname}', '${dob}','${address}','${phone}','${email}')`
      );
  } catch (error) {
    console.log(error);
  }
};
//addEmployee(3,"John","Doe","01/01/2000","1, Main Street","0771234567","refilwe@bbd.co.za");

const getAllEmployees = async () => {
  try {
    const pool = await sql.connect(config);
    const employees = await pool.request().query("SELECT * FROM dbo.Employees");
    return employees.recordsets[0];
  } catch (error) {
    console.log(error);
  }
};
//getAllEmployees().then((result) =>console.log("Employees: \n",result));

const getAllDrivers = async () => {
  try {
    const pool = await sql.connect(config);
    const drivers = await pool
      .request()
      .query("SELECT * FROM dbo.Employees WHERE PositionID = 3");
    return drivers.recordsets[0];
  } catch (error) {
    console.log(error);
  }
};
//getAllDrivers().then((result) =>console.log("Drivers: \n",result));

const removeEmployee = async (employeeID) => {
  try {
    const pool = await sql.connect(config);
    const employees = await pool
      .request()
      .input("EMPLOYEE_ID", sql.Int, employeeID)
      .query("DELETE FROM dbo.Employees WHERE EmployeeID = @EMPLOYEE_ID");
    return employees.recordsets[0];
  } catch (error) {
    console.log(error);
  }
};

//allocate bus to employee
const allocateBus = async (busID, employeeID) => {
  try {
    const pool = await sql.connect(config);
    await pool
      .request()
      .query(
        "INSERT INTO dbo.EmployeeBuses (BusID, EmployeeID) VALUES (" +
          busID +
          ", " +
          employeeID +
          ")"
      );
  } catch (error) {
    console.log(error);
  }
};

//deallocate bus from employee
const deallocateBus = async (busID, employeeID) => {
  try {
    const pool = await sql.connect(config);
    await pool
      .request()
      .query(
        "DELETE FROM dbo.EmployeeBuses WHERE BusID = " +
          busID +
          " AND EmployeeID = " +
          employeeID
      );
  } catch (error) {
    console.log(error);
  }
};

//sell ticket
const sellTicket = async (
  ticketID,
  ticketPrice,
  ticketSeat,
  ticketBusID,
  ticketEmployeeID
) => {
  try {
    const pool = await sql.connect(config);
    await pool
      .request()
      .query(
        "INSERT INTO dbo.Tickets (TicketID, TicketPrice, TicketSeat, BusID, EmployeeID) VALUES (" +
          ticketID +
          ", " +
          ticketPrice +
          ", " +
          ticketSeat +
          ", " +
          ticketBusID +
          ", " +
          ticketEmployeeID +
          ")"
      );
  } catch (error) {
    console.log(error);
  }
};

/* U T I L I T Y   F U N C T I O N S */
const getColumnNames = async (tableName) => {
  let headings = [];
  try {
    const pool = await sql.connect(config);
    const cols = await pool
      .request()
      .query(
        `SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='${tableName}'`
      );
    headings = cols.recordsets[0].map((col) => col.COLUMN_NAME);
    return headings;
  } catch (error) {
    console.log(error);
  }
};
//getColumnNames("Buses").then((res)=>console.log(res));

const getIDFromCol = async (IDName,ColName,colValue, tableName) => {
  try {
    const pool = await sql.connect(config);
    const result = await pool
      .request()
      .input("VALUE", colValue)
      .query(`SELECT ${IDName} FROM dbo.${tableName} WHERE ${ColName} = @VALUE`);
    return result.recordset[0][IDName];
  } catch (error) {
    console.log(error);
  }
};
//getIDFromCol("PositionID","PositionName","Driver","Positions").then(console.log);

// getAllBuses().then((result) =>console.log("Buses: \n",result));
// getRouteFromCode("T2").then((result) => console.log(result["RouteID"]));
// getAllAllocatedBuses().then((result) =>console.log("Allocated: \n",result));
// getAllFaultyBuses().then((result) =>console.log("Faulty: \n",result));
// removeBus(1).then((result) =>console.log("Removed Bus: \n",result));
// removeEmployee(1).then((result) =>console.log("Removed Employee: \n",result));

module.exports = {
  getAllBuses,
  getAllEmployees,
  getAllDrivers,
  getAllWorkingBuses,
  getReadyForAllocationBuses,
  getAllAllocatedBuses,
  getAllFaultyBuses,
  removeBus,
  removeEmployee,
  addBus,
  addEmployee,
  allocateBus,
  deallocateBus,
  sellTicket,
  getIDFromCode,
  getColumnNames,
  getIDFromCol
};
