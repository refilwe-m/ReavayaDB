const admins = {
  "itumeleng@gmail.com": "Itumeleng",
   "nomcebo@gmail.com": "Nomcebo",
  "refilwe@gmail.com":"Refilwe",
  "wisani@gmail.com":"Wisani"
};

let Answer = localStorage.getItem("txtValue");
console.log (admins[Answer])
document.getElementById("Welcome-msg").innerHTML = "Welcome, " + admins[Answer] + "."
document.getElementById("Welcome-msg").style.color = "rgb(49, 189, 199";
document.getElementById("Welcome-msg").style.fontSize = "2.5em";
document.getElementById("Welcome-msg").style.marginLeft = "1em";
document.getElementById("Welcome-msg").style.marginBottom = "1.5em";



