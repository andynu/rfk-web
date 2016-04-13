@ConnectionStatus = React.createClass
  getInitialState: ->
    {
      connection_status: false
    }
  render: ->
    if !this.props.connection_status
      return `<div className='alert alert-danger'>Not connected.</div>`
    return `<div />`
