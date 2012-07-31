class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gender, :string
    add_column :users, :occupation, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :birthdate, :datetime
  end
end
