class CreateMarkerMaps < ActiveRecord::Migration[6.1]
  def change
    create_table :marker_maps do |t|
      t.integer :marker_id
      t.integer :map_id
      t.timestamps
    end
  end
end
