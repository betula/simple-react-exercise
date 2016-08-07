
React = require 'react'
ReactDOM = require 'react-dom'
Page = require '../lib/components/Page'

bootstrap = ->
  ReactDOM.render <Page />, document.getElementById 'page'

if document.body and document.readyState in [ 'complete', 'loaded', 'interactive' ]
  bootstrap()
else
  window.addEventListener 'DOMContentLoaded', bootstrap, false


