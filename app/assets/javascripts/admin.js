// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

$(document).ready(function() {
	$( document ).on('turbolinks:load', function() {

    $('img[data-enlargable]').addClass('img-enlargable').click(function(e){
        e.stopImmediatePropagation();
        var src = $(this).attr('src').replace(/ \([^)]\) */g, '');
        console.log(src);
        $('<div>').css({
            background: 'RGBA(0,0,0,.7) url('+src+') no-repeat center',
            backgroundSize: 'contain',
            width:'100%', height:'100%',
            position:'fixed',
            zIndex:'10000',
            top:'0', left:'0',
            cursor: 'zoom-out',

        }).click(function(){
            $(this).remove();
        }).appendTo('body');
      });
    })
});
var slider = document.getElementByClass('slider-card');
var width = slider.offsetWidth;
slider.style.left = 'calc(50vw - ' + width / 2 + 'px)';