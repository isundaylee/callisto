class AddImageUriToRobots < ActiveRecord::Migration
  def change
    add_column :robots, :image_uri, :string
  end
end
