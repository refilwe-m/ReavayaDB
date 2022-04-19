const sql = require("mssql/msnodesqlv8");
const config = require("../config");
//const SP = require("../../StoredProcedures.sql");

//const pool = await sql.connect(config);

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
    return buses.recordsets[0][0];
  } catch (error) {
    console.log(error);
  }
}

const getAllEmployees = async ()=>{
  try {
    const pool = await sql.connect(config);
    const employees = await pool.request().query("SELECT * FROM dbo.Employees");
    return employees.recordsets[0][0];
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

//getAllBuses().then((result) =>console.log(result));
//getAllEmployees().then((result) =>console.log(result));
//getAllDrivers().then((result) =>console.log(result));

module.exports = {getAllBuses, getAllEmployees};
//module.exports = getBuses;
