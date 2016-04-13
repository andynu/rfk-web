@Player = React.createClass
  render: ->
    `<div className='ui grid container'>
        <div className='row'>
          <div className='column'>

            <ConnectionStatus connection_status={this.props.connection_status} />

            <div className=''>
              <div className='ui segment'>
                <NowPlaying song={this.props.current_song} />
                <PlayerControls player_state={this.props.player_state} />
              </div>
            </div>

          </div>
        </div>
        <div className='row'>
          <div className='column'>

            <FilteredFolderList 
              folders={this.props.folders} 
              songs={this.props.songs} 
              request_count={this.props.request_count} />

          </div>
        </div>
    </div>
    `
