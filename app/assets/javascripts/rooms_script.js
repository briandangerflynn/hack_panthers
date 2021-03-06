$(document).ready(function() {
  console.log('rooms_script loaded')
  $('#borough').val("All")
  $('#borough').change(function(){
    if($(this).val() == "All"){
      console.log($(this).val())
      var boroughs = ["Bronx", "Brooklyn", "Manhattan", "Staten Island", "Queens"]}
      //TODO add all boroughs
    else {
      var boroughs = $(this).val();
      console.log(boroughs)
    }


    $.ajax({
      method: "GET",
      url: "/rooms",
      data: { filter: boroughs },
      success: function(data){
        $("#rooms-list").html("")
        console.log(data[0]);
        data.forEach(function(room){
          $("#rooms-list").append(
              `<div class='col s4'>
                <div class='card small'>
                  <div class='card-image'>
                    <img class='activator' src="` + room['thumbnail_url']+ `">
                  </div>
                  <div class='card-content'>
                    <span class='card-title activator grey-text text-darken-4' id='roomcardtitle'>`+ room['title'] + `
                    </span>
                        <p id='roomcards'>$ ` + room['price'] + ` per month</p>
                  </div>
                  <div class='card-reveal'>
                    <span class='card-title grey-text text-darken-4'>
                      <a href='/rooms/` + room['id'] + `'>` + room['title'] + `</a>
                    </span>
                      <p id='roomcards'>$` + room['price'] + ` per month</p>
                      <p id='roomcards'>` + room['borough'] + `</p>
                      <p id='roomcards'>` + room['description'] + `</p>
                      <i class='card-title activator' id='closelink'>close</i>
                  </div>
                </div>
              </div>
              `
            )
        })

      }
    });
  });
});
