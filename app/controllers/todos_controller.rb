class TodosController < ApplicationController
  def toggle
    todo = Todo.find(params[:id])
    todo.toggle!(:completed)

    render json: todo
  end
end
