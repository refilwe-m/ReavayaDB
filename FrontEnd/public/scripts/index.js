const login = document.getElementById("login-btn");
login.addEventListener("click", () => {
  const userName = document.getElementById("username").value;
localStorage.setItem("txtValue", userName);
});
