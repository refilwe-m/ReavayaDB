// js code
fakeLoginSchema = {
  "refilweIT22": "passwoRd",
  "wisaniHR23": "passwoRd",
}
/* Modal */
const btnLogin = document.querySelectorAll(".modal-btn");
const btnClose = document.querySelector("#close-modal");
const welcomeMsg = document.querySelector("#welcome-msg");
//Stuff Login
btnLogin[0].addEventListener("click", () => {
  welcomeMsg.innerText = "Welcome, Stuff Member";
  const modal = document.querySelector(".modal-bg");
  modal.classList.add("modal-active");
});

//HR Login
btnLogin[1].addEventListener("click", () => {
  welcomeMsg.innerText = "Welcome, Admin";
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