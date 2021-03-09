class UpdateStringsToDateTimes < ActiveRecord::Migration[6.0]
  def change
    remove_column :tour_activities, :start_time
    remove_column :tour_activities, :finish_time

    add_column :tour_activities, :start_time, :datetime
    add_column :tour_activities, :finish_time, :datetime
  end
end
