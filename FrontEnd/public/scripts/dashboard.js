const tableObject = document.createElement("TABLE");

const createTableHeadings = (tableObject, headings) => {
  tableObject.createTHead();
  for (let heading of headings) {
    const th = document.createElement("th");
    th.innerHTML = heading;
    tableObject.tHead.appendChild(th);
  }
};

//View Bus DashBoard
document
  .getElementsByClassName("side-links")[0]
  .addEventListener("click", () => {
    inputData = "Buses";
    $.ajax({
      url: `/tableHeadings/${inputData}`,
      type: "GET",
      data: inputData,
      success: (res) => {
        createTableHeadings(tableObject, res);
      },
      error: function (res) {
        alert("server error occurred");
      },
    });
    document.getElementById("bus-data").appendChild(tableObject);
  });
//Get Table Length
// tableObject.tHead.appendChild(th).value = "BusID";
// console.log(tableObject);
