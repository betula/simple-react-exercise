React = require 'react'
Keyboard = require './events/Keyboard'
Mouse = require './events/Mouse'
Calculator = require './exercise/Calculator'
ToDo = require './exercise/ToDo'

module.exports = React.createClass

  render: ->
    <div>
      <h1>Keyboard</h1>
      <Keyboard />
      <h1>Mouse</h1>
      <Mouse />
      <h1>Calculator (exercise)</h1>
      <Calculator />
      <h1>ToDo (exercise)</h1>
      <ToDo />
    </div>

