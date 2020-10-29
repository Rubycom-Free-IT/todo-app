import React, { useState } from 'react'

import InProgress from './InProgress'
import Completed from './Completed'

const TodoApp = ({ defaultTodos }) => {
  const token = document.querySelector('meta[name="csrf-token"]').content
  const [todos, setTodos] = useState(defaultTodos)

  const handleChange = (item) => {
    fetch(`/todos/${item.id}/toggle`,
      {
        method: 'POST',
        headers: {
          'X-CSRF-Token': token
        }
      })
      .then((response) => {
        return response.json();
      })
      .then((data) => {
        setTodos(todos.map((todo) => { return (todo.id == data.id) ? data : todo }))
      });
  }

  const filterTodos = (items, completed) => {
    return items.filter((item) => { return item.completed == completed })
  }

  return (
    <div className="container mt-5">
      <div className="row">
        <div className="col-md-6">
          <InProgress items={ filterTodos(todos, false) } handleChange={ handleChange } />
        </div>

        <div className="col-md-6">
          <Completed items={ filterTodos(todos, true) } handleChange={ handleChange } />
        </div>
      </div>
    </div>
  );
}

export default TodoApp

