class NewUser
  include ActiveModel::Model

  attr_accessor :email, :password, :starting_points

  validates :email, :password, :starting_points, presence: true
  validates :starting_points, numericality: { greater_than: 0, only_integer: true }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :password, length: { minimum: 8 }

  def save
    return false if invalid?

    user = User.create(email: email, password: password)
    UserPoint.create(user: user, points: starting_points)

    true
  end
end
