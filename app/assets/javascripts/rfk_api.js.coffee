class Rfk
  constructor: ->
    this.baseurl = "http://#{window.location.hostname}:7778"
  status: (callback) ->
    $.getJSON "#{this.baseurl}/status", (data) ->
      callback(data) unless callback is undefined or data is undefined
  reward: () ->
    $.getJSON "#{this.baseurl}/reward"
  skip: () ->
    $.getJSON "#{this.baseurl}/skip"
  playpause: () ->
    $.getJSON "#{this.baseurl}/playpause"
  requests: (callback) ->
    $.getJSON "#{this.baseurl}/requests", (data) ->
      callback(data) unless callback is undefined or data is undefined
  request: (hash, callback) ->
    $.ajax
      url: "#{this.baseurl}/request"
      dataType: 'json'
      data:
        hash: hash
      success: (data) ->
        callback(data) unless callback is undefined or data is undefined


window.rfk = new Rfk
