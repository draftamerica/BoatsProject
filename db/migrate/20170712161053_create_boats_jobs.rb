class CreateBoatsJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :boats_jobs do |t|
      t.integer :boat_id
      t.integer :job_id

      t.timestamps
    end
  end
end
