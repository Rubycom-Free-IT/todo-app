class CreateUserPoints < ActiveRecord::Migration[6.0]
  def change
    create_table :user_points do |t|
      t.integer :user_id, null: false
      t.integer :points, default: 0, null: false

      t.timestamps
    end
  end
end
