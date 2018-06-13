class CreateWaypoints < ActiveRecord::Migration[5.1]
  def change
    create_table :waypoints do |t|
      t.float :latitude
      t.float :longitude
      t.references :vehicle, foreign_key: true

      t.timestamps
    end
  end
end
