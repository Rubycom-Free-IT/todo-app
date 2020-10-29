import React from 'react'

const TodoList = ({ items, handleChange }) => {
  return (
    <ul className="list-group list-group-flush">
      {
        items.map((item) => {
          return (
            <li className="list-group-item" key={item.id}>
              <div className="form-check">
                <input
                  className="form-check-input"
                  type="checkbox"
                  value=""
                  checked={item.completed}
                  id={`checkbox${item.id}`}
                  onChange={ () => { handleChange(item) } }
                />
                <label
                  className="form-check-label"
                  htmlFor={`checkbox${item.id}`}
                >
                  { item.title }
                </label>
              </div>
            </li>
          )
        })
      }
    </ul>
  )
}

export default TodoList
