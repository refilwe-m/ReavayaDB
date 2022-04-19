// js code
const btnAddBus = document.getElementsByClassName("btn")[0];

btnAddBus.addEventListener("click", () => {
  document.getElementById("seats").value !== "" ? alert("Added Your slow bus"): alert("Please enter the number of seats");
})



/* Modal */
const btnLogin = document.querySelectorAll(".modal-btn");
const btnClose = document.querySelector("#close-modal");
const welcomeMsg = document.querySelector("#welcome-msg");
//Stuff Login
btnLogin[0].addEventListener("click", () => {
  welcomeMsg.innerText = "Welcome, Administrator";
  alert("Hello Sibongile")
  const modal = document.querySelector(".modal-bg");
  modal.classList.add("modal-active");
});


btnClose.addEventListener("click", () => {
  document.querySelector(".modal-bg").classList.remove("modal-active");
});

//Verify Login
verifyLogin = (username, password) => {
  if (fakeLoginSchema[username] === password) {
    return true;
  } else {
    return false;
  }
};

document.querySelector("#login-btn").addEventListener("click", () => {
  const username = document.querySelector("#username").value;
  const password = document.querySelector("#password").value;
  if (verifyLogin(username, password)) {
    document.querySelector(".modal-bg").classList.remove("modal-active");
    document.querySelector("#welcome-msg").innerText = "Welcome, " + username;
  } else {
    alert("Invalid username or password");
  }
});