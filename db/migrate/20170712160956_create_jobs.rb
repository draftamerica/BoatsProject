class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.integer :user_id
      t.integer :containers
      t.text :description
      t.integer :cost
      t.string :origin
      t.string :destination

      t.timestamps
    end
  end
end
