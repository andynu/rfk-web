class Rfk
  constructor: ->
    this.baseurl = "http://#{window.location.hostname}:7778"
  status: (callback) ->
    $.getJSON "#{this.baseurl}/status", (data) ->
      callback(data)

window.rfk = new Rfk
