class AddContentType < ActiveRecord::Migration[5.1]
  def change
      add_column :photos, :content_type, :string
  end
end
