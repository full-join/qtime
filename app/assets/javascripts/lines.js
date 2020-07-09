// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

 document.addEventListener("DOMContentLoaded", function(){
  console.log("JSLoaded")
   let name = localStorage.getItem("currentStore");
   const currentStoreDiv = (document.getElementById('currentstore'))
    if (currentStoreDiv !== null) {
      document.querySelector('#currentstore').innerHTML = "You are at " + name + "!";
    } 

    function lineWait() {
      document.getElementById('lineStatus').innerHTML = 'In Store!';
    }

    $('#lineStatus').click(lineWait);

 })