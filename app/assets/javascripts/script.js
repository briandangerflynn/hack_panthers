$(document).ready(function() {
  console.log('script.js loaded')
  $(".white-text.grey").click(function(data){
    var x = $('#renters_id').val()
    console.log(x)
 })

    $('select').material_select();
    $('.parallax').parallax();



});
