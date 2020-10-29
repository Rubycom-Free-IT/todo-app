import React from 'react'

import TodoList from './TodoList'

const InProgress = ({ items, handleChange, handleNewTodo }) => {
  return (
    <div className="card">
      <div className="card-header">
        TODO
      </div>
      <div className="card-body">
        <input type="text" className="form-control add-todo" placeholder="Add todo" onKeyDown={handleNewTodo}/>
        <hr/>
        <TodoList items={ items } handleChange={ handleChange } />
      </div>
    </div>
  )
}

export default InProgress
