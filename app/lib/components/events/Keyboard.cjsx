React = require 'react'

#
# for documentation see https://facebook.github.io/react/docs/forms.html
#

module.exports = React.createClass

  getInitialState: ->
    value: 'Type here anything'

  handleChange: (event) ->
    @setState
      value: event.target.value

  render: ->
    <div className="keyboard-box">
      <input value={ @state.value } onChange={ @handleChange } />
      <div className="output">
        You type: <span>{ @state.value }</span>
      </div>
    </div>
