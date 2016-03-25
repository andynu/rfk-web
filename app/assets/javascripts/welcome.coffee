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
  paths: []

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
    @state.request_count = @state.request_hashes.length
    rerender()

window.clear_requests = (path) ->
  window.rfk.clearRequests () =>
    @state.request_hashes = []
    @state.request_count = 0
    rerender()

window.request_path = (path) ->
  window.rfk.requestByPath path, (data) ->
    console.log data
    rerender()

window.folder_search = (path) ->
  window.browse.folders {path: path}, (data) ->
    console.log data
    @state.folders = data.folders
    @state.songs = data.songs
    rerender()

window.push_path = (path) ->
  @state.paths.push path
  rerender()

window.pop_path = () ->
  path = @state.paths.pop()
  rerender()
  path

rerender = ->
  ReactDOM.render(
    React.createElement(Player, @state ),
    document.getElementById('player'))
 
window.rerender = rerender
