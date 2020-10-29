import React, { useState, useEffect } from 'react'

import InProgress from './InProgress'
import Completed from './Completed'

const TodoApp = () => {
  const token = document.querySelector('meta[name="csrf-token"]').content
  const [todos, setTodos] = useState([])

  useEffect(() => {
    fetch('/todos').then((response) => {
        return response.json();
      })
      .then((data) => {
        setTodos(data)
      });
  }, []);

  const handleChange = (item) => {
    fetch(`/todos/${item.id}/toggle`,
      {
        method: 'POST',
        headers: {
          'X-CSRF-Token': token,
          'Content-Type': 'application/json'
        }
      })
      .then((response) => {
        return response.json();
      })
      .then((data) => {
        setTodos(todos.map((todo) => { return (todo.id == data.id) ? data : todo }))
      });
  }

  const handleNewTodo = (event) => {
    let target = event.target

    if (event.key === 'Enter') {
      fetch(`/todos`,
        {
          method: 'POST',
          headers: {
            'X-CSRF-Token': token,
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({
            title: target.value
          })
        })
        .then((response) => {
          return response.json();
        })
        .then((data) => {
          target.value = ''
          setTodos([...todos, data])
        });
    }
  }

  const filterTodos = (items, completed) => {
    return items.filter((item) => { return item.completed == completed })
  }

  return (
    <div className="container mt-5">
      <div className="row">
        <div className="col-md-6">
          <InProgress items={ filterTodos(todos, false) } handleChange={ handleChange } handleNewTodo={ handleNewTodo } />
        </div>

        <div className="col-md-6">
          <Completed items={ filterTodos(todos, true) } handleChange={ handleChange } />
        </div>
      </div>
    </div>
  );
}

export default TodoApp

