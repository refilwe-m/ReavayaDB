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
document
  .getElementsByClassName("side-links")[0]
  .addEventListener("click", () => {
    inputData = "Buses";
    $.ajax({
      url: `/getTable/${inputData}`,
      type: "GET",
      data: inputData,
      success: (res) => {
        createTable(tableObject, res);
      },
      error: function (res) {
        alert("server error occurred");
      },
    });
    document.getElementById("bus-data").appendChild(tableObject);
  });

