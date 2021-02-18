class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.float :latitude
      t.float :longitude
      t.string :address
      t.datetime :opening_time
      t.datetime :closing_time

      t.timestamps
    end
  end
end
