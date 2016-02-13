class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.integer :category
      t.integer :robot_id
      t.integer :level
      t.integer :experience

      t.timestamps null: false
    end
  end
end
