class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.string :name
      t.integer :skill_id

      t.timestamps null: false
    end
  end
end
