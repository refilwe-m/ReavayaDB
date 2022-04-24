const login = document.getElementById("login-btn");
login.addEventListener("click", () => {
  const userName = document.getElementById("username").value;
console.log(userName)
localStorage.setItem("txtValue", userName);
});
