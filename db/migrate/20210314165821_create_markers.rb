class CreateMarkers < ActiveRecord::Migration[6.1]
  def change
    create_table :markers do |t|
      t.integer :user_id
      t.string :title
      t.string :info
      t.integer :lng
      t.integer :lat
      t.timestamps
    end
  end
end
