class AddHiddenToTourActivities < ActiveRecord::Migration[6.0]
  def change
    add_column :tour_activities, :hidden, :boolean, default: false
  end
end
