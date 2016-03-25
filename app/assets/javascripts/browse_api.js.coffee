class Browse
  constructor: ->
    this.baseurl = "#{window.location}"

  folders: (params, callback) ->
    $.getJSON "#{this.baseurl}folders", params, (data) ->
      callback(data)

  songs: (params, callback) ->
    $.getJSON "#{this.baseurl}songs", params, (data) ->
      callback(data)

window.browse = new Browse
