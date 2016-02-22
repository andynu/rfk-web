# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#search').on 'dblclick', '.song', (e) ->
    $.ajax
      url: 'http://localhost:7778/request'
      data:
        hash: $(this).data('hash')
      success: (data) ->
        console.log data
  if $('requests').length
    $.ajax
      url: 'http://localhost:7778/requests'
      success: (data) ->
        console.log data
