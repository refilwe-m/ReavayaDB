const tableObject = document.createElement("TABLE");

const createTableHead = (tableObject, headings) => {
  tableObject.createTHead();
  for (let heading of headings) {
    const th = document.createElement("th");
    th.innerHTML = heading;
    tableObject.tHead.appendChild(th);
  }
};

const createTableBody = (tableObject, rows) => {
  const nRows = rows.length;
  for (let i = 0; i < nRows; i++) {
    const tr = document.createElement("tr");
    tr.className = "tr";
    const row = rows[i];
    for (const cell in row) {
      const td = document.createElement("td");
      td.innerHTML = row[cell];
      tr.appendChild(td);
    }
    tableObject.appendChild(tr);
  }
};

const createTable = (tableObject, { headings, rows }) => {
  createTableHead(tableObject, headings);
  createTableBody(tableObject, rows);
};

//View Bus DashBoard
const btnViewDashboard = document.getElementsByClassName("dashboard")[0];
btnViewDashboard.addEventListener("click", (event) => {
  event.preventDefault();
  //event.preventOnload = true;
  inputData = "Buses";
  fetch(`http://localhost:3000/getTable/${inputData}`, {
    method: "GET",
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json",
    },
  }).then(async (res) => {
    const results = await res.json();
    console.log(results);
    createTable(tableObject, results);
    //const Statuses = await res.json();
    //change Status
  });
  document.getElementById("bus-data").appendChild(tableObject);
});
