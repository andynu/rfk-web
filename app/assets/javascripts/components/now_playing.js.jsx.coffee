@NowPlaying = React.createClass
  getInitialState: ->
      connnection_status: false,
      song:
        rank: '',
        title: '',
        artist: '',
        album: ''

  
  render: ->
    song = this.props.song
    rank_polarity = 'ui right ribbon label '
    rank_polarity += 'green' if song.rank > 0
    rank_polarity += 'red' if song.rank < 0
    if song
      return `<div className='content song'>
                <div className={rank_polarity}>{song.rank}</div>
                <div className='title'>{song.title}</div>
                <div className='artist'>{song.artist}</div>
                <div className='album'>{song.album}</div>
              </div>`
    return `<div />`
