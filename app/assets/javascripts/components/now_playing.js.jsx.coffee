@NowPlaying = React.createClass
  fetch: ->
    window.rfk.status (data) =>
      console.log data
      this.setProps
        title: data.CurrentSongMeta.Title
        artist: data.CurrentSongMeta.Artist
        album: data.CurrentSongMeta.Album


  componentDidMount: ->
    this.fetch()
    setInterval(this.fetch, 1000)
  getInitialState: ->
    return { title: '' }
  render: ->
    `<div class='song'>
      <div class='title'>{this.props.title}</div>
      <div class='artist'>{this.props.artist}</div>
      <div class='album'>{this.props.album}</div>
    </div>`
