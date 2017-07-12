class CreateBoats < ActiveRecord::Migration[5.1]
  def change
    create_table :boats do |t|
      t.integer :user_id
      t.string :name
      t.integer :containers
      t.string :location

      t.timestamps
    end
  end
end
