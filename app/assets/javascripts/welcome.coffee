# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  now_playing()
  setInterval now_playing, 1000

now_playing = () ->

  window.rfk.status (data) =>
    current_song =
      title: data.CurrentSongMeta.Title
      artist: data.CurrentSongMeta.Artist
      album: data.CurrentSongMeta.Album
      rank: data.CurrentSong.Rank

    ReactDOM.render(
      React.createElement(Player, current_song:current_song),
      document.getElementById('player'))

