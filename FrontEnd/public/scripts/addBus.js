const typeOptions = document.getElementById("bustype");
const busTypes = { C: 5, F: 10, T: 3 };
let routeCode = "";

typeOptions.addEventListener("change", function () {
  const selectedBusType = typeOptions.options[typeOptions.selectedIndex].value;
  const prefix = selectedBusType[0].toUpperCase();
  let html = '<datalist  id="codes"  > ';
  for (let i = 1; i <= busTypes[prefix]; i++) {
    html += `<option value="${prefix}${i}">`;
  }
  html += "</datalist>";
  document.getElementById("buscode").innerHTML = html;
});

const codeOptions = document.getElementById("buscode");
//const  = document.getElementById("codes");

codeOptions.addEventListener("change", function () {
  if (codeOptions.value.trim() != "") {
    routeCode = codeOptions.value;
  }
});

const btnAddBus = document.getElementById("btnAddBus");
btnAddBus.addEventListener("click", function () {
  const inputData = {
    routeCode: routeCode,
    registration: document.getElementById("registration").value,
    seats: document.getElementById("seats").value,
  };
  $.ajax({
    url: "/addBus",
    type: "POST",
    data: inputData,
    success: (res) => {
      console.log(res);
      alert("Bus Added Successfully");
    },
    error: function (res) {
      alert("server error occurred");
    },
  });
});
