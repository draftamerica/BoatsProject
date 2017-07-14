class AddPhotosToBoats < ActiveRecord::Migration[5.1]
  def change
      add_column :photos, :boat_id, :integer
  end
end
