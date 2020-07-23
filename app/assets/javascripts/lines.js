// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// $('#lineStatus').on('click', function(){
var path_array = window.location.search.split('=');
var google_id = path_array[1];


$.ajax({
    type: 'POST',
    url: '/lines',
    data: {
      google_id: google_id,
      line: {
        arrived_at: new Date()
      }
    },
    // success: function(){
    //   alert('success!')
    // }
});