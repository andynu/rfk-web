@UpDir = React.createClass
  handleClick: (e) ->
    window.folder_search window.pop_path()

  render: ->
    `<div className='folder item' onClick={this.handleClick}>
      <i className='folder icon' />
      <div className='content'>
      &hellip;
      </div>
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
    request_badge = `<i className='list icon' />` if _.indexOf(window.state.request_hashes, this.props.song.audio_hash) > -1

    `<div className='song item' onClick={this.handleClick}>
      <div className='pull-right'>{request_badge}</div>
      <i className='music icon' />
      <div className='content'>
      {this.props.song.title}
      </div>
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
    request_badge = `<div className='' onClick={this.requestPath}>
      <i className='list icon' />
    </div>`

    `<div className='folder item' onClick={this.cwd}>
      <div className='right floated content'>{request_badge}</div>
      <i className='icon folder' />
      <div className='content'>
      {this.props.folder.path}
      </div>
    </div>`

@FolderFilter = React.createClass
  handleFilter: (e) ->
    console.log e
  render: ->
    `<div className='ui form'>
      <input type='text' className='' placeholder='filter' onChange={this.handleFilter} />
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

    `<div className=''>
      <div className='ui menu'>
        <div className='item'>
          <FolderFilter />
        </div>
        <div className='item'>
          <div className='ui label'>
            <i className='list icon' />
            {this.props.request_count}
          </div>
        </div>
        <div className='item'>
          <button className='ui icon button' onClick={this.clearRequests}>
            <i className='remove icon' />
          </button>
        </div>
      </div>
      <div className='ui relaxed divided list'>
        <UpDir />
        {folders}
        {songs}
      </div>
    </div>`
