@PlayerControls = React.createClass
  handleReward: ->
    window.rfk.reward()
  handleSkip: ->
    window.rfk.skip()
  handlePause: ->
    window.rfk.playpause()

  render: ->
    `<div className='player_controls'>
      <div className='btn btn-default' onClick={this.handlePause}>
        <i className='fa fa-play' />
        <i className='fa fa-pause' />
      </div>
      <div className='btn btn-default' onClick={this.handleReward}>
        <i className='fa fa-thumbs-o-up' /> reward
      </div>
      <div className='btn btn-default' onClick={this.handleSkip}>
        <i className='fa fa-thumbs-o-down' /> skip
      </div>
    </div>`
