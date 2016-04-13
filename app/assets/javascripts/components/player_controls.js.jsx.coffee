@PlayerControls = React.createClass
  handleReward: ->
    window.rfk.reward()
  handleSkip: ->
    window.rfk.skip()
  handlePause: ->
    window.rfk.playpause()

  render: ->
    switch this.props.player_state
      when 'playing' then playpause = `<i className='icon pause' />`
      when 'paused' then playpause = `<i className='icon play' />`

    `<div className='extra content'>
      <div className='ui three item menu'>
        <a className='item' onClick={this.handlePause}>
          {playpause}
        </a>
        <a className='item' onClick={this.handleReward}>
          <i className='thumbs up icon' /> reward
        </a>
        <a className='item' onClick={this.handleSkip}>
          <i className='thumbs down icon' /> skip
        </a>
      </div>
    </div>`
