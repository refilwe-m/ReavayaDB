const sql = require("mssql/msnodesqlv8");
const config = require("../config");

const dbConnect = new sql.connect(config, (err) =>
  err
    ? console.log(err)
    : console.log("connected to database: " + config.database)
);

async function getBuses() {
    try {
      const pool = await sql.connect(config);
      const buses = await pool.request().query("SELECT * FROM dbo.Buses");
      return buses.recordsets;
    } catch (error) {
      console.log(error);
    }
  }
module.exports = dbConnect;
module.exports = getBuses;
