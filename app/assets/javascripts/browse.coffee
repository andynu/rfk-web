# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
app = {}
window.app = app
$ ->
  app.rfk = new Rfk
  $('#search').on 'dblclick', '.song', (e) ->
    rfk.request($(this).data('hash'))

  app.requests = new Requests
  app.requests.load()

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
      app.rfk.requestByPath($(this).data('path'))
      app.requests.load()
    else
      $(this).find(".request").remove()
      app.rfk.unrequestByPath($(this).data('path'))
      app.requests.load()

  # all
  $("a.request-all.list-group-item").on 'click', ->
    if $(this).find(".request").length == 0
      items = $(this).parents('.list-group').find('.list-group-item')
      items.find(".request").remove()
      items.prepend("<div class='request pull-right'>&nbsp;<i class='fa fa-list'></i></div>")
      rfk.requestByPath($(this).data('path'))
      app.requests.load()
    else
      elitems = $(this).parents('.list-group').find('.list-group-item')
      elitems.find(".request").remove()
      app.rfk.unrequestByPath($(this).data('path'))
      app.requests.load()

class Requests
  load: ->
    if $('#requests').length > 0
      app.rfk.requests (data) =>
        @render(data)

  render: (data) =>
    unless data is undefined or data is null
      div = $('#requests')
      div.html('')
      for req in data
        div.append """
        <div class='list-group-item'>#{req['Path']}</div>
        """

class Rfk
  requestByPath: (path, success) ->
    $.ajax
      url: "http://#{window.location.hostname}:7778/searchRequest",
      data:
        term: path
      success: (data) ->
        console.log data
        success(data) unless success is undefined or data is undefined

  unrequestByPath: (path, success) ->
    $.ajax
      url: "http://#{window.location.hostname}:7778/searchUnrequest",
      data:
        term: path
      success: (data) ->
        console.log data
        success(data) unless success is undefined or data is undefined

  request: (hash, success) ->
    $.ajax
      url: "http://#{window.location.hostname}:7778/request"
      data:
        hash: $(this).data('hash')
      success: (data) ->
        console.log data
        success(data) unless success is undefined or data is undefined

  requests: (success) ->
    $.ajax
      url: "http://#{window.location.hostname}:7778/requests"
      dataType: 'json'
      success: (data) ->
        success(data) unless success is undefined or data is undefined
