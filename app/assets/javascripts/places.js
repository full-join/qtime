// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// let place_id = function(){
//   let partial = window.location.search;
//   let foo = partial.split('=');
//   alert(foo);
// } 
 document.addEventListener("DOMContentLoaded", function(){
   let name = localStorage.getItem("currentStore");
   const currentStoreDiv = (document.getElementById('currentstore'))
    // if (currentStoreDiv !== null) {
      let p = document.createElement("p");
      p.innerHTML = "You are at " + name + "!";
      document.getElementById('currentstore').appendChild(p);
    // } 



    function lineWait() {
      
      document.getElementById('lineStatus').innerHTML = 'In Store!';
    }

    $('#lineStatus').click(lineWait);

 })