# == Schema Information
#
# Table name: todos
#
#  id         :integer          not null, primary key
#  completed  :boolean          default(FALSE)
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
class Todo < ApplicationRecord
  belongs_to :user
end
