// app/javascript/packs/dropdown.js

  var dropdownTrigger = document.getElementById("dropdownTrigger");
  
  if (dropdownTrigger) {
    dropdownTrigger.addEventListener("click", function(e){
      e.preventDefault();
      console.log("wwwwww111");
      e.stopPropagation(); 
      dropdownToggle();
    });
  }

  function dropdownToggle(){
    var dropdown = document.getElementById("dropdown-menu4");
    console.log(window.getComputedStyle(dropdown).display);
    if (window.getComputedStyle(dropdown).display === "none") {
        dropdown.style.display = "block";
        console.log("1");
    } else {
        dropdown.style.display = "none";
        console.log("2");
    }
  }

