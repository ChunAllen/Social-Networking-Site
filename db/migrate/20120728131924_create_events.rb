class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.string :event_name
      t.text :details
      t.string :where
      t.date :when
      t.string :time

      t.timestamps
    end
  end
end
