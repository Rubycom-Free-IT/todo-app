class TodosController < ApplicationController
  before_action :authenticate_user!
  wrap_parameters false

  def index
    render json: current_user.todos.all
  end

  def create
    render json: current_user.todos.create(title: params[:title])
  end

  def toggle
    todo = current_user.todos.find(params[:id])

    if Todos::Toggler.new(todo).call
      render json: todo
    else
      render json: { error: 'some error' }, status: :unprocessable_entity
    end
  end
end
