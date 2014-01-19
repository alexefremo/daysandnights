ready = ->
  $("#event_search").val ""
  $("#event_search").datepicker
    dateFormat: "yy-mm-dd"
    yearRange: "c-5:c+0"
    prevText: "<<"
    nextText: ">>"
    onSelect: (dateText, inst) ->
      $(".events-search").submit()
  $('#login-link').click ->
    $('.sign-window').addClass('on')
    $('.sign-window-back').addClass('on')
  $('.sign-window-back').click ->
    $('.sign-window').removeClass('on')
    $('.sign-window-back').removeClass('on')
  owl = $(".owl-carousel")
  owl.owlCarousel
    autoPlay: true
    items: 1
    stopOnHover: true
    responsive: false
    autoHeight: true
    lazyEffect: false
    afterInit: (elem) ->
      that = this
      that.owlControls.prependTo elem
  $(".next").click ->
    owl.trigger "owl.next"
  $(".prev").click ->
    owl.trigger "owl.prev"

$(document).ready(ready)
$(document).on('page:load', ready)

