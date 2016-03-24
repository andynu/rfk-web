@Player = React.createClass
  render: ->
    `<div className='row'>
      <div className='col-xs-12'>
      <div className='player'>
      <PlayerControls />
      <NowPlaying song={this.props.current_song} />
      </div>
      </div>
    </div>
    `
