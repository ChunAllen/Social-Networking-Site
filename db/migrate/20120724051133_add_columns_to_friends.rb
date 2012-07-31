class AddColumnsToFriends < ActiveRecord::Migration
  def change
    add_column :friends, :name, :string
    add_column :friends, :location, :string
  end
end
