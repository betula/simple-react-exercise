React = require 'react'
Keyboard = require './events/Keyboard'
Mouse = require './events/Mouse'
Calculator = require './exercise/Calculator'

module.exports = React.createClass

  render: ->
    <div>
      <h1>Keyboard</h1>
      <Keyboard />
      <h1>Mouse</h1>
      <Mouse />
      <h1>Calculator (exercise)</h1>
      <Calculator />
    </div>

