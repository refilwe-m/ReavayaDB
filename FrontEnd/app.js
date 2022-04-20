const express = require("express");
const app = express();
const path = require("path");
const bodyParser = require("body-parser");
const {
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
  getRouteFromCode,
} = require("./src/queries");

app.use("/static", express.static(__dirname));
app.use(express.static(path.join(__dirname + "/public")));
app.use(express.static(path.join(__dirname + "/public/scripts")));
app.use(bodyParser.urlencoded({ extended: true }));

app.get("/", (req, res) => {
  res.sendFile(path.join(__dirname, "/public/index.html"));
});

app.get("/dashboard", (req, res) => {
  res.sendFile(path.join(__dirname, "/public/dashboard.html"));
});

app.get("/addBus", (req, res) => {
  res.sendFile(path.join(__dirname, "/public/addBus.html"));
});

app.get("/addEmployee", (req, res) => {
  res.sendFile(path.join(__dirname, "/public/addEmployee.html"));
});

app.get("/allocateDrivers", (req, res) => {
  res.sendFile(path.join(__dirname, "/public/allocateDrivers.html"));
});
app.get("/allocateStationManagers", (req, res) => {
  res.sendFile(path.join(__dirname, "/public/allocateStationManagers.html"));
});
app.get("/addEmployee", (req, res) => {
  res.sendFile(path.join(__dirname, "/public/addEmployee.html"));
});

app.post("/addBus", async (req, res) => {
  const { buscode, registration, seats } = req.body;
  const output = await getRouteFromCode(buscode).then((result) => {
    return addBus(buscode, registration, seats, output);
  });
  //console.log(result["RouteID"]);


  //res.status(201).send("Bus Added Successfully");
});
/*
app.post("/addEmployee", (req, res) => {
  const { EmployeeID, EmployeeName, EmployeeSurname, EmployeeEmail, EmployeePhone, EmployeeAddress, PositionID, HealthStatus } = req.body;
  addEmployee(EmployeeID, EmployeeName, EmployeeSurname, EmployeeEmail, EmployeePhone, EmployeeAddress, PositionID, HealthStatus).then((result) => {result.send("Employee Added Successfully");}
  );

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
