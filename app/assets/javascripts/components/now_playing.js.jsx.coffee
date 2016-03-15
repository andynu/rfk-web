@NowPlaying = React.createClass
  fetch: ->
    window.rfk.status (data) =>
      this.setProps
        title: data.CurrentSongMeta.Title
        artist: data.CurrentSongMeta.Artist
        album: data.CurrentSongMeta.Album
        rank: data.CurrentSong.Rank

  componentDidMount: ->
    console.log this
    this.fetch()
    setInterval(this.fetch, 1000)

  getInitialState: ->
    return { title: '' }

  render: ->
    `<div className='song'>
      <div className='rank'>{this.props.rank}</div>
      <div className='title'>{this.props.title}</div>
      <div className='artist'>{this.props.artist}</div>
      <div className='album'>{this.props.album}</div>
    </div>`
