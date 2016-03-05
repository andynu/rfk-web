# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#search').on 'dblclick', '.song', (e) ->
    $.ajax
      url: "http://#{host()}:7778/request"
      data:
        hash: $(this).data('hash')
      success: (data) ->
        console.log data

  if $('requests').length
    $.ajax
      url: "http://#{host()}:7778/requests"
      success: (data) ->
        console.log data

  # swipe: Interferes with scrolling
  # one song
  #$("a.song.list-group-item").on 'swiperight', ->
  #  if $(this).find(".request").length == 0
  #    $(this).prepend("<div class='request pull-right'>&nbsp;<i class='fa fa-list'></i></div>")
  #$("a.song.list-group-item").on 'swipeleft', ->
  #  $(this).find(".request").remove()

  ## all
  #$("a.request-all.list-group-item").on 'swiperight', ->
  #  items = $(this).parents('.list-group').find('.list-group-item')
  #  items.find(".request").remove()
  #  items.prepend("<div class='request pull-right'>&nbsp;<i class='fa fa-list'></i></div>")

  #$("a.request-all.list-group-item").on 'swipeleft', ->
  #  items = $(this).parents('.list-group').find('.list-group-item')
  #  items.find(".request").remove()
  
  ## doubletap
  # one song
  $("a.song.list-group-item").on 'click', ->
    if $(this).find(".request").length == 0
      $(this).prepend("<div class='request pull-right'>&nbsp;<i class='fa fa-list'></i></div>")
      requestByPath($(this).data('path'))
    else
      $(this).find(".request").remove()
      unrequestByPath($(this).data('path'))

  # all
  $("a.request-all.list-group-item").on 'click', ->
    if $(this).find(".request").length == 0
      items = $(this).parents('.list-group').find('.list-group-item')
      items.find(".request").remove()
      items.prepend("<div class='request pull-right'>&nbsp;<i class='fa fa-list'></i></div>")
      requestByPath($(this).data('path'))
    else
      elitems = $(this).parents('.list-group').find('.list-group-item')
      elitems.find(".request").remove()
      unrequestByPath($(this).data('path'))

host = () ->
  window.location.hostname

requestByPath = (path) ->
  $.ajax
    url: "http://#{host()}:7778/searchRequest",
    data:
      term: path
    success: (data) ->
      console.log data

unrequestByPath = (path) ->
  $.ajax
    url: "http://#{host()}:7778/searchUnrequest",
    data:
      term: path
    success: (data) ->
      console.log data
