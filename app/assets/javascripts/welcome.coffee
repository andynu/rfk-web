# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@state =
  current_song: null
  connection_status: false
  player_state: 'paused'
  folders: []
  songs: []
  request_hashes: []

$ ->
  now_playing()
  setInterval now_playing, 1000
  requests()
  setInterval requests, 5000
  window.folder_search(null)

now_playing = () ->
  window.rfk.status (data) =>
    @state.connection_status = true
    @state.player_state = data.PlayPauseState
    @state.current_song =
      title: data.CurrentSongMeta.Title
      artist: data.CurrentSongMeta.Artist
      album: data.CurrentSongMeta.Album
      rank: data.CurrentSong.Rank

    rerender()

requests = () ->
  window.rfk.requests (requests) =>
    @state.request_hashes = []
    for song in requests
      @state.request_hashes.push song.Hash
    rerender()

window.folder_search = (path) ->
  window.browse.folders {path: path}, (data) ->
    console.log data
    @state.folders = data.folders
    @state.songs = data.songs
    rerender()

rerender = ->
  ReactDOM.render(
    React.createElement(Player, @state ),
    document.getElementById('player'))
 
window.rerender = rerender
