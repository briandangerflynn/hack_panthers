$(document).ready(function() {

  $('#borough').change(function(){
    if($(this).val() === "All") var boroughs = ["Bronx", "Brooklyn", "Manhattan", "Staten Island", "Queens"]
      //TODO add all boroughs
    else var boroughs = $(this).val();

    $.ajax({
      method: "GET",
      url: "/rooms",
      data: { filter: boroughs },
      success: function(data){
        console.log(data[0]);
        data.forEach(function(room){
          $("#rooms-test").append("<div class='col s4'><div class="card small"><div class="card-image"><img class="activator" src="thumbnail"></div><div class="card-content"><span class="card-title activator grey-text text-darken-4" id="roomcardtitle">" + room['title'] + "</span><p id="roomcards">" + room['price'] + "</p></div><div class="card-reveal"><span class="card-title grey-text text-darken-4"><a href='/rooms/'" + room['id'] + ">" + room['title'] + "</a></span><p id="roomcards">" + room['price'] + "per month</p><p id="roomcards">" + room['borough'] + "</p><p id="roomcards">" + room['description'] + "</p><i class="card-title activator" id="closelink">close</i></div></div></div>");
        });

    ZiggeoApi.Events.on("submitted", function (data) {
        var token = data.video.token
        $('#recorded-vid').html("")
        popup.hidePopup();
        $("#video_token").val(token)
        $("#recorded-vid").append("<ziggeo ziggeo-width='360' ziggeo-height='270' ziggeo-video='" + token + "'></ziggeo>");
    });


        // Loop over data (which is a collection of  Rooms)
        // Build a little HTML box for each room and append to the DOM
      }
    });
  });
});
