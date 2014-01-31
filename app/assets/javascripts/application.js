// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require lazybox
//= require lolka
//= require jquery.modal
//= require jquery.ui.all
//= require owl.carousel
//= require js-routes
//= require jquery_ujs
//= require_tree.

$(document).ready(function() {
  $('a[rel*=lazybox]').lazybox({close: false, modal: false, opacity: 0.5, fixed: true, klass: 'lazybox', speed: 200});
  
  $(".unsub").click(function(event) {
    event.preventDefault();
    var subscribe = $(this);
    $.ajax({
      url: Routes.delid_places_path({plid: subscribe.attr('value') }),
      dataType: 'json',
      type: 'POST',
      success: function(e) {
      }
    });
    subscribe.addClass('subpassive');
    subscribe.removeClass('subactive');
    subscribe.closest('.subscription-subscribe-button').find('.sub').addClass('subactive');
    subscribe.closest('.subscription-subscribe-button').find('.sub').removeClass('subpassive');
    subscribe.closest('.subscribe-button').find('.sub').addClass('subactive');
    subscribe.closest('.subscribe-button').find('.sub').removeClass('subpassive');
    subscribe.closest('.subscribe-button2').find('.sub').addClass('subactive');
    subscribe.closest('.subscribe-button2').find('.sub').removeClass('subpassive');
  });


  $(".sub").click(function(event) {
    event.preventDefault();
    var subscribe = $(this);
    $.ajax({
      url: Routes.addid_places_path({plid: subscribe.attr('value') }),
      dataType: 'json',
      type: 'POST',
      success: function(e) {
      }
    });
    subscribe.addClass('subpassive');
    subscribe.removeClass('subactive');
    subscribe.closest('.subscription-subscribe-button').find('.unsub').addClass('subactive');
    subscribe.closest('.subscription-subscribe-button').find('.unsub').removeClass('subpassive');
    subscribe.closest('.subscribe-button').find('.unsub').addClass('subactive');
    subscribe.closest('.subscribe-button').find('.unsub').removeClass('subpassive');
    subscribe.closest('.subscribe-button2').find('.unsub').addClass('subactive');
    subscribe.closest('.subscribe-button2').find('.unsub').removeClass('subpassive');
  });


});


