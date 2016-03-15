class Rfk
  constructor: ->
    this.baseurl = "http://#{window.location.hostname}:7778"
  status: (callback) ->
    $.getJSON "#{this.baseurl}/status", (data) ->
      callback(data)
  reward: () ->
    $.getJSON "#{this.baseurl}/reward"
  skip: () ->
    $.getJSON "#{this.baseurl}/skip"
  playpause: () ->
    $.getJSON "#{this.baseurl}/playpause"

window.rfk = new Rfk
