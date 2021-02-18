class UpdateDurationFromActivities < ActiveRecord::Migration[6.0]
  def change
    remove_column :activities, :duration
    add_column :activities, :duration, :integer
  end
end
