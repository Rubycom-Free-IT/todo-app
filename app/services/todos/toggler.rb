class Todos::Toggler
  TODO_PRICE = 100

  attr_reader :todo

  def initialize(todo)
    @todo = todo
  end

  def call
    ActiveRecord::Base.transaction do
      todo.update(completed: !todo.completed)

      if todo.completed?
        user = todo.user
        user.user_point.update(points: user.user_point.points + TODO_PRICE)
      end

      some_error
    end

    todo
  rescue StandardError => e
    false
  end

  private

  def some_error
    raise 'a'
  end
end
