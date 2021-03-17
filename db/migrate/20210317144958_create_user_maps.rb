class CreateUserMaps < ActiveRecord::Migration[6.1]
  def change
    create_table :user_maps do |t|
      t.integer :user_id
      t.integer :map_id
      t.timestamps
    end
  end
end
