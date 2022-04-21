const typeOptions = document.getElementById("bustype");
const busTypes = { C: 5, F: 10, T: 3 };
let routeCode = "";

typeOptions.addEventListener("change", function () {
  const selectedBusType = typeOptions.options[typeOptions.selectedIndex].value;
  const prefix = selectedBusType[0].toUpperCase();
  //DataList Object and append child
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

  // fetch("/addBus", {
  //   method: "POST",
  //     headers: {
  //       'Content-Type': 'application/json',
  //     },
  //     body: JSON.stringify(inputData),
  //   }).then((response) => response.json())
  //   //Then with the data from the response in JSON...
  //   .then((data) => {
  //     console.log('Success:', data);
  //   })
  //   //Then with the error genereted...
  //   .catch((error) => {
  //     console.error('Error:', error);
  //   });



  $.ajax({
    url: "/addBus",
    type: "POST",
    data: inputData,
    success: (res) => {
      alert(`${res}: Refill form to add Another Bus`);
    },
    error: function (res) {
      alert("server error occurred");
    },
  });
});
