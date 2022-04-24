// const hamburger = document.querySelector(".hamburger");
// const menu = document.querySelector(".nav-links");
// console.log(hamburger)
// console.log(menu)

// hamburger.addEventListener("click", () => {
//     hamburger.classList.toggle("active")

//     menu.classList.toggle("active")
// });

// document.querySelectorAll(".nav-item").forEach(n => n.addEventListener("click", () => {
//     hamburger.classList.remove("active");
//     menu.classList.remove("active")
// }))

const login = document.getElementById("login-btn");
console.log(login)
const welcomeMsg = document.getElementById("Welcome-msg")
console.log(welcomeMsg)
const admins = {
  Itumeleng: "itumeleng@gmail.com",
  Nomcebo: "nomcebo@gmail.com",
  Refilwe: "refilwe@gmail.com",
  Wisani: "wisani@gmail.com",
};
const userName = document.getElementById("username").value;
const password = document.getElementById("password").value;
 login.addEventListener("click", () => {
 
  console.log(password)

  for (let key in admins) {
    //   for (let ema)
    if (userName === admins[key] && password.length > 0) {
       
 document.getElementById("loginError").textContent = "";
     document.getElementById("loginError").textContent = "";
     return
   
    } 

  }

    document.getElementById("loginError").textContent = "Incorrect username or password";
    document.getElementById("loginError").style.color = "red";
// console.log("Incorrect user or password")
// } else {
//     document.getElementById("loginError").textContent = "";
//     // window.location = "otherpage.html";

// }
});
