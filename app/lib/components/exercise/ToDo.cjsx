React = require 'react'

module.exports = React.createClass

  getInitialState: ->
    tasks: [
      { done: true, text: 'Task 1' }
      { done: false, text: 'Task 2' }
      { done: false, text: 'Task 3' }
    ]

  removeTask: (removedTask) ->
    tasks = []
    for task in @state.tasks
      if task isnt removedTask
        tasks.push task

    @setState tasks: tasks

  render: ->
    <div className="todo-box">
      <ul>
        {@state.tasks.map (task) =>
          <li className={if task.done then 'done'}>

            <input type="checkbox" checked={task.done} />
            <span>{task.text}</span>
            <button onClick={ => @removeTask task }>Remove</button>

          </li>
        }
      </ul>
      <div className="add">
        <input />
        <button>Add task</button>
      </div>
    </div>
