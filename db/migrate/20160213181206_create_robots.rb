class CreateRobots < ActiveRecord::Migration
  def change
    create_table :robots do |t|
      t.integer :level
      t.integer :category
      t.string :name
      t.integer :strength
      t.integer :speed
      t.integer :health
      t.integer :experience
      t.integer :user_id
      t.string :identifier

      t.timestamps null: false
    end
  end
end
