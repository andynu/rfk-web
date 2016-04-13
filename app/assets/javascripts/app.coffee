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
  path: null
  paths: []


$ ->
  now_playing()
  setInterval now_playing, 1000
  requests()
  setInterval requests, 5000
  folder_search(null)

window.rerender = rerender = ->
  ReactDOM.render(
    React.createElement(Player, @state ),
    document.getElementById('player'))

window.dispatch = dispatch = (action) ->
  @state = reducer(action, @state)
  rerender()

reducer = (action, state) ->
  console.log action
  switch action.type

    when 'now_playing'
      data = action.data
      state.connection_status = true
      state.player_state = data.PlayPauseState
      state.current_song =
        title: data.CurrentSongMeta.Title
        artist: data.CurrentSongMeta.Artist
        album: data.CurrentSongMeta.Album
        rank: data.CurrentSong.Rank

    when 'requests'
      requests = action.requests
      state.request_hashes = []
      if requests isnt null
        for song in requests
          state.request_hashes.push song.Hash
      state.request_count = state.request_hashes.length

    when 'clear_requests'
      state.request_hashes = []
      state.request_count = 0

    when 'search'
      state.folders = action.data.folders
      state.songs = action.data.songs

    when 'folder_search'
      state.folders = action.data.folders
      state.songs = action.data.songs

    when 'push_path'
      state.paths.push action.path

    when 'pop_path'
      state.path = state.paths.pop()

  return state

now_playing = () ->
  window.rfk.status (data) ->
    dispatch({type: 'now_playing', data: data})

requests = () ->
  window.rfk.requests (requests) ->
    dispatch({type: 'requests', requests: requests})

window.clear_requests = (path) ->
  window.rfk.clearRequests () =>
    dispatch({type: 'clear_requests'})

window.request_path = (path) ->
  window.rfk.requestByPath path, (data) ->
    dispatch({type:'request_path', data: data})

window.search = search = (term) ->
  window.browse.search {term: term}, (data) ->
    dispatch({type: 'search', data: data})

window.folder_search = folder_search = (path) ->
  window.browse.folders {path: path}, (data) ->
    dispatch({type: 'folder_search', data: data})

window.push_path = (path) ->
  dispatch({type: 'push_path', path: path})

window.pop_path = () ->
  dispatch({type: 'pop_path'})
  @state.path
