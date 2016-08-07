
React = require 'react'

Page = React.createClass

  componentWillMount: ->
    @message = 'Hello World!'

  render: ->
    <h1>{@message}</h1>

module.exports = Page
