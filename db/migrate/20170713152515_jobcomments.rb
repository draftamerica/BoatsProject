class Jobcomments < ActiveRecord::Migration[5.1]
  def change
      rename_column(:comments, :post_id, :job_id)
  end
end
