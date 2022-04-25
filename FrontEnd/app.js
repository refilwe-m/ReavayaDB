const express = require("express");
const app = express();
const path = require("path");
const bodyParser = require("body-parser");
const {
  addBus,
  getIDFromCode,
  getIDFromCol,
  getTableHeadings,
  getAllBuses,
  getAllEmployees,
  getAllDrivers,
  getAllWorkingBuses,
  getReadyForAllocationBuses,
  getAllAllocatedBuses,
  getAllFaultyBuses,
  removeBus,
  removeEmployee,
  addEmployee,
  allocateBus,
  deallocateBus,
  sellTicket,
  getColumnNames,
} = require("./src/queries");

app.use("/static", express.static(__dirname));
app.use(express.static(path.join(__dirname + "/public")));
app.use(express.static(path.join(__dirname + "/public/scripts")));
app.use(express.static(path.join(__dirname + "/public/pages")));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.json()); //Check
//app.use(express.raw());

app.get("/", (req, res) => {
  res.sendFile(path.join(__dirname, "/public/pages/index.html"));
});

app.get("/dashboard", (req, res) => {
  res.sendFile(path.join(__dirname, "/public/pages/dashboard.html"));
});

app.get("/addBus", (req, res) => {
  res.sendFile(path.join(__dirname, "/public/pages/addBus.html"));
});

app.get("/getTable/:tableName", async (req, res) => {
  const tableName = req.params.tableName;
  const headings = await getColumnNames(tableName);
  const rows = await getAllBuses();
  res.send({ headings, rows });
});

app.get("/getAllBuses", async (req, res) => {
  const buses = await getAllBuses();
  res.send(buses);
});

app.get("/getAllDrivers", async (req, res) => {
  const drivers = await getAllDrivers();
  res.send(drivers);
});

app.get("/addEmployee", (req, res) => {
  res.sendFile(path.join(__dirname, "/public/pages/addEmployee.html"));
});

app.get("/allocateDrivers", (req, res) => {
  res.sendFile(path.join(__dirname, "/public/pages/allocateDrivers.html"));
});
app.get("/allocateStationManagers", (req, res) => {
  res.sendFile(
    path.join(__dirname, "/public/pages/allocateStationManagers.html")
  );
});
app.get("/addEmployee", (req, res) => {
  res.sendFile(path.join(__dirname, "/public/pages/addEmployee.html"));
});

/* app.get("/changeStatus", (req, res) => {
  getIDFromCol("Status","StatusID",4, "BusStatuses")
}); */

/* POST EndPoints */
app.post("/addBus", async (req, res) => {
  const { routeCode, registration, seats } = req.body;
  const codeID = await getIDFromCol(
    "CodeID",
    "CodeName",
    routeCode,
    "RouteCodes"
  );
  addBus(registration, codeID, seats);
  res.send("Added Bus");
});

app.post("/addEmployee", async (req, res) => {
  const { role, firstName, lastName, dob, address, email, phone } = req.body;
  const roleID = await getIDFromCol(
    "PositionID",
    "PositionName",
    role,
    "Positions"
  );
  addEmployee(roleID, firstName, lastName, dob, address, phone, email);
  res.send("Employee Added Successfully");
});

app.post("/allocateDrivers", async (req, res) => {
  const { busID, employeeName, startDate, endDate } = req.body;
  const employeeID = await getIDFromCode(
    "EmployeeID",
    "FirstName",
    employeeName,
    "Employees"
  );
  allocateBus(busID, employeeID, startDate, endDate);
  res.send("Driver Allocated Successfully");
});

/*
app.post("/sellTicket", (req) => {
  const { TicketID, TicketPrice, TicketSeat, BusID, EmployeeID } = req.body;
  sellTicket(TicketID, TicketPrice, TicketSeat, BusID, EmployeeID).then((result) => {result.send("Ticket Sold Successfully");}
  );
});
*/
const port = 3000;
app.listen(port, () => console.log(`Running on port http://localhost:${port}`));
