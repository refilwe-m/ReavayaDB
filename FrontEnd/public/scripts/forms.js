
    const hamburger = document.querySelector(".fa-bars");
    const menu = document.querySelector(".nav-links");
   
    
    hamburger.addEventListener("click", () => {
        hamburger.classList.toggle("nav-active")
    
    
    
        menu.classList.toggle("nav-active")
    });