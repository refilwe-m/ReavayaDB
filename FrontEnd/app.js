const express = require("express");
const app = express();
const path = require("path");
const bodyParser = require("body-parser");
const {
  addBus,
  getIDFromCode,
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
  // console.log('get');
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

/* POST EndPoints */
app.post("/addBus", async (req, res) => {
  const { routeCode, registration, seats } = req.body;
  console.log("Body Post", req.body);
  const codeID = await getIDFromCode(routeCode);
  addBus(registration, codeID, seats);
  //console.log("Added Bus");
  res.send("Added Bus");
  //res.redirect("/dashboard");
});

app.post("/addEmployee", (req, res) => {
  const {
    EmployeeID,
    EmployeeName,
    EmployeeSurname,
    EmployeeEmail,
    EmployeePhone,
    EmployeeAddress,
    PositionID,
    HealthStatus,
  } = req.body;
  addEmployee(
    EmployeeID,
    EmployeeName,
    EmployeeSurname,
    EmployeeEmail,
    EmployeePhone,
    EmployeeAddress,
    PositionID,
    HealthStatus
  );
  res.send("Employee Added Successfully");
});
/*
app.post("/allocateDrivers", (req, res) => {
  const { BusID, EmployeeID } = req.body;
  allocateBus(BusID, EmployeeID).then((result) => {result.send("Driver Allocated Successfully");}
  );
});


app.post("/sellTicket", (req) => {
  const { TicketID, TicketPrice, TicketSeat, BusID, EmployeeID } = req.body;
  sellTicket(TicketID, TicketPrice, TicketSeat, BusID, EmployeeID).then((result) => {result.send("Ticket Sold Successfully");}
  );
});
*/
const port = 3000;
app.listen(port, () => console.log(`Running on port http://localhost:${port}`));
