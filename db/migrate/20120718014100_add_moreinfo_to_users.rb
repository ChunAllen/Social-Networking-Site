class AddMoreinfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :status, :string
    add_column :users, :country, :string
    add_column :users, :bio, :string
  end
end
