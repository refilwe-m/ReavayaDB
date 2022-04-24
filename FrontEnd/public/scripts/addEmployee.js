const btnAddEmployee = document.getElementById("btnAddEmployee");
const roleOptions = document.getElementById("role");
let roleName = "";
roleOptions.addEventListener("change", () => {
  roleName = roleOptions.options[roleOptions.selectedIndex].value;
});
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
  
btnAddEmployee.addEventListener("click", () => {
  const inputData = {
    role: roleName,
    firstName: document.getElementById("firstName").value,
    lastName: document.getElementById("lastName").value,
    dob: document.getElementById("dob").value,
    address: document.getElementById("address").value,
    email: document.getElementById("email").value,
    phone: document.getElementById("phone").value,
  };
  fetchPost("http://localhost:3000/addEmployee", inputData);
});
