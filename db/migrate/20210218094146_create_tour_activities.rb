class CreateTourActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :tour_activities do |t|
      t.boolean :completed
      t.string :start_time
      t.string :finish_time

      t.timestamps
    end
  end
end
