class CreateFights < ActiveRecord::Migration
  def change
    create_table :fights do |t|
      t.integer :challenger_id
      t.integer :challengee_id

      t.timestamps null: false
    end
  end
end
