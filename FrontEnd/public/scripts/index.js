// js code

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
btnLogin[1].addEventListener("click", () => {
  welcomeMsg.innerText = "Welcome, Administrator";
  const modal = document.querySelector(".modal-bg");
  modal.classList.add("modal-active");
});


btnClose.addEventListener("click", () => {
  document.querySelector(".modal-bg").classList.remove("modal-active");
});

