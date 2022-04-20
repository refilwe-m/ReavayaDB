const typeOptions = document.getElementById("bustype");
const busTypes = { C: 5, F: 10, T: 3 };

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

const btnAddBus = document.getElementById("btnAddBus");
btnAddBus.addEventListener("click", function () {

});
