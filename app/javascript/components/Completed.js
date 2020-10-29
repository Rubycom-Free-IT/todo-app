import React from 'react'

import TodoList from './TodoList'

const Completed = ({ items, handleChange }) => {
  return (
    <div className="card">
      <div className="card-header">
        DONE
      </div>
      <div className="card-body">
        <TodoList items={ items } handleChange={ handleChange } />
      </div>
    </div>
  )
}

export default Completed
