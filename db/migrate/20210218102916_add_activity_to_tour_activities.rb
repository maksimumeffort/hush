class AddActivityToTourActivities < ActiveRecord::Migration[6.0]
  def change
    add_reference :tour_activities, :activity, null: false, foreign_key: true
  end
end
