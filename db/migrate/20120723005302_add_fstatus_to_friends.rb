class AddFstatusToFriends < ActiveRecord::Migration
  def change
    add_column :friends, :status, :integer
       
  end
end
