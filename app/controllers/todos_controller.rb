class TodosController < ApplicationController
  wrap_parameters false

  def index
    render json: Todo.all
  end

  def create
    render json: Todo.create(title: params[:title])
  end

  def toggle
    todo = Todo.find(params[:id])
    todo.toggle!(:completed)

    render json: todo
  end
end
