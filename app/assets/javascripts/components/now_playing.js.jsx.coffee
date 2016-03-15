@NowPlaying = React.createClass
  fetch: ->
    return this.getInitialState()
  componentDidMount: ->
    this.fetch()
    setInterval(this.fetch, this.pollInterval)
  getInitialState: ->
    return { title: '' }
  render: ->
    `<div>Now Playing: {this.props.title}</div>`
