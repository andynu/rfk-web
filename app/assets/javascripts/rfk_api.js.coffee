class Rfk
  constructor: (baseUrl) ->
    @baseUrl = baseUrl

  skip: () ->
    $.post("#{@baseUrl}/skip")
  reward: () ->
    $.post("#{@baseUrl}/reward")
  playpause: () ->
    $.post("#{@baseUrl}/playpause")

window.Rfk = Rfk
