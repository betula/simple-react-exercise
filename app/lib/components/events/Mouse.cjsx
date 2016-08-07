React = require 'react'

module.exports = React.createClass

  getInitialState: ->
    value: 'Hello!'
    log: []

  log: (text) ->
    @setState log: @state.log.concat text

  handleMouseClick: ->
    @log 'Click'

  handleMouseEnter: ->
    @log 'Enter'

  handleMouseLeave: ->
    @log 'Leave'

  render: ->
    <div className="mouse-box">
      <div
        className="interaction-area"
        onClick={ @handleMouseClick }
        onMouseEnter={ @handleMouseEnter }
        onMouseLeave={ @handleMouseLeave }
        >
        Mouse interaction block (click, mouse enter, mouse leave)
      </div>
      <div className="log">{ @state.log.join ', ' }</div>
    </div>
