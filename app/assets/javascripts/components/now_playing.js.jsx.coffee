@NowPlaying = React.createClass
  getInitialState: ->
    {
      connnection_status: false,
      song: {
        rank: '',
        title: '',
        artist: '',
        album: ''
      }
    }
  render: ->
    if this.props.song
      return `<div className='song'>
                <div className='rank'>{this.props.song.rank}</div>
                <div className='title'>{this.props.song.title}</div>
                <div className='artist'>{this.props.song.artist}</div>
                <div className='album'>{this.props.song.album}</div>
              </div>`
    return `<div />`
