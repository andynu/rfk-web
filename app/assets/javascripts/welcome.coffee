# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@state = {}
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

    @state =
      connection_status: true
      player_state: data.PlayPauseState
      current_song: current_song


    ReactDOM.render(
      React.createElement(Player, @state ),
      document.getElementById('player'))

