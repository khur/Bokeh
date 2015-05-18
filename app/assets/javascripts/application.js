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
//= require bootstrap
//= require turbolinks
//= require_tree .

$(document).ready(function() {
    $('#user_index').pinterest_grid({
        no_columns: 4,
        padding_x: 10,
        padding_y: 10,
        margin_bottom: 50,
        single_column_breakpoint: 700
    });
});

$(document).ready(function() {
    $('#user_contest_index').pinterest_grid({
        no_columns: 7,
        padding_x: 10,
        padding_y: 10,
        margin_bottom: 50,
        single_column_breakpoint: 700
    });
});


$('.user_contest_entry').click(function() {
    $('#user_contest_index').pinterest_grid({
        no_columns: 7,
        padding_x: 10,
        padding_y: 10,
        margin_bottom: 50,
        single_column_breakpoint: 700
    });
})

var currentBackground = 0;
var backgrounds = [];
backgrounds[0] = 'http://image.desk7.net/Plant%20Wallpapers/7799_1680x1050.jpg';
backgrounds[1] = 'http://www.magic4walls.com/wp-content/uploads/2014/03/flowers-daisy-vintage-spring-beautiful-nature-plant-photo-hd-wallpaper.jpg';
backgrounds[2] = 'http://img01.deviantart.net/365b/i/2015/120/0/f/searching_for_shelter_by_liiinux-d8rli2v.jpg';
backgrounds[3] = 'http://image.desk7.net/Landscape%20Wallpapers/9869_1680x1050.jpg';
backgrounds[4] = 'http://74211.com/wallpaper/picture_big/Beautiful-Bird-Photography-Little-Bird-with-Long-and-Colorful-Mouth.jpg';
backgrounds[5] = 'http://hdwallpapersfit.com/wp-content/uploads/2015/01/water-beautiful-beach-photography-hd.jpg';


function changeBackground() {
    currentBackground++;
    if (currentBackground > 5) currentBackground = 0;

    $('.bg').fadeOut(100, function() {
        $('.bg').css({
            'background': "url('" + backgrounds[currentBackground] + "')" + "no-repeat center center fixed",
            'background-size': "cover"
        });
        $('.bg').fadeIn(1000);
    });

    setTimeout(changeBackground, 5000);
}

$(document).ready(function() {
    setTimeout(changeBackground, 5000);
});
