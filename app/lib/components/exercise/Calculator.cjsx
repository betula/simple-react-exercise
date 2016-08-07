React = require 'react'

module.exports = React.createClass

  getInitialState: ->
    result: 0

  render: ->
    <div className="calculator-box">
      <input /> + <input /> = { @state.result } <button>Calc</button>
    </div>
