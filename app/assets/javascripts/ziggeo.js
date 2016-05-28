// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

9a95cf8a3aab6600613e3de746e4340debb3af61

ZiggeoApi.Videos.index({}, {
            success: function (args, videos) {
              for (var i = 0; i < videos.length; ++i)
                $("body").append("<ziggeo ziggeo-video='" + videos[i].token + "'></ziggeo>");
            }
        });


// ZiggeoApi.Videos.image( {
//   success: function (args, result) {
//     // Success
//   },
//   failure: function (args, error) {
//     // Failure
//   }
// });


