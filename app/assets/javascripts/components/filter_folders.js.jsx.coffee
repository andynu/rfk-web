@UpDir = React.createClass
  handleClick: (e) ->
    window.folder_search window.pop_path()

  render: ->
    `<div className='folder list-group-item' onClick={this.handleClick}>
      <i className='fa fa-music text-muted' />
      &nbsp;
      ...
      </div>`

@Song = React.createClass
  handleClick: (e) ->
    window.rfk.request this.props.song.audio_hash, (requests) ->
      window.state.request_hashes = []
      for song in requests
        #console.log song
        window.state.request_hashes.push song.Hash
      window.rerender()

  render: ->
    request_badge = `<div/>`
    request_badge = `<i className='fa fa-list' />` if _.indexOf(window.state.request_hashes, this.props.song.audio_hash) > -1
    `<div className='song list-group-item' onClick={this.handleClick}>
      <i className='fa fa-music text-muted' />
      &nbsp;
      <div className='pull-right'>{request_badge}</div>
      {this.props.song.title}
      </div>`

@Folder = React.createClass
  cwd: (e) ->
    window.push_path this.props.folder.full_path
    window.folder_search this.props.folder.full_path
  requestPath: (e) ->
    e.preventDefault()
    e.stopPropagation()
    window.request_path this.props.folder.full_path
  render: ->
    request_badge = `<div className='btn btn-default btn-xs' onClick={this.requestPath}>
      <i className='fa fa-list' />
      </div>`

    `<div className='folder list-group-item' onClick={this.cwd}>
      <i className='fa fa-folder text-muted' />
      &nbsp;
      <div className='pull-right'>{request_badge}</div>
      {this.props.folder.path}
      </div>`

@FolderFilter = React.createClass
  handleFilter: (e) ->
    console.log e
  render: ->
    `<div>
      <input type='text' className='form-element' placeholder='filter' onChange={this.handleFilter} />
     </div>`

@FilteredFolderList = React.createClass
  clearRequests: (e) ->
    window.clear_requests()
  render: ->
    folders = `<div/>`
    if this.props.folders.length > 0
      folders = []
      for f in this.props.folders
        folders.push `<Folder folder={f} />`

    songs = `<div/>`
    if this.props.songs != null && this.props.songs.length > 0
      songs = []
      for s in this.props.songs
        songs.push `<Song song={s} />`

    `<div className='panel panel-default'>
      <div className='panel-heading'>
      <div className='pull-right'>
        <div className='badge'>{this.props.request_count}</div>
        <div className='btn btn-default btn-xs' onClick={this.clearRequests}>
          <i className='fa fa-list' />
          <i className='fa fa-times' />
        </div>
      </div>
      <FolderFilter />
      </div>
      <div className='list-group'>
        <UpDir />
        {folders}
        {songs}
      </div>
    </div>`
