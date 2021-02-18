class UpdateColumnFromActivities < ActiveRecord::Migration[6.0]
  def change
    change_column :activities, :requirements, :text
    change_column :activities, :description, :text
  end
end
