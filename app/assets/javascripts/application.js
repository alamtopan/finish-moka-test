//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require cocoon

function AlertClose(){
  $('.alert .close').click(function(){
    $('.section-alert').hide();
  });

  $('.section-alert').click(function(){
    $('.section-alert').hide();
  });
}

$(document).ready(function(){
  AlertClose();
});