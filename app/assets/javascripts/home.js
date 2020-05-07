// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function () {
  var searchInput = 'searchbar';
  var autocomplete;
  autocomplete = new google.maps.places.Autocomplete((document.getElementById(searchInput)), {
    type: ['grocery_or_supermarket'],
    fields: ["name", "address_component", "formatted_address", "geometry.location", "opening_hours"]
    });

google.maps.event.addListener(autocomplete, 'place_changed', function () {
  var near_place = autocomplete.getPlace();

  });

});