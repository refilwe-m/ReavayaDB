const typeOptions = document.getElementById("bustype");
const busTypes = { C: 5, F: 10, T: 3 };
let routeCode = "";

const fetchPost = (url, data) => {
  fetch(url, {
    method: "POST",
    headers: {
      Accept: "application/json",
      "Content-Type": "application/json",
    },
    body: JSON.stringify(data),
  }).then((res) => alert(res));
};

typeOptions.addEventListener("change", () => {
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
codeOptions.addEventListener("change", function () {
  if (codeOptions.value.trim() != "") {
    routeCode = codeOptions.value;
  }
});

const btnAddBus = document.getElementById("btnAddBus");
btnAddBus.addEventListener("click", () => {
  const inputData = {
    routeCode: routeCode,
    registration: document.getElementById("registration").value,
    seats: document.getElementById("seats").value,
  };

  fetchPost("http://localhost:3000/addBus", inputData);
});
