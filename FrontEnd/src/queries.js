const sql = require("mssql/msnodesqlv8");
const config = require("../config");
//const SP = require("../../StoredProcedures.sql");

//Connect to Database
const dbConnect = new sql.connect(config, (err) =>
  err
    ? console.log(err)
    : console.log("connected to database: " + config.database)
);

//Functions to interact with DB
const getAllBuses = async ()=>{
  try {
    const pool = await sql.connect(config);
    const buses = await pool.request().query("SELECT * FROM dbo.Buses");
    return buses.recordsets[0];
  } catch (error) {
    console.log(error);
  }
}

const getAllEmployees = async ()=>{
  try {
    const pool = await sql.connect(config);
    const employees = await pool.request().query("SELECT * FROM dbo.Employees");
    return employees.recordsets[0];
  } catch (error) {
    console.log(error);
  }
}

const getAllDrivers = async ()=>{try {
  const pool = await sql.connect(config);
  const drivers = await pool.request().query("SELECT * FROM dbo.Employees WHERE PositionID = 3");
  return drivers.recordsets[0];
} catch (error) {
  console.log(error);
}
}

//Get All working busses
getAllWorkingBuses = async ()=>{
  try {
    const pool = await sql.connect(config);
    const buses = await pool.request().query("SELECT * FROM dbo.Buses WHERE HealthStatus = 1");
    return buses.recordsets[0];
  } catch (error) {
    console.log(error);
  }
}

//Get Working & Unallocated Buses
getReadyForAllocationBuses = async ()=>{
  try {
    const pool = await sql.connect(config);
    const buses = await pool.request().query("SELECT * FROM dbo.Buses WHERE BusID NOT IN (SELECT BusID FROM dbo.EmployeeBuses) AND HealthStatus = 1");
    return buses.recordsets[0];
  } catch (error) {
    console.log(error);
  }
}

//Get All Allocated Buses
getAllAllocatedBuses = async ()=>{
  try {
    const pool = await sql.connect(config);
    const buses = await pool.request().query("SELECT * FROM dbo.Buses WHERE BusID IN (SELECT BusID FROM dbo.EmployeeBuses)");
    return buses.recordsets[0];
  } catch (error) {
    console.log(error);
  }
}

//Get Faulty Buses
getAllFaultyBuses = async ()=>{
  try {
    const pool = await sql.connect(config);
    const buses = await pool.request().query("SELECT * FROM dbo.Buses WHERE HealthStatus = 0");
    return buses.recordsets[0];
  } catch (error) {
    console.log(error);
  }
}

//Remove Bus
const removeBus = async (busID)=>{
  try {
    const pool = await sql.connect(config);
    const buses = await pool.request().query("DELETE FROM dbo.Buses WHERE BusID = " + busID);
    return buses.recordsets[0];
  } catch (error) {
    console.log(error);
  }
}

//Remove Employee
removeEmployee = async (employeeID)=>{
  try {
    const pool = await sql.connect(config);
    const employees = await pool.request().query("DELETE FROM dbo.Employees WHERE EmployeeID = " + employeeID);
    return employees.recordsets[0];
  } catch (error) {
    console.log(error);
  }
}


//add new bus
const addBus = async (busID, busType, busModel, busCapacity, busHealthStatus)=>{
  try {
    const pool = await sql.connect(config);
    const buses = await pool.request().query("INSERT INTO dbo.Buses (BusID, BusType, BusModel, BusCapacity, HealthStatus) VALUES (" + busID + ", '" + busType + "', '" + busModel + "', " + busCapacity + ", " + busHealthStatus + ")");
    return buses.recordsets[0];
  } catch (error) {
    console.log(error);
  }
}

//add new employee
const addEmployee = async (employeeID, employeeName, employeeSurname, employeeEmail, employeePhone, employeeAddress, employeePositionID, employeeHealthStatus)=>{
  try {
    const pool = await sql.connect(config);
    const employees = await pool.request().query("INSERT INTO dbo.Employees (EmployeeID, EmployeeName, EmployeeSurname, EmployeeEmail, EmployeePhone, EmployeeAddress, PositionID, HealthStatus) VALUES (" + employeeID + ", '" + employeeName + "', '" + employeeSurname + "', '" + employeeEmail + "', '" + employeePhone + "', '" + employeeAddress + "', " + employeePositionID + ", " + employeeHealthStatus + ")");
    return employees.recordsets[0];
  } catch (error) {
    console.log(error);
  }
}

//allocate bus to employee
const allocateBus = async (busID, employeeID)=>{
  try {
    const pool = await sql.connect(config);
    const buses = await pool.request().query("INSERT INTO dbo.EmployeeBuses (BusID, EmployeeID) VALUES (" + busID + ", " + employeeID + ")");
    return buses.recordsets[0];
  } catch (error) {
    console.log(error);
  }
}

//deallocate bus from employee
const deallocateBus = async (busID, employeeID)=>{
  try {
    const pool = await sql.connect(config);
    const buses = await pool.request().query("DELETE FROM dbo.EmployeeBuses WHERE BusID = " + busID + " AND EmployeeID = " + employeeID);
    return buses.recordsets[0];
  } catch (error) {
    console.log(error);
  }
}

//sell ticket
const sellTicket = async (ticketID, ticketPrice, ticketSeat, ticketBusID, ticketEmployeeID)=>{
  try {
    const pool = await sql.connect(config);
    const tickets = await pool.request().query("INSERT INTO dbo.Tickets (TicketID, TicketPrice, TicketSeat, BusID, EmployeeID) VALUES (" + ticketID + ", " + ticketPrice + ", " + ticketSeat + ", " + ticketBusID + ", " + ticketEmployeeID + ")");
    return tickets.recordsets[0];
  } catch (error) {
    console.log(error);
  }
}


//getAllBuses().then((result) =>console.log("Buses: \n",result));
//getAllEmployees().then((result) =>console.log("Employees: \n",result));
//getAllDrivers().then((result) =>console.log("Drivers: \n",result));
//getAllWorkingBuses().then((result) =>console.log("Working: \n",result));
//getReadyForAllocationBuses().then((result) =>console.log("Unallocated: \n",result));
//getAllAllocatedBuses().then((result) =>console.log("Allocated: \n",result));
//getAllFaultyBuses().then((result) =>console.log("Faulty: \n",result));
//removeBus(1).then((result) =>console.log("Removed Bus: \n",result));
//removeEmployee(1).then((result) =>console.log("Removed Employee: \n",result));



module.exports = {getAllBuses, getAllEmployees};
