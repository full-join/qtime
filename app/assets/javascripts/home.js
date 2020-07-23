// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function () {
  let searchInput = 'searchbar';
  let autocomplete;
  autocomplete = new google.maps.places.Autocomplete((document.getElementById(searchInput)), {
    type: ['grocery_or_supermarket'],
    fields: ["name", "address_component", "formatted_address", "geometry.location", "opening_hours", "place_id"]
    });


google.maps.event.addListener(autocomplete, 'place_changed', function () {
    let near_place = autocomplete.getPlace();
    let resultsElement = document.getElementById("results")
    let locationLink = '<a href="/places?placeId='+near_place.place_id+'">'+near_place.name+'</a>';
    $(resultsElement).html(locationLink);
});

});