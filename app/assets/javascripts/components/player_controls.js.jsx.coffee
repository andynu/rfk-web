@PlayerControls = React.createClass
  handleReward: ->
    window.rfk.reward()
  handleSkip: ->
    window.rfk.skip()
  handlePause: ->
    window.rfk.playpause()

  render: ->
    switch this.props.player_state
      when 'playing' then playpause = `<i className='fa fa-pause' />`
      when 'paused' then playpause = `<i className='fa fa-play' />`

    `<div className='player_controls'>
      <div className='btn btn-default' onClick={this.handlePause}>
        {playpause}
      </div>
      <div className='btn btn-default' onClick={this.handleReward}>
        <i className='fa fa-thumbs-o-up' /> reward
      </div>
      <div className='btn btn-default' onClick={this.handleSkip}>
        <i className='fa fa-thumbs-o-down' /> skip
      </div>
    </div>`
