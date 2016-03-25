@Player = React.createClass
  render: ->
    `<div className='container-fluid'>
        <div className='row'>
          <div className='col-xs-12'>
            <ConnectionStatus connection_status={this.props.connection_status} />
            <div className='player'>
              <PlayerControls player_state={this.props.player_state} />
              <NowPlaying song={this.props.current_song} />
            </div>
          </div>
        </div>
        <div className='row'>
          <div className='col-xs-12'>
            <FilteredFolderList folders={this.props.folders} />
          </div>
        </div>
    </div>
    `
