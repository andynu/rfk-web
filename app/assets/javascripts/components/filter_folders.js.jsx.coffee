@Folder = React.createClass
  handleClick: (e) ->
    window.folder_search this.props.folder.full_path
  render: ->
    `<div className='folder list-group-item' onClick={this.handleClick}>{this.props.folder.path}</div>`

@FolderFilter = React.createClass
  handleFilter: (e) ->
    console.log e
  render: ->
    `<div>
      <input type='text' className='form-element' placeholder='filter' onChange={this.handleFilter} />
     </div>`

@FilteredFolderList = React.createClass
  render: ->
    folders = `<div/>`
    if this.props.folders.length > 0
      folders = []
      for f in this.props.folders
        console.log f
        folders.push `<Folder folder={f} />`

    `<div className='panel panel-default'>
      <div className='panel-heading'>
      <FolderFilter />
      </div>
      <div className='panel-body'>
        <div className='folders list-group'>{folders}</div>
      </div>
    </div>`
