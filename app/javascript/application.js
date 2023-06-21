// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require jquery
//= require semantic-ui
import "@hotwired/turbo-rails"
import "controllers" 

//This makes the chatbox to be scrolled down by default

window.scroll_bottom = function() {
  if ($('#messages').length > 0) {
    $('#messages').scrollTop($('#messages')[0].scrollHeight);
  }
}


window.submit_message = function() {
  $('#message_body').on('keydown', function(e) {
    if (e.keyCode == 13) {
      $('button').click();
      e.target.value = "";
    };
  });
};



$(function() {     $('.ui.dropdown').dropdown(); }); 
// $(document).on('turbo:load', function(){ //     $('.ui.dropdown').dropdown(); // })
$('.message .close')
  .on('click', function() {
    $(this)
      .closest('.message')
      .transition('fade')
    ;
  })
  scroll_bottom();
  submit_message();
;

import "channels"
