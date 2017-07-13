class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments, :force => true do |t|
      t.integer :user_id
      t.integer :job_id
      t.text :comment

      t.timestamps
    end
  end
end
