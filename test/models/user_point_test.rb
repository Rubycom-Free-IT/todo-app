# == Schema Information
#
# Table name: user_points
#
#  id         :integer          not null, primary key
#  points     :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
require 'test_helper'

class UserPointTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
